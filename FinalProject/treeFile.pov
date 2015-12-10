/*
 *  Logan Traynor
 *  12/10/15
 *  tree

*/

#include "colors.inc"
#include "rootFileForTree.inc"
#include "glowingSpheresFile.inc" 

background {
    rgb<0,1,1>
}


camera {
    location<-50,50,200>
    look_at<0,30,0>
    //location<1,200,0>
    //look_at<1,0,0>
    //location<-100,50,0>
    //look_at<0,30,0>
    //location<0,300,0>
    //look_at<0,0,0>
    //location<-20,20,100>
    //look_at<-20,20,30>
    //location<0,20,0>
    //look_at<0,0,0>
}



light_source {
    <0,100,200>
    rgb<1,1,1>
}


#declare TreeTexture = texture {
    uv_mapping pigment{image_map{jpeg "treeTexture"}}
    scale 20
}
 

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
        
        //TreeTexture
    }
}

#declare theTree = union {
    object {
        treeTrunk
        //texture{TreeTexture}
    }
    object {
        RoootsFinal
        texture{TreeTexture}
    }
    object {
        Branches
        translate<5,70,-19>
    }
    object {
        Spores
    }    
}


object {
    theTree
}

