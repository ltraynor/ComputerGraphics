
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
#declare DoorHeight = 228;
#declare DoorWidth = 75;
#declare DoorDepth = 4;

//Closet Variables
#declare ClosetWidth = 150;
#declare ClosetDepth = 90;
#declare spaceBetweenDoorAndCloset = (RoomWidth - DoorWidth) - ClosetWidth;


//Let's make the door 
//this is the threshold
#declare DoorDistanceFromRightWall = spaceBetweenDoorAndCloset + ClosetWidth;
#declare DoorwayCutout = box {
    <0,0,-DoorDepth>
    <DoorWidth, DoorHeight, DoorDepth>
    translate<RoomWidth-DoorDistanceFromRightWall-73,0.5,RoomLength>
};

//this is the actual door
#declare OpenDoor = object {
    DoorwayCutout
    translate<-(RoomWidth-DoorDistanceFromRightWall-73),-0.5,-RoomLength>
    rotate<0,60,0>
    translate<RoomWidth-DoorDistanceFromRightWall-73,0.5,RoomLength>
    texture {
        pigment {
            rgb<1,1,1>
        }
    }
};


/*
#declare OpenDoor2 = box {
    <0,0,-DoorDepth>
    <DoorWidth-2,DoorHeight-1,DoorDepth>
    rotate<0,0,0>
    translate<RoomWidth-DoorDistanceFromRightWall-72,0.5,RoomLength>
    texture {
        pigment {
            rgb<1,1,1>
        }
    }
}
*/


//Let's make the closet
#declare ClosetBox = box {
    <0,0,0>
    <ClosetWidth,RoomHeight,ClosetDepth>
    //translate<RoomWidth-ClosetWidth,0,RoomLength>  
}
#declare ClosetCutoutWall = box {
    <0,0,0>
    <ClosetWidth-5.25,RoomHeight-1,ClosetDepth>
    translate<0,0,0>    
}
#declare Closet = difference {
    object {
        ClosetBox
        texture {
            pigment {
                rgb<1,1,1>
            }
        }
    }
    object {
        ClosetCutoutWall
        texture {
            pigment {
                rgb<1,1,1>
            }
        }
        translate<5,0.5,-5>
    }
    translate<RoomWidth-ClosetWidth,0,RoomLength>
    //translate <RoomWidth-300, 0, RoomLength>        
} 


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
    //location<HalfRoomWidth+50,SeatedEyeHeight+50,40>
    //look_at<100,100,500>
}

//light source
light_source {
    <HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
    rgb<1,1,1>
}

light_source {
    <HalfRoomWidth,500,HalfRoomLength>
    rgb<1,1,1>
}



/*
//the room
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
        Closet
    }
     texture {
        pigment {
            rgb<1,1,1>
        }
    }
}
*/ 
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
        object {
            ClosetCutoutWall
            translate<RoomWidth-ClosetWidth,0,RoomLength>
            translate<5,0.5,-5>
        }
        texture {
            pigment {
                rgb<1,1,1>
            }
        }
    }
    object {
        Closet
    }
    object {
        OpenDoor
    }
}

/*
difference {
    object {
        ClosetBox
        texture {
            pigment {
                rgb<1,1,1>
            }
        }
        translate <RoomWidth-300, 0, RoomLength>
    }

    object {
        ClosetCutoutWall  
        texture {
            pigment {
                rgb<1,1,1>
            }
        } 
        translate <RoomWidth-300, 0, RoomLength> 
        translate<5,0.5,-5>
    }
}
*/
