using { /Fortnite.com/AI }
using { /Verse.org/Simulation }
using { /Fortnite.com/Devices }
 
# Getting started: https://www.epicgames.com/fortnite/en-US/creative/docs/uefn/Verse/onboarding-guide-to-programming-with-verse-in-unreal-editor-for-fortnite

# A Verse-authored NPC Behavior that can be used within an NPC Character Definition or an NPC Spawner device's NPC Behavior Script Override.
maze_npc_3A := class(npc_behavior):

    @editable
    InteractButton: button_device = button_device{}

    @editable
    ConvHappy : conversation_device = conversation_device{}

    @editable
    ConvAngry : conversation_device = conversation_device{}

    # This function runs when the NPC is spawned in the world and ready to follow a behavior.
    OnBegin<override>()<suspends>:void=
        # TODO: Replace this with your code
        InteractButton.InteractedWithEvent.Subscribe(AgentInteractButton)

    AgentInteractButton(Agent: agent):void=
        
        if (IntExists := public_module.ConvMood[GetSession()]):
            if (IntExists = 2):
                ConvAngry.InitiateConversation(Agent)

            else if (IntExists = 3):
                ConvHappy.InitiateConversation(Agent)