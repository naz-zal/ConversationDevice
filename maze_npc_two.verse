using { /Fortnite.com/AI }
using { /Verse.org/Simulation }
using { /Fortnite.com/Devices }
 
public_module<public> := module:
    var ConvMood<public>:weak_map(session, int) = map{}

var ConvRound:weak_map(session, int) = map{}

maze_npc_two := class(npc_behavior):

    @editable
    InteractButton: button_device = button_device{}

    @editable
    ConvTwo : conversation_device = conversation_device{}

    @editable
    ConvTwoAlt : conversation_device = conversation_device{}

    @editable
    DoorLock : lock_device = lock_device{}

    # This function runs when the NPC is spawned in the world and ready to follow a behavior.
    OnBegin<override>()<suspends>:void=
        # TODO: Replace this with your code
        InteractButton.InteractedWithEvent.Subscribe(AgentInteractButton)
        ConvTwo.OnConversationEvent.Subscribe(ConvDevTwoEventResponse)
        ConvTwoAlt.OnConversationEvent.Subscribe(ConvDevTwoAltEventResponse)

    AgentInteractButton(Agent: agent):void=
        
        if (IntExists := ConvRound[GetSession()]):
            if (IntExists = 2):
                ConvTwoAlt.InitiateConversation(Agent)

        else:
            ConvTwo.InitiateConversation(Agent)

    ConvDevTwoEventResponse(InAgent:agent, eventNumber : int):void=

        if (eventNumber = 1):
            if (set ConvRound[GetSession()] = 2):
                Print("Success")

        if (eventNumber = 2):
            DoorLock.Open(InAgent)
            if (set public_module.ConvMood[GetSession()] = 2):
                Print("Mood set to angry")


    ConvDevTwoAltEventResponse(InAgent:agent, eventNumber : int):void=

        if (eventNumber = 3):
            DoorLock.Open(InAgent)
            if (set public_module.ConvMood[GetSession()] = 3):
                Print("Mood set to happy")

    # This function runs when the NPC is despawned or eliminated from the world.
    OnEnd<override>():void=
        # TODO: Replace this with your code
        Print("Goodbye, NPC!")