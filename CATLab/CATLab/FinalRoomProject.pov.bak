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
#declare DeskDrawerHeight = 20;
#declare DeskDrawerWidth = 34;
#declare SpaceBetweenDeskDrawers = 2;

//Curtain Variables
#declare curtainTubeLength = (RoomWidth/2) - 10;
#declare curtainTubeRadius = 3;

//Chair Variables
#declare ChairLegHeight = 42;
#declare ChairLegWidth = 2;
#declare ChairBackHeight = 40;
#declare ChairBackLength = 2;
#declare ChairWidth = 50;
#declare ChairBaseHeight = 4;
#declare ChairBaseLength = 50;
#declare ChairLegConnectorHeight = 4;
#declare ChairLegConnectorWidth = 2;
#declare ChairConnectorConnectorHeight = 2;
#declare ChairConnectorConnectorWidth = ChairWidth-(2*ChairLegConnectorWidth);

//Bookshelf Variables
#declare BookShelfHeight = 75;
#declare BookShelfWidth = 75;
#declare BookShelfLength = 25;
#declare BookShelfGapHeight = 30;
#declare DividerHeight = 4;
#declare GapSpaceFromTop = 7;
#declare GapDepth = 23;

//Mirror, Posters, Map, and Flag Variables
#declare SmallMirrorHeight = 50;
#declare SmallMirrorWidth = 36;
#declare TallMirrorHeight = 100;
#declare TallMirrorWidth = 36;
#declare MapHeight = 60;
#declare MapWidth = 90;
#declare PosterHeight = 50;
#declare PosterWidth = 35;
#declare FlagHeight = 90;
#declare FlagWidth = 150;
#declare smallMirrorDistanceFromGround = 135;
#declare tallMirrorDistanceFromGround = 80;
#declare postersDistanceFromGround = 140;
                                                                                       
                                                                                       
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
    translate<DeskDrawerWidth+0.75,DeskGapHeight,1>     
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
            #if (i=0)
                deskDrawer
                scale<1,1.5,>
                translate<0,0,1>
            #else
                deskDrawer
                //this seems really convoluted (and it is) but it was the only way I could get 
                //  the spacing between the drawers to look right
                #if (i=1)
                    translate<0,SpaceBetweenDeskDrawers*i + DeskDrawerHeight*i + 9.5,1>
                #else
                    translate<0,SpaceBetweenDeskDrawers*i + DeskDrawerHeight*i + 9,1>
                #end
            #end
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

//-----------------------------------Let's make the rolled up curtains! 
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
        scale<1,1.35,1>
    }
    object {
        curtainTube
        scale<1,0.67,1>
        translate<0,curtainTubeLength+57,0>
    }
    texture{pigment{color Orange}}
    rotate<0,0,90>
    translate<RoomWidth-2,WindowHeight+WindowDistanceFromGround,curtainTubeRadius>
}
//with little bar between windows!
#declare windowDivider = box {
    <0,0,0>
    <6,WindowHeight,2>
    translate<RoomWidth/3,WindowDistanceFromGround,1>
    texture{pigment{rgb <0.5,0.5,0.5>}}
}

//--------------------------------------------Let's make the chair!!!!
#declare ChairBase = box {
    <0,0,0>
    <ChairWidth,ChairBaseHeight,ChairBaseLength>
    texture{pigment{color Brown}}    
}
#declare ChairLeg = box {
    <0,0,0>
    <ChairLegWidth,ChairLegHeight,ChairLegWidth>
    texture{pigment{color Brown}}
}
#declare ChairBack = difference {
    box {
        <0,0,0>
        <ChairWidth,ChairBackHeight,ChairBackLength>
        texture{pigment{color Brown}}
    }
    cylinder {
        <0,0,0>
        <ChairWidth/2,0,0>
        4   //radius
        //rotate<0,0,90>
        scale 3/2
        translate<6,1.5,0>
        texture{pigment{rgbt<1,1,1,1>}}
    }
    translate<0,ChairLegHeight+ChairBaseHeight,ChairBaseLength-1.25>
}
#declare ChairLegConnector = box {
    <0,0,0>
    <ChairLegConnectorWidth,ChairLegConnectorHeight,ChairBaseLength - 2*ChairLegWidth>
    //translate<1,0,2> 
    texture{pigment{color Brown}}
}
#declare ChairConnectorConnector = box {
    <0,0,0>
    <ChairWidth-2*ChairLegConnectorWidth,ChairConnectorConnectorHeight,4>
    translate<0,1,ChairBaseLength/2>
    texture{pigment{color Brown}}
}
#declare Chair = union {
    object {
        ChairBase
        translate<0,ChairLegHeight,0>
    }
    object {
        ChairLeg
        translate<ChairWidth-ChairLegWidth,0,0>
    }
    object {
        ChairLeg
        translate<ChairWidth-ChairLegWidth,0,ChairBaseLength>
    }
    object {
        ChairLeg
        translate<1,0,0>
    }
    object {
        ChairLeg
        translate<1,0,ChairBaseLength>
    }
    object {
        ChairBack
    }
    object {
        ChairLegConnector
        translate<1,0,2>
    }
    object {
        ChairLegConnector
        translate<ChairWidth-2,0,2>
    }
    object {
        ChairConnectorConnector
    }
   //texture{pigment{color Brown}}
    translate<27.5+DeskDrawerWidth,0,littleWindowLedgeLength+DeskLength-20>
}

//-------------------------------------------Lets make the bookshelf!
#declare BookShelfBox = box {
    <0,0,0>
    <BookShelfWidth,BookShelfHeight,BookShelfLength>
    texture{pigment{color Brown}}
}
#declare GapBox = box {
    <0,0,0>
    <BookShelfWidth-2, BookShelfGapHeight, GapDepth>
    texture{pigment{rgbt<1,1,1,1>}}
}
#declare BookShelfDivider = box {
    <0,0,0>
    <BookShelfWidth,DividerHeight,BookShelfLength>
    translate<0,BookShelfGapHeight,0>
    texture{pigment{color Brown}}
}
#declare BookShelfOpen = difference {
    object {
        BookShelfBox
    }
    object {
        GapBox
        translate<1,2,4>
    }
    object {
        GapBox
        translate<1,BookShelfGapHeight+5,4>
    }
    //translate<150,1,100>
}
#declare BookShelf = union {
    object {
        BookShelfOpen
    }
    object {
        BookShelfDivider
    }
    rotate<0,90,0>
    translate<BookShelfLength,0.25,250>
}

//------------------------------Time for the mirrors, map, posters, and flag
#declare SmallMirror = box {
    <0,0,0>
    <SmallMirrorWidth,SmallMirrorHeight,2>
    translate<DoorWidth+7,smallMirrorDistanceFromGround,RoomLength-1>
    //texture{pigment{color White}}
}
#declare TallMirror = box {
    <0,0,0>
    <TallMirrorWidth,TallMirrorHeight+10,1>
    rotate<0,90,0>
    translate<RoomWidth-1,tallMirrorDistanceFromGround-15,RoomLength>
    //texture{pigment{color White}}
}
#declare Map = box {
    <0,0,0>
    <MapWidth,MapHeight,0.25>
    rotate<0,90,0>
    translate<0.5, postersDistanceFromGround-10, 150>
    texture{pigment{color Yellow}}
}
#declare Poster = box {
    <0,0,0>
    <PosterWidth,PosterHeight,0.25>
    rotate<0,90,0>
    texture{pigment{color Yellow}}
}
#declare Flag = box {
    <0,0,0>
    <FlagWidth,FlagHeight,0.5>
    rotate<0,90,0>
    translate<RoomWidth-0.75, postersDistanceFromGround-30, 200>
    texture{pigment{color Red}}
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
            texture{pigment{rgb<0.5,0.5,0.5>}}
        }
        texture {
            pigment {
                rgb<0.5,0.5,0.5>
            }
        }
    }
    object {
        Closet
        texture{pigment{rgb<0.5,0.5,0.5>}}
    }
    object {
        OpenDoor
        texture{pigment{rgb<0.5,0.5,0.5>}}
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
    object {
        windowDivider
    }
    object {
        Chair
    }
    object {
        BookShelf
    }
    object {
        SmallMirror
    }
    object {
        TallMirror
    }
    object {
        Map
    }
    object {
        Poster
        translate<0.5, postersDistanceFromGround,300>
    }
    object {
        Poster
        translate<RoomWidth - 0.5, postersDistanceFromGround-20,300>
    }
    object {
        Flag
    }
}

//-----------------------------------------------------------------------//

object {
    myRoom
}


