using UnityEngine;

namespace RedsOptionalTweaks.Utils
{
    /// <summary>
    /// A Unity component to add an Update method to an existing MonoBehaviour.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public abstract class UpdateComponent<T> : MonoBehaviour where T : MonoBehaviour, new()
    {
        /// <summary>
        /// The component ID for the new game object.
        /// Workaround for generic functions not being able to access static types without reflection.
        /// </summary>
        protected static string InternalComponentId { get; set; } = "Unknown UpdateComponent<T>";

        public string GetDefaultComponentId => InternalComponentId;

        /// <summary>
        /// The component that this UpdateComponent is attached to.
        /// </summary>
        public T Component { get; set; }

        public abstract void Update();

        public void OnDestroy()
        {
            Component = null;
        }

        /// <summary>
        ///  If the parent does not have this component, one will be created and attached to the parent.
        /// </summary>
        /// <typeparam name="U">A UpdateComponent<T> type class</typeparam>
        /// <param name="parent">The MonoBehaviour to add the component to</param>
        /// <returns>Null if the parent already has one of the components, or the newly created component.</returns>
        public static U CreateComponent<U>(T parent)
            where U : UpdateComponent<T>
        {
            if (parent.GetComponent<U>() != null) return null;

            U update = parent.gameObject.AddComponent<U>();
            update.name = update.GetDefaultComponentId;
            update.Component = parent;

            return update;
        }

    }
}
