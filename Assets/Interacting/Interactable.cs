using UnityEngine;

namespace Interacting
{
    
    [RequireComponent(typeof(Collider2D))]
    public abstract class Interactable : MonoBehaviour
    {
        protected abstract void OnInteraction();
        
        private void OnMouseDown()
        {
            OnInteraction();
        }
    }
}