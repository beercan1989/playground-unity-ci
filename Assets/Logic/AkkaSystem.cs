using Akka.Actor;
using UnityEngine;

namespace Logic
{
    public class AkkaSystem : MonoBehaviour
    {
        private ActorSystem _system;
        
        private void Awake()
        {
            _system = ActorSystem.Create(name);
        }

        public IActorRef CreateActor(Props actorProps, string actorName = null)
        {
            return _system.ActorOf(actorProps, actorName);
        }
    }
}
