using Akka.Actor;
using Logic;
using TMPro;
using UnityEngine;

namespace Interacting
{
    [RequireComponent(typeof(SpriteRenderer))]
    public class ToggleColour : Interactable
    {
        [SerializeField] private Color first = Color.red;
        [SerializeField] private Color second = Color.yellow;
        [SerializeField] private AkkaSystem akkaSystem;
        [SerializeField] private TextMeshProUGUI textField;

        private IActorRef _textFieldActor;
        private SpriteRenderer _spriteRenderer;

        protected void Awake()
        {
            _spriteRenderer = GetComponent<SpriteRenderer>();
            _spriteRenderer.color = first;

            // Setup simple actor
            _textFieldActor = akkaSystem.CreateActor(ColourToTextUntypedActor.Props(textField));
        }

        protected override void OnInteraction()
        {
            // Toggle colour
            Color colourToDisplay = _spriteRenderer.color == first ? second : first;
            
            // Updated display
            _spriteRenderer.color = colourToDisplay;
            
            // Tell text field actor about the change
            _textFieldActor.Tell(new ColourToTextUntypedActor.ColourChanged(colourToDisplay));
        }
    }
}