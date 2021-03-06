#include "colors.inc"

/*
background {
    rgb<0,0,0>
}


camera {
    location<0,10,300>
    look_at<0,10,0>
}
*/


#declare glowingSpore = sphere {
    <0,0,0>
    2
    texture {
        pigment {
            color Yellow
        }
        finish {
            specular 1
            roughness 0.5
            ambient 1000
            emission 1000
        }
    }
}

/*
#declare SporeField = union {

    #declare randomNumberStream = seed(1153);
    #declare Index = 0;
    #while (Index < 1)
        object {
            glowingSpore
            translate<rand(randomNumberStream),rand(randomNumberStream),rand(randomNumberStream)>
    }
    #end
}

object {
    SporeField
}
*/

#declare SporeField = union {
    object {
        glowingSpore
    }
    object {
        glowingSpore
        translate<1,30,12>
    }
    object {
        glowingSpore
        translate<30,30,12>
    } 
    object {
        glowingSpore
        translate<-12,45,-30>
    }
    object {
        glowingSpore
        translate<-20,60,-25>
    } 
    object {
        glowingSpore
        translate<-20,0,0>
    }
    object {
        glowingSpore
        translate<-40,20,20>
    }
    object {
        glowingSpore
        translate<-50,30,-35>
    }
    object {
        glowingSpore
        translate<-65,5, 5>
    }
    object {
        glowingSpore
        translate<-60,50,-10>
    }
    object {
        glowingSpore
        translate<60,40,-15>
    }
    object {
        glowingSpore
        translate<50,-5,2>
    }
    object {
        glowingSpore
        translate<45,60,-30>
    }
    object {
        glowingSpore
        translate<20,70,0>
    }
    object {
        glowingSpore
        translate<-30,60,15>
    }
}

#declare Spores = union {
    object {
        SporeField
    }
    object {
        SporeField
        translate<40,15,-20>
    }
    object {
        SporeField
        translate<-60,10,5>
    }
    object {
        SporeField
        translate<-5,5,100>
    }
    object {
        SporeField
        translate<80,80,0>
    }
    object {
        SporeField
        translate<-100,100,25>
    }
    scale 0.5
}

