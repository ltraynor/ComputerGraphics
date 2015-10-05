
background {
    rgb<0,1,1>
}

//Dimension variables                      
#declare RoomHeight = 230;
#declare RoomWidth = 270;
#declare RoomLength = 380;

#declare HalfRoomWidth = RoomWidth/2;
#declare SeatedEyeHeight = 112;
#declare HalfRoomLength = RoomLength/2;

#declare dormRoom = box {
    <0,0,0>
    <RoomWidth, RoomHeight, RoomLength>
};


/*
#declare Windows = box {
    <,,>
    <,,>
}
*/


//Door Variables
#declare DoorHeight = 220;
#declare DoorWidth = 75;
#declare DoorDepth = 8;

//Closet Variables
#declare ClosetWidth = 150;
#declare ClosetDepth = 90;
#declare spaceBetweenDoorAndCloset = (RoomWidth - DoorWidth) - ClosetWidth;


//Let's make the door
#declare DoorDistanceFromRightWall = spaceBetweenDoorAndCloset + ClosetWidth;
#declare DoorwayCutout = box {
    <0,0,-DoorDepth>
    <DoorWidth, DoorHeight, DoorDepth>
    translate<RoomWidth-DoorDistanceFromRightWall-70,0.5,RoomLength>
};


//Let's make the closet
#declare ClosetBox = box {
    <0,0,0>
    <ClosetWidth,RoomHeight,ClosetDepth>
    translate<RoomWidth-ClosetWidth,0,RoomLength>  
}
/*#declare ClosetCutoutWall = box {
    <0,0,0>
    <ClosetWidth,RoomHeight,DoorDepth>
    translate<0,0,-ClosetDepth/2>    
}
#declare Closet = difference {
    object {
        ClosetBox
    }
    object {
        ClosetCutoutWall
    }
    translate<RoomWidth-ClosetWidth,0,RoomLength>        
}*/ 


//Let's make the window
#declare WindowHeight = 105;
#declare WindowDistanceFromGround = 90;
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
    location Margaret
    look_at Justin
    //location Justin
    //look_at Margaret
}

//light source
light_source {
    <HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
    rgb<1,1,1>
}





//the room
union {
    difference {
        object {
            dormRoom
            scale 1.01
        }
        object {
            dormRoom
        }
        object {
            DoorwayCutout
        }
        object {
            WindowCutout
        } 
        ClosetBox
        texture {
            pigment {
                rgb<1,1,1>
            }
        }
    }
    object {
        ClosetBox
        texture {
            pigment {
                rgb<1,0,1>
            }
        }
    }
}
 
/* 
difference {
    object {
        dormRoom
        scale 1.01
    }
    object {
        dormRoom
    }
    object {
        DoorwayCutout
    }
    object {
        WindowCutout
    } 
    object {
        ClosetBox
    }
    texture {
        pigment {
            rgb<1,1,1>
        }
    }
}
*/   


/*
object {
    Closet
    texture {
        pigment {
            rgb<1,1,1>
        }
    }
}
*/ 