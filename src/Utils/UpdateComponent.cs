using UnityEngine;

namespace RedsOptionalTweaks.Utils
{
    public abstract class UpdateComponent<T> : MonoBehaviour where T : MonoBehaviour
    {

        public T Component { get; set; }

        public abstract void Update();

        public void OnDestroy()
        {
            Component = null;
        }

    }

}
