using { /Fortnite.com/AI }
using { /Fortnite.com/Characters }
using { /Verse.org }
using { /Verse.org/Colors }
using { /Verse.org/Random }
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Fortnite.com/Animation/PlayAnimation }


npc_room_one := class(npc_behavior):

    # Reference to the conversation device
    @editable
    MyConvDev : conversation_device = conversation_device{}

    # Reference to the first lock
    @editable
    DoorLockOne : lock_device = lock_device{}

    # Reference to the second lock
    @editable
    DoorLockTwo : lock_device = lock_device{}

    OnBegin<override>()<suspends>:void=
        
	# Subscribe to events that occur during conversation
	# For more information on the conversation device, check: https://dev.epicgames.com/documentation/en-us/uefn/verse-api/fortnitedotcom/devices/conversation_device
        MyConvDev.OnConversationEvent.Subscribe(OnConversationEventResponse)

    OnConversationEventResponse(InAgent:agent, eventNumber : int):void=

	# event 1 is triggered when player makes a choice
        if (eventNumber = 1):
            OpenA()

	# event 2 is triggered when player makes the other choice
        else if (eventNumber = 2):
            OpenB()

    OpenA():void=

        if:

            Agent := GetAgent[]
            Character := Agent.GetFortCharacter[]

        then:

            DoorLockOne.Open(Agent)

        else:
            
            Print("Opening lock A didn't work!")

    OpenB():void=

        if:

            Agent := GetAgent[]
            Character := Agent.GetFortCharacter[]

        then:

            DoorLockTwo.Open(Agent)

        else:
            
            Print("Opening lock B didn't work!")
