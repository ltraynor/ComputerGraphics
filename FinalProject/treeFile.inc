/*
 *  Logan Traynor
 *  12/10/15
 *  treeFile.inc - yea honestly Im not even sure how much there is to say. 
 *      I think the roots look awesome and I spent a lot of time on the trunk,
 *      which is also cool, but I got lazy with the branches and just made 
 *      them smaller trunks which just looks like shit. I also could not find
 *      a way to automate everything (I did what I could, i.e. the trunk) but
 *      again everything is subject to meticulous manual translations and 
 *      rotations. Woulda had more leaves and spores if I could have figured
 *      out how to automate that junk. Ah well, hopefully someone thinks its cool.
 *      ALSO. I had huge problems trying to texture this tree. Nothing worked.
 *      Literally nothing except for the stupid brown texture I have on it now.
 *      The roots would change texture though, just not the trunk or the branches.
 *      So I really have no idea what was up with that but it was a point of great 
 *      frustration.
*/


#include "colors.inc"
#include "rootFileForTree.inc"
#include "glowingSpheresFile.inc" 
 

//makes a line of triangles that is the very first piece of the tree trunk
#declare treeMeshStart = mesh2 { 
    vertex_vectors {
        10
        <0,0,0>     //0
        <-1,1,0>    //1
        <1,1,0>     //2
        <2,0,0>     //3
        <3,1,0>     //4
        <4,0,0>     //5
        <5,1,0>     //6
        <6,0,0>     //7
        <7,1,0>     //8
        <8,0,0>     //9
    }
    face_indices {
        8
        <0,1,2>
        <2,0,3>
        <3,2,4>
        <4,3,5>
        <5,4,6>
        <6,5,7>
        <7,6,8>
        <8,7,9>
    }
    
}

//this is the mesh used for the rudimentary leaves on my tree
#declare leafMesh = mesh2 {
    vertex_vectors {
        4
        <0,0,0>     //0
        <1,2,2>     //1
        <2,2.5,1.5> //2
        <3,1,1>     //3
    }
    face_indices {
        3
        <0,1,2>
        <0,2,3>
        <2,1,3>
    }    
}


//this stacks some mesh-lines on top of one another, to make them in bulk
//is the next level of hierarchy in my tree.
#declare treeMeshUnit = union {
    object {
        treeMeshStart
    }
    object {
        treeMeshStart
        rotate<180,0,0>
        translate<0,2,0>
    }
    object{
        treeMeshStart
        translate<0,2,0>
    }
    object {
        treeMeshStart
        rotate<180,0,0>
        translate<0,0,0>
    }
}


//the treeMeshPiece is the foundation of the tree. It is pretty much a
//jagged ring of lots and lots of treeMeshUnits that looks kinda cool
#declare treeMeshPiece = union {
    object {
        treeMeshUnit
    }
    object {
        treeMeshUnit
        rotate<0,15,0>
        translate<7,0,-0.5>
    }
    object {
        treeMeshUnit
        rotate<0,30,0>
        translate<14,0,-3>
    }
    object {
        treeMeshUnit
        rotate<0,45,0>
        translate<20,0,-7>
    }
    object {
        treeMeshUnit
        rotate<0,60,0>
        translate<24,0,-12>
    }
    object {
        treeMeshUnit
        rotate<0,75,0>
        translate<27,0,-18>
    }
    object {
        treeMeshUnit
        rotate<0,90,0>
        translate<28,0,-25>
    }
    object {
        treeMeshUnit
        rotate<0,105,0>
        translate<27,0,-32>
    }
    object {
        treeMeshUnit
        rotate<0,120,0>   
        translate<24,0,-38.5>
    }
    object {
        treeMeshUnit
        rotate<0,135,0>
        translate<19.5,0,-44>
    }
    object {
        treeMeshUnit
        rotate<0,150,0>
        translate<14,0,-48>
    }
    object {
        treeMeshUnit
        rotate<0,165,0>
        translate<7,0,-50.5>
    }
    object {
        treeMeshUnit
        rotate<0,180,0>
        translate<-1,0,-52>
    }
    object {
        treeMeshUnit
        rotate<0,210,0>
        translate<-9,0,-51>
    }
    object {
        treeMeshUnit
        rotate<0,240,0>
        translate<-14,0,-46>
    }
    object {
        treeMeshUnit
        rotate<0,270,0>
        translate<-17,0,-39>
    }
    object {
        treeMeshUnit
        rotate<0,285,0>
        translate<-18,0,-31>
    }
    object {
        treeMeshUnit
        rotate<0,295,0>
        translate<-17,0,-23>
    }
    object {
        treeMeshUnit
        rotate<0,305,0>
        translate<-14.5,0,-15>
    }
    object {
        treeMeshUnit
        rotate<0,320,0>
        translate<-11,0,-8>
    }
    object {
        treeMeshUnit
        rotate<0,335,0>
        translate<-7,0,-2.5>
    }
}

//yay! the automated part! takes the ring of tree and stacks it into
// an offset cylinder (was hoping to make it look more realistic)
#declare treeTrunk = union {
    #declare Index = 0;
    #while (Index < 10)
        object {
            treeMeshPiece
            scale <0.75,2,0.75>
            rotate<0,0*Index,0>
            translate<0,8.1*Index,0>
        }
        #declare Index = Index + 1;
    #end
    texture {
        pigment {
            color Brown
        }
        finish {
            specular 0.3 
            roughness 0.05
        }
    }
}


//ah the branch, the ugliest part of the tree
#declare branch = merge {
    object {
        treeTrunk
        scale <0.25,0.7,0.25>
    }
    object {
        treeTrunk
        scale <0.15,0.5,0.15>
        rotate<35,0,15>
        translate<0,50,-3>
    }
}

//this union of leaves will go on every branch
#declare Leaves = union {
    object {
        leafMesh
        scale 3
        rotate<90,0,0>
        translate<-10,30,30>
        texture{pigment{color Green}}
    }

    object {
        leafMesh
        scale 3
        rotate<90,0,0>
        translate<-7,28,30>
        texture{pigment{color Green}}
    }

    object {
        leafMesh
        scale 3
        rotate<90,0,0>
        translate<-14,28,30>
        texture{pigment{color Green}}
    }
}

//make the branch with leaves....
#declare BranchWithLeaves = union {
    object {
        branch
        rotate<60,0,0>
    }
    object {
        Leaves
        translate<0,0,50>
    }
}


//and make a ring of branches to stick out of the top of my tree
#declare Branches = union {
    #declare Index = 0;
    #while (Index < 360)
        object {
            BranchWithLeaves
            //rotate<60,0,0>
            rotate<0,-Index,0>
        }
        #declare Index = Index + 40;
    #end
    texture {
        pigment {
            color Brown
        }
        finish {
            specular 0.3 
            roughness 0.05
        }
    }
}

//and finally wombo jumbo
#declare theTree = union {
    object {
        treeTrunk
    }
    object {
        RoootsFinal
    }
    object {
        Branches
        translate<5,70,-19>
    }
    object {
        //these are magic and they glow and thats all you need to know
        Spores
    }    
}

