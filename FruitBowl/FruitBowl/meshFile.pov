

background {
    rgb<0,1,1>
}

light_source {
    <0,100,0>
    rgb<1,1,1>
}


light_source {
    <0,-100,0>
    rgb<1,1,1>
}

camera {
    location<0,4,-30>
    look_at<0,5,0>
} 


#declare Leaf2 = mesh2 {

    vertex_vectors {
        5
        <0,0,0>     //0
        <1,4,0>     //1
        <12,13,-11>    //2
        <2,3,1>     //3
        <6,1,10>     //4
    }
    
    face_indices {
        4
        <0,1,2>
        <0,1,3>
        <4,1,2>
        <4,1,3>
    }
}

#declare LeafRing = union {
    #declare Index = 0;
    #while (Index < 360) 
        object {
            Leaf2
            rotate<0,Index,0>
        }
        #declare Index = Index + 10;
    #end
    texture {
        pigment {
            rgb<0,1,0>
        }
        finish {
            specular 0.5
            roughness 0.005
        }
    }        
}

object {
    LeafRing
}