using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UnityEngine;
using UnityEngine.UI;

namespace RedsOptionalTweaks.Utils
{

    /// <summary>
    /// A utility to create a white mask given a source image.
    /// It supports readonly textures.
    /// </summary>
    internal static class WhiteMaskUtils
    {
        public static Sprite CreateMaskedSprite(Image sourceImage)
        {
            // Get the original texture
            Texture2D sourceTex = sourceImage.sprite.texture;

            // Generate the mask
            Texture2D whiteMaskTex = GenerateWhiteMask(sourceTex);

            // Create a new sprite from the mask texture
            Sprite maskSprite = Sprite.Create(
                whiteMaskTex,
                new Rect(0, 0, whiteMaskTex.width, whiteMaskTex.height),
                new Vector2(0.5f, 0.5f) // Pivot at center
            );

            return maskSprite;
        }

        /// <summary>
        /// Given a Texture, creates a new Texture where all non-black pixels are turned white,
        /// </summary>
        /// <param name="source"></param>
        /// <returns></returns>
        private static Texture2D GenerateWhiteMask(Texture2D source)
        {
            // 1. Create a readable copy of the texture (handles Read/Write Disabled)
            Texture2D readableTex = GetReadableTexture(source);

            // Disable filtering to prevent anti-aliasing/blending
            readableTex.filterMode = FilterMode.Point;

            // 2. Modify pixels to be white while preserving alpha
            Color[] pixels = readableTex.GetPixels();
            for (int i = 0; i < pixels.Length; i++)
            {

                //Retain black
                if (pixels[i].Equals(Color.black))
                {
                    pixels[i] = Color.black;
                }
                // Only process if the pixel has some visibility
                else if (pixels[i].a > 0)
                {
                    // Set RGB to white (1,1,1), keep original Alpha
                    pixels[i] = new Color(1f, 1f, 1f, pixels[i].a);
                }
            }

            // 3. Apply changes to the texture
            readableTex.SetPixels(pixels);
            readableTex.Apply();

            return readableTex;
        }

        /// <summary>
        /// Helper to copy a Texture2D even if the texture was compiled as readonly.  
        /// By default textures are created as readonly via the Unity IDE.
        /// </summary>
        private static Texture2D GetReadableTexture(Texture2D source)
        {
            // Create a temporary RenderTexture of the same size
            RenderTexture renderTex = RenderTexture.GetTemporary(
                source.width,
                source.height,
                0,
                RenderTextureFormat.Default,
                RenderTextureReadWrite.Linear);

            // Blit the pixels from the source to the RenderTexture
            Graphics.Blit(source, renderTex);

            // Backup the currently active RenderTexture
            RenderTexture previous = RenderTexture.active;

            // Set the current RenderTexture to our temporary one
            RenderTexture.active = renderTex;

            // Create a new readable Texture2D
            Texture2D readableText = new Texture2D(source.width, source.height);

            // Read the pixels from the RenderTexture into the new Texture2D
            readableText.ReadPixels(new Rect(0, 0, renderTex.width, renderTex.height), 0, 0);
            readableText.Apply();

            // Restore the active RenderTexture and release the temporary one
            RenderTexture.active = previous;
            RenderTexture.ReleaseTemporary(renderTex);

            return readableText;
        }
    }
}
