﻿namespace reservieren.Services
{
    using Akka.Actor;

    /// <summary>
    /// Wrapper class to pass a dedicated actorRef into a controller,
    /// with the dotnet mvc dependency injection.
    /// </summary>
    public class EventConnectionHolderActorRefActorRef : IEventConnectionHolderActorRef
    {
        private readonly IActorRef EventConnectionHolderActorWrapper;

        public EventConnectionHolderActorRefActorRef(IActorRef pEventConnectionHolderActorWrapper) => 
                EventConnectionHolderActorWrapper = pEventConnectionHolderActorWrapper;

        public IActorRef GetActorRef() => EventConnectionHolderActorWrapper;
    }
}
