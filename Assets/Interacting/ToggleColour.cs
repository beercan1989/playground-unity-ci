using TMPro;
using UnityEngine;

namespace Interacting
{
    [RequireComponent(typeof(SpriteRenderer))]
    public class ToggleColour : Interactable
    {
        [SerializeField] private Color first = Color.red;
        [SerializeField] private Color second = Color.yellow;

        private SpriteRenderer _spriteRenderer;

        protected void Awake()
        {
            _spriteRenderer = GetComponent<SpriteRenderer>();
            _spriteRenderer.color = first;
        }

        protected override void OnInteraction()
        {
            // Toggle colour
            Color colourToDisplay = _spriteRenderer.color == first ? second : first;
            
            // Updated display
            _spriteRenderer.color = colourToDisplay;
        }
    }
}