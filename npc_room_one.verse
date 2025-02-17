using { /Fortnite.com/AI }
using { /Fortnite.com/Devices }
using { /Verse.org/Simulation }

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

    OnConversationEventResponse(InAgent: agent, eventNumber: int):void=

	# event 1 is triggered when player chooses science
        if (eventNumber = 1):
	    Print("Science chosen")
            OpenDoorOne(InAgent)

	# event 2 is triggered when player chooses philosophy
        else if (eventNumber = 2):
	    Print("Philosophy chosen")
            OpenDoorTwo(InAgent)

    OpenDoorOne(Agent: agent):void=
	
	DoorLockOne.Open(Agent)

    OpenDoorTwo(Agent: agent):void=

	DoorLockTwo.Open(Agent)

