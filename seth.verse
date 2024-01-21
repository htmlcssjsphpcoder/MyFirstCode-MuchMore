    @editable
    Trigger : trigger_device = trigger_device{}
 
    @editable
    Level : cinematic_sequence_device = cinematic_sequence_device{}
 
 
    OnBegin<override>()<suspends>:void=
        Trigger.TriggeredEvent.Subscribe(StartLevel)
 
 
    StartLevel( Agent: ?agent) : void=
        if (PlayerAgent:= Agent?, FortChar := PlayerAgent.GetFortCharacter[]):
            FortChar.PutInStasis(stasis_args{AllowTurning := true, AllowFalling:= true, AllowEmotes := true})
            spawn:
                LevelSeq(FortChar)
 
 
    LevelSeq(FortChar : fort_character)<suspends>:void=
        Level.Play()
        Sleep(1000.0)
        Level.Stop()
        FortChar.ReleaseFromStasis()