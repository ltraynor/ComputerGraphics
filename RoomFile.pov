
background {
    rgb<0,1,1>
}

//Dimension variables                      
#declare RoomWidth = 632;
#declare RoomHeight = 335;
#declare RoomLength = 1016;

#declare HalfRoomWidth = RoomWidth/2;
#declare SeatedEyeHeight = 112;
#declare HalfRoomLength = RoomLength/2;


#declare CATLab = box {
    <0,0,0>
    <RoomWidth, RoomHeight, RoomLength>
};


/*
#declare Windows = box {
    <,,>
    <,,>
}
*/


//Door Stuff
#declare DoorWidth = 91;
#declare DoorHeight = 236;
#declare DoorDepth = 16;
#declare DoorDistanceFromRightWall = 188;
#declare DoorwayCutout = box {
    <0,0,-DoorDepth>
    <DoorWidth, DoorHeight, DoorDepth>
    translate<RoomWidth-DoorDistanceFromRightWall,0,RoomLength>
};



#declare WindowHeight = 150.5;
#declare WindowDistanceFromGround = 89;
#declare WindowCutout = box {
    <0,0,-DoorDepth/2>
    <RoomWidth,WindowHeight,DoorDepth/2>
    translate<0,WindowDistanceFromGround,0>
}


//Margaret
#declare Margaret = <HalfRoomWidth, SeatedEyeHeight, 40>;
                                                               
//Justin                                                               
#declare Justin = <HalfRoomWidth, SeatedEyeHeight, RoomLength>;

//camera
camera {
    location <30,100,160>
    look_at <0,0,0>
}

//light source
light_source {
    <HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
    rgb<1,1,1>
}


////////////////////////////////////////////////////////////////////////////
//couch stuff
#declare armRestWidth = 23.5;
#declare armRestLength = 89;
#declare armRestHeight = 49;

#declare seatCushionWidth = 35;
#declare seatCushionLength = 27;
#declare seatCushionHeight = 15;

#declare frameHeight = 65;
#declare frameBottomHeight = 23;
#declare frameBottomWidth = (2*seatCushionWidth);
#declare backCushionHeight = 38;

#declare couchTexture = texture {
    pigment {
        rgb<1,1,1>
    }
}

#declare frameBottomBox = box {
    <0,0,0>
    <frameBottomWidth,frameBottomHeight,seatCushionLength>
    texture {
        couchTexture
    }
}

#declare frameBackBox = box {
    <0,0,0>
    <frameBottomWidth,seatCushionLength,frameBottomHeight> 
    texture {
        couchTexture
    }
}

#declare seatCushion = box {
    <0,0,0>
    <seatCushionWidth, seatCushionHeight, seatCushionLength>
    texture {
        couchTexture
    }
}

#declare backCushion = box {
    <0,0,0>
    <seatCushionWidth, seatCushionLength, seatCushionHeight>
   texture {
        couchTexture
    }
}

#declare armRest = box {
    <0,0,0>
    <armRestWidth, armRestHeight, armRestLength>
    texture {
        couchTexture
    }
}




union {
    object {
        frameBottomBox
    }
    object {
        frameBackBox
        translate<0,0,(seatCushionLength/2)>
    }
    object {
        armRest
        translate<seatCushionWidth,0,0>
    }
    object {
        armRest
        translate<-seatCushionWidth,0,0>
    }
    object {
        seatCushion
        translate<(seatCushionWidth/2),(frameBottomHeight + 1), 0>
    }
    object {
        seatCushion
        translate<(-seatCushionWidth/2),(frameBottomHeight + 1), 0>
    }
    object {
        backCushion
        translate<(seatCushionWidth/2), (frameBottomHeight + seatCushionHeight),((seatCushionLength/2) - frameBottomHeight)>
    } 
    object {
        backCushion
        translate<(-seatCushionWidth/2), (frameBottomHeight + seatCushionHeight),((seatCushionLength/2) - frameBottomHeight)>
    }
}

/*
//the room
difference {
    object {
        CATLab
        scale 1.01
    }
    object {
        CATLab
    }
    object {
        DoorwayCutout
    }
    object {
        WindowCutout
    }
    texture {
        pigment {
            rgb<1,1,1>
        }
    }
}*/ 