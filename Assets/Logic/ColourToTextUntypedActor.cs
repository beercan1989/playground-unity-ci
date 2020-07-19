using Akka.Actor;
using TMPro;
using UnityEngine;

namespace Logic
{
    public class ColourToTextUntypedActor : UntypedActor
    {
        private readonly TextMeshProUGUI _textField;

        private ColourToTextUntypedActor(TextMeshProUGUI textField)
        {
            _textField = textField;
        }
        
        public class ColourChanged
        {
            public readonly Color Colour;

            public ColourChanged(Color colour)
            {
                Colour = colour;
            }
        }
        
        protected override void OnReceive(object message)
        {
            switch (message)
            {
                case ColourChanged changed:
                    _textField.text = changed.Colour.ToString();
                    _textField.color = changed.Colour;
                    break;
            }
        }
        
        public static Props Props(TextMeshProUGUI textField)
        {
            return Akka.Actor.Props.Create(() => new ColourToTextUntypedActor(textField));
        }
    }
}