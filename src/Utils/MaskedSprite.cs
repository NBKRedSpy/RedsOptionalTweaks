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
    /// Creates a masked sprite from an original image and a masked color.
    /// Provides methods to swap between the original image and the masked image.  
    /// Also allows changing the masked image's color on the fly.
    /// </summary>
    public class MaskedSprite
    {

        /// <summary>
        /// The images original color.  This is usually white as the sprite's colors are usually by the texture.
        /// </summary>
        private Color OriginalColor { get; set; }

        /// <summary>
        /// The original sprite.
        /// </summary>
        private Sprite OriginalSprite { get; set; }

        /// <summary>
        /// The color to apply to the masked version.  Use this to change the custom image's color
        /// on the fly.
        /// </summary>
        public Color MaskedColor { get; set; }

        /// <summary>
        /// The masked sprite.  It is a white version of the original sprite that retains
        /// the original image's alpha channel and black.  This allows the user to change   
        /// the color on the fly via the MaskedColor.
        /// </summary>
        private Sprite WhiteMaskedSprite { get; set; }

        public MaskedSprite(Image originalImage, Color maskedColor)
        {
            //HostImage = originalImage;
            OriginalColor = originalImage.color;
            OriginalSprite = originalImage.sprite;
            MaskedColor = maskedColor;

            WhiteMaskedSprite = WhiteMaskUtils.CreateMaskedSprite(originalImage);
        }

        /// <summary>
        /// Set either the original image, or the new masked image with the masked color.
        /// </summary>
        /// <param name="originalImage"></param>
        /// <param name="maskedColor"></param>
        public void ApplyMask(Image hostImage, bool useOriginal)
        {
            hostImage.sprite = useOriginal ? OriginalSprite : WhiteMaskedSprite;
            hostImage.color = useOriginal ? OriginalColor : MaskedColor;
        }
        
    }
}
