#include "colors.inc"
#include "shapes.inc"
#include "treeFile.inc"
 
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
#declare SmallMirrorDistanceFromGround = 135;
#declare TallMirrorDistanceFromGround = 80;
#declare PostersDistanceFromGround = 140;

//Bed Variables
#declare BedWidth = 105;
#declare BedLength = 205;
#declare MattressHeight = 15;
#declare MetalFrameHeight = 6;
#declare BedDistanceFromGround = 52;
#declare FramePostHeight = 85;
#declare FramePostWidth = 6;
#declare PostCylinderHeight = 3;
#declare PostCylinderRadius = 2;
#declare FrameBarLength = 2;
#declare FrameBarHeight = 8;
#declare FrameBarGapSpace = 24;
#declare PillowWidth = 70;
#declare PillowHeight = 10;
#declare PillowLength = 40;
                                                                                       


///////////////////////////////////////////////////////////////////////////////////////
//the textures for the components of the room

//texture for the Walls and Closet
#declare WallTexture = texture {
    uv_mapping pigment{image_map{jpeg "WallTexture.jpg"}}
    scale 0.005
}

//texture for Desk, Chair, BookShelf, and WoodenBedFrame
#declare WoodTexture = texture {
    pigment {
        #declare colorMap = color_map {
            [0 rgb<0.6,0.4,0.1>]
            [1.0 rgb<1,0.8,0.6>]
        }
        wood
        turbulence 0.1
    }
    scale 4
}
#declare WoodTexture2 = texture {
    pigment {
        #declare colorMap2 = color_map {
            [0 rgb<1,1,1>]
            [1.0 rgb<1,0.8,0.6>]
        }
        wood
        turbulence 0.1
    }
    scale 4
}

//texture for blanket and one pillow
#declare BlanketTexture = texture {
    pigment {
        #declare blanketMap = color_map {
            //[0 rgb<0.25,0.25,0.25>]
            [0 color White]
            //[0.4 rgb<0.25,0.25,0.25>]
            //[0.41 rgb<0.8,0.4,0>]
            //[0.6 rgb<0.8,0.4,0>]
            [0.6 color White]
            [0.61 rgb<0.25,0.25,0.25>]
            [0.7 rgb<0.25,0.25,0.25>]
            [0.71 rgb<1,1,1>]
            [0.8 rgb<1,1,1>]
            [0.81 rgb<0.25,0.25,0.25>]
            //[1.0 rgb<0.25,0.25,0.25>]
            [1.0 color White]
            
        }
        scale 1
    }
}
                                                                                       
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
    rotate<0,2,0>
    translate<RoomWidth-DoorDistanceFromRightWall-73,0.5,RoomLength>
    texture {
        pigment { 
            rgb<0.75,0.75,0.75>
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
    }
    object {
        ClosetCutoutWall
        translate<5,0.5,-5>
    }
    texture {
            WallTexture
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
        WallTexture
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
        texture{WoodTexture2}
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
        texture{WoodTexture2}
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
    texture{WoodTexture2}
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
    texture{WoodTexture2}    
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
    texture{WoodTexture2}
}

//-----------------------------------Let's make the rolled up curtains! 
#declare curtainTube = cylinder {
    <0,0,0>
    <0,curtainTubeLength,0>
    curtainTubeRadius
    texture{pigment{color White}}
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
    texture{WallTexture}
}

//--------------------------------------------Let's make the chair!!!!
#declare ChairBase = object { 
    Round_Box_Union (
        <ChairWidth,0,0>
        <0,ChairBaseHeight,ChairBaseLength>
        1
    )
    texture{WoodTexture2}    
}
#declare ChairLeg = box {
    <0,0,0>
    <ChairLegWidth+1,ChairLegHeight,ChairLegWidth+1>
    texture{WoodTexture2}
}
#declare ChairBack = difference {
    object {
        Round_Box_Union (
            <ChairWidth,0,0>
            <0,ChairBackHeight,ChairBackLength>
            1
        )
        texture{WoodTexture2}
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
    texture{WoodTexture2}
}
#declare ChairConnectorConnector = box {
    <0,0,0>
    <ChairWidth-2*ChairLegConnectorWidth,ChairConnectorConnectorHeight,4>
    translate<0,1,ChairBaseLength/2>
    texture{WoodTexture2}
}
#declare Chair = union {
    object {
        ChairBase
        translate<0,ChairLegHeight,0>
    }
    object {
        ChairLeg
        translate<ChairWidth-ChairLegWidth-1,0,0>
    }
    object {
        ChairLeg
        translate<ChairWidth-ChairLegWidth-1,0,ChairBaseLength>
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
   //texture{WoodTexture}
    translate<27.5+DeskDrawerWidth,0,littleWindowLedgeLength+DeskLength-20>
}

//-------------------------------------------Lets make the bookshelf!
#declare BookShelfBox = box {
    <0,0,0>
    <BookShelfWidth,BookShelfHeight,BookShelfLength>
    texture{WoodTexture}
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
    texture{WoodTexture}
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
#declare SmallMirrorGlass = box {
    <0,0,0>
    <SmallMirrorWidth,SmallMirrorHeight,1>
    translate<DoorWidth+8,SmallMirrorDistanceFromGround,RoomLength-1>
    //texture{pigment{color White}}
}
#declare SmallMirrorFrame = union {
    box {
        <0,0,0>
        <SmallMirrorWidth+2,2,2>
        translate<DoorWidth+6,SmallMirrorDistanceFromGround+SmallMirrorHeight,RoomLength-2>
    }
    box {
        <0,0,0>
        <SmallMirrorWidth,2,2>
        translate<DoorWidth+8,SmallMirrorDistanceFromGround,RoomLength-2>
    }
    box {
        <0,0,0>
        <2,SmallMirrorHeight,2>                                         
        translate<DoorWidth+6,SmallMirrorDistanceFromGround,RoomLength-2>
    }
    box {
        <0,0,0>
        <2,SmallMirrorHeight,2>
        translate<DoorWidth+6+SmallMirrorWidth,SmallMirrorDistanceFromGround+2,RoomLength-2>
    }
    texture{pigment{color Brown}}
}
#declare SmallMirror = union {
    object {
        SmallMirrorGlass
    }
    object {
        SmallMirrorFrame
    }
    translate<1.5,0,0>
}
#declare TallMirror = box {
    <0,0,0>
    <TallMirrorWidth,TallMirrorHeight+10,1>
    rotate<0,90,0>
    translate<RoomWidth-1,TallMirrorDistanceFromGround-15,RoomLength>
    //texture{pigment{color White}}
}
#declare Map = box {
    <0,0,0>
    <MapWidth,MapHeight,0.25>
    rotate<0,90,0>
    translate<0.5, PostersDistanceFromGround-10, 150>
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
    translate<RoomWidth-0.75, PostersDistanceFromGround-30, 200>
    texture{pigment{color Red}}
}

//---------------------------The bed: the hardest part of the room besides the tree
//the metal frame
#declare MetalFrameBox = box {
    <0,0,0>
    <BedWidth+5,MetalFrameHeight,BedLength>
    texture{pigment{color Black}}
}
#declare MetalFrameCutout = box {
    <0,0,0>
    <BedWidth-12,MetalFrameHeight+10,BedLength-15>
    translate<3.5,-5,5>
    texture{pigment{rgbt<1,1,1,1>}}
}
#declare MetalFrameCylinder = cylinder {
    <0,0,0>
    <BedWidth-10,0,0>
    1
}
#declare MetalFrameCylinders = union {
    #declare i = 20;
    #while (i<BedLength-20)
        object {
            MetalFrameCylinder
            translate<0,0,i>
        }
        #declare i = i + 20;
    #end
    translate<0,7,5>
    texture{pigment{color Black}}    
}
#declare MetalFrameFrame = difference {
    object {
        MetalFrameBox
    }
    object {
        MetalFrameCutout
    }
}
#declare MetalFrame = union {
    object {
        MetalFrameFrame
    }
    object {
        MetalFrameCylinders
    } 
    translate<RoomWidth-BedWidth-12,BedDistanceFromGround,littleWindowLedgeLength+11>
}
//the WoodenFrame
#declare FramePostBar = box {
    <0,0,0>
    <FramePostWidth,FramePostHeight,FramePostWidth>
}
#declare FramePostCylinder = cylinder {
    <0,0,0>
    <0,PostCylinderHeight,0>
    PostCylinderRadius
}
#declare FramePost = union {
    object {
        FramePostBar
    }
    object {
        FramePostCylinder
        translate<3,FramePostHeight,3>
    }
}
#declare FrameBar = box {
    <0,0,0>
    <BedWidth,FrameBarHeight,FrameBarLength>
}
#declare Frame = union {
    object {
        FramePost
        //translate<RoomWidth-BedWidth-15,0,BedLength+littleWindowLedgeLength+5+FramePostWidth>
        translate<BedWidth,0,BedLength+13>
    }
    object {
        FramePost
        //translate<RoomWidth-BedWidth-15,0,littleWindowLedgeLength+5>
        translate<BedWidth,0,0>
    }
    object {
        FramePost
        //translate<RoomWidth-9,0,littleWindowLedgeLength+5>
        translate<0,0,BedLength+13>
    }
    object {
        FramePost
        //translate<RoomWidth-10,0,BedLength+littleWindowLedgeLength+5+FramePostWidth>
        translate<0,0,0>
    }
    object {
        FrameBar
        translate<0,FrameBarGapSpace,0>
    }
    object {
        FrameBar
        translate<0,2*FrameBarGapSpace,0>
    }
    object {
        FrameBar
        translate<0,3*FrameBarGapSpace,0>
    }
    object {
        FrameBar
        translate<0,FrameBarGapSpace,BedLength+13>
    }
    object {
        FrameBar
        translate<0,2*FrameBarGapSpace,BedLength+13>
    }
    object {
        FrameBar
        translate<0,3*FrameBarGapSpace,BedLength+13>
    }
    texture{WoodTexture}
    
}
//the mattress
#declare Mattress = object {
    Round_Box_Union (
        <BedWidth,0,0>
        <0,MattressHeight,BedLength>
        3
    )
    translate<RoomWidth-BedWidth-9,BedDistanceFromGround+MetalFrameHeight+1,littleWindowLedgeLength+10>
    texture{pigment{rgb<0.4,0.3,0.4>}}
}
#declare Comforter = union {
    object {
        Round_Box_Union (
            <BedWidth+7,0,0>
            <0,3,BedLength+7>
            3
        )
    }
    object {
        Round_Box_Union (
            <BedWidth+7,0,0>
            <0,10,3>
            1
        )
        translate<0,-8,BedLength+5>
    }
    object {
        Round_Box_Union (
            <3,0,0>
            <0,10, BedLength+7>
            1
        )
        translate<0,-8,0>
    }
    texture{BlanketTexture}
    translate<RoomWidth-BedWidth-11, BedDistanceFromGround+MetalFrameHeight+MattressHeight+3,littleWindowLedgeLength+10>
}

#declare Pillow = Round_Box_Union (
    <PillowWidth,0,0>
    <0,PillowHeight,PillowLength>
    4
)

#declare Bed = union {
    object {
        MetalFrame
    }
    object {
        Frame
        translate<RoomWidth-BedWidth-12,0,littleWindowLedgeLength+5>
    }
    object {
        Mattress
    }
    object {
        Comforter
    }
    object {
        Pillow
        texture{pigment{color White}}
        translate<RoomWidth-BedWidth+10,PostersDistanceFromGround-60,littleWindowLedgeLength+15>
    }
    object {
        Pillow
        texture{pigment{color Orange}}
        rotate<30,0,0>
        translate<RoomWidth-BedWidth+10,PostersDistanceFromGround-42,littleWindowLedgeLength+25>
    }
}


//////////////////////////////////////////////////////////////////////////////
//lights, camera, but no action :(
  
  
//Look at the window, camera must be by the door
#declare WindowView = <HalfRoomWidth, SeatedEyeHeight, 40>;
                                                               
//Look at the door, camera must be by the window                                                               
#declare DoorwayView = <HalfRoomWidth, SeatedEyeHeight, RoomLength>;

//camera
camera {
    location WindowView
    look_at DoorwayView
    location DoorwayView
    look_at WindowView 
    //location<100,200,150>
    //look_at<RoomWidth,100,10>
    //location<RoomWidth-BedWidth,220,BedLength>
    //look_at<RoomWidth-BedWidth,100,BedLength>
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
#declare TheRoomShell = difference {
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
        WallTexture
    }
}

 
#declare myRoom = union { 
    object {
        TheRoomShell
    }
    object {
        Closet
        //texture{pigment{rgb<0.5,0.5,0.5>}}
    }
    object {
        OpenDoor
        //texture{pigment{rgb<0.5,0.5,0.5>}}
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
        translate<0.5, PostersDistanceFromGround,300>
    }
    object {
        Poster
        translate<RoomWidth - 0.5, PostersDistanceFromGround-20,300>
    }
    object {
        Flag
    }
    object {
        Bed
    }
}

//-----------------------------------------------------------------------//

/*
merge {
    object {
        myRoom
    }
    object {
        theTree
        scale 2
        rotate<0,180,0>
        translate<RoomWidth-70,20,RoomLength+50>
        
    }
}
*/

object {
    myRoom
}

