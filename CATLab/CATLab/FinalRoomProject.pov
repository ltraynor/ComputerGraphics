#include "colors.inc"
 
background {
    rgb<0,1,1>
}


/////////////////////////////////////////////////////////////////////////////////
//variables, variables, variables

//Dimension variables                      
#declare RoomHeight = 230;
#declare RoomWidth = 270;
#declare RoomLength = 380;

#declare HalfRoomWidth = RoomWidth/2;
#declare SeatedEyeHeight = 112;
#declare HalfRoomLength = RoomLength/2;

//make the shell of the room
#declare dormRoom = box {
    <0,0,0>
    <RoomWidth, RoomHeight, RoomLength>
};


//Door Variables
#declare DoorHeight = 228;
#declare DoorWidth = 75;
#declare DoorDepth = 4;

//Closet Variables
#declare ClosetWidth = 150;
#declare ClosetDepth = 90;
#declare spaceBetweenDoorAndCloset = (RoomWidth - DoorWidth) - ClosetWidth;

//Window Variables
#declare WindowHeight = 105;
#declare WindowDistanceFromGround = 90;

//Radiator Variables
#declare RadiatorHeight = 65;
#declare RadiatorDistanceFromGround = 20;
#declare RadiatorSlitsHeight = 10; //may not get to these it seems tough
#declare RadiatorSlitsWidth = 4;

//Window Ledge Variables
#declare littleWindowLedgeHeight = 2;
#declare littleWindowLedgeLength = 16;
  
//Desk Variables
#declare DeskHeight = 75;
#declare DeskWidth = 105;
#declare DeskLength = 60;
#declare DeskGapHeight = 65;
#declare DeskGapWidth = 65;
#declare DeskGapDrawerHeight = 8;
#declare DeskDrawerHeight = 17;
#declare DeskDrawerWidth = 36;
#declare SpaceBetweenDeskDrawers = 2;

//Curtain Variables
#declare curtainTubeLength = (RoomWidth/2) - 10;
#declare curtainTubeRadius = 2;
                                                                                       
                                                                                       
///////////////////////////////////////////////////////////////////////////////////////
//define individual components of room 
 
 
//------------------------------------------Let's make the door 
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


//--------------------------------------------Let's make the closet
#declare ClosetBox = box {
    <0,0,0>
    <ClosetWidth,RoomHeight,ClosetDepth>  
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
} 


//----------------------------------------Let's make the window
#declare WindowCutout = box {
    <0,0,-DoorDepth/2>
    <RoomWidth,WindowHeight,DoorDepth/2>
    translate<0,WindowDistanceFromGround,0>
}


//-------------------Let's make the little ledge under the window
#declare littleWindowLedge = box {
    <0,0,0>
    <RoomWidth,littleWindowLedgeHeight,littleWindowLedgeLength>
    texture {
        pigment {
            rgb<0.7,0.7,0.7>
        }
    }
    translate<0,WindowDistanceFromGround,0>
} 

//-------------------------------------Let's make the radiator
#declare Radiator = box {
    <0,0,0>
    <RoomWidth,RadiatorHeight,littleWindowLedgeLength - 1>
    texture {
        pigment {
            rgb<1,1,1>
        }
    }
    translate<0,RadiatorDistanceFromGround,0>
}

//-----------------------------------Let's make the desk!
#declare deskBox = box {
        <0,0,0>
        <DeskWidth,DeskHeight,DeskLength>
        texture {
            pigment {  
                rgb <0,1,0>
            }
            
        }        
}
#declare deskGap = box {
    <0,0,0>
    <DeskGapWidth, DeskGapHeight+DeskGapDrawerHeight, DeskLength>
}
#declare deskCutout = difference {
    object {
        deskBox
    }
    object {
        deskGap
        translate<DeskDrawerWidth,0,0>
        texture {
            pigment {
                rgbt<1,1,1,1>
            }
        }
    }
}
#declare deskGapDrawer = difference {
    box {
        <0,0,0>
        <DeskGapWidth-1,DeskGapDrawerHeight,DeskLength>
        texture { pigment {color Red}}
    }
    box {
        <0,0,0>
        <(DeskGapWidth/3)*2, DeskGapDrawerHeight/2, DeskLength>
        texture { pigment{ rgbt<1,1,1,1>}}
        translate<DeskGapWidth/6,DeskGapDrawerHeight/2,0>
    }
    translate<DeskDrawerWidth,DeskGapHeight,1>     
}
#declare deskDrawer = box {
    <0,0,0>
    <DeskDrawerWidth-1,DeskDrawerHeight,DeskLength>
    texture {pigment {color Red}}
}
#declare deskDrawers = union {
    #declare i = 0;
    #while (i<3) 
        object {
            deskDrawer
            translate<0,SpaceBetweenDeskDrawers*i + DeskDrawerHeight*i + 2,1>
        }
        #declare i = i + 1;
    #end    
}

#declare Desk = union {
    object {
        deskCutout
    }
    object {
        deskGapDrawer
    }
    object {
        deskDrawers
    }
    translate<20,0,littleWindowLedgeLength+2>
}

//-------------------Let's make the rolled up curtains! 
#declare curtainTube = cylinder {
    <0,0,0>
    <0,curtainTubeLength,0>
    curtainTubeRadius
    texture{pigment{color Orange}}
    //rotate<0,0,90>
    //translate<RoomWidth-2,WindowHeight+WindowDistanceFromGround,curtainTubeRadius>
}
#declare Curtains = union {
    object {
        curtainTube
    }
    object {
        curtainTube
        translate<0,curtainTubeLength+15,0>
    }
    texture{pigment{color Orange}}
    rotate<0,0,90>
    translate<RoomWidth-2,WindowHeight+WindowDistanceFromGround,curtainTubeRadius>
}


//////////////////////////////////////////////////////////////////////////////
//lights, camera, but no action :(
  
  
//Look at the window, camera must be by the door
#declare WindowView = <HalfRoomWidth, SeatedEyeHeight, 40>;
                                                               
//Look at the door, camera must be by the window                                                               
#declare DoorwayView = <HalfRoomWidth, SeatedEyeHeight, RoomLength>;

//camera
camera {
    //location WindowView
    //look_at DoorwayView
    location DoorwayView
    look_at WindowView 
    //location<100,20,100>
    //look_at<10,10,10>
}

//light source
light_source {
    <HalfRoomWidth,SeatedEyeHeight,HalfRoomLength>
    rgb<1,1,1>
}

light_source {
    <HalfRoomWidth,100,HalfRoomLength>
    rgb<1,1,1>
}
 
 

/////////////////////////////////////////////////////////////////////////////
//define the room with everything in it

 
#declare myRoom = union { 
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
                rgb<0.55,0.55,0.55>
            }
        }
    }
    object {
        Closet
    }
    object {
        OpenDoor
    }
    object {
        littleWindowLedge
    }
    object {
        Radiator
    }
    object {
        Desk
    }
    object {
        Curtains
    }
}

//-----------------------------------------------------------------------//

object {
    myRoom
}


