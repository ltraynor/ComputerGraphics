#include "colors.inc"

background {
    rgb<0,1,1>
}


camera {
    location <-2300, 900, 0>
    look_at <0,300,0>
}


/*
camera {
    location <-300, 650, -500>
    look_at <-300,300,0>
}
*/

light_source {
    <0,10000,0>
    rgb<1,1,1>
}

/*
light_source {
    <0,-10000,0>
    rgb<1,1,1>
}
*/

#declare rootBase = lathe {
    linear_spline 
    4
    <100,0>, <100,150>
    <85, 180>, <75, 200>
}


#declare rootPiece1 = lathe {
    linear_spline
    4
    <75,0>, <75,100>
    <65, 125>, <60, 160>
    rotate <0,0,15>
}


#declare rootWarpTransform = transform {
    matrix <1,1,0,  //a11 a12 a13
            0,1,0,  //a21 a22 a23
            0,0,1,  //a31 a32 a33
            0,0,0>  //a14 a24 a34
}

#declare rootScaleTransform = transform {
    scale<0.65,0.9,0.65>
}


#declare Roots = merge {
    object {
        rootBase
    }
    object {
        rootPiece1
        translate <0,180,0>
    }
    pigment {color Brown}
    finish {
        roughness 0.05
        specular 0.3
    }
}

#declare Roots2 = merge {
    object {
        Roots
    }
    object {
        Roots
        transform{rootScaleTransform}
        rotate<0,0,20>
        translate<-40,335,0>
    }
}

#declare Roots3 = merge {
    object {
        Roots2
    }
    object {
        Roots
        transform{rootScaleTransform}
        transform{rootScaleTransform}
        rotate<0,0,40>
        rotate<0,-60,0>
        translate<-150,600,10>
    }
}

#declare Roots4 = merge {
    object {
        Roots3
    }
    object {
        /*
        Roots3
        scale<0.5,0.5,0.5>
        rotate<0,0,30>
        rotate<0,90,0>
        translate<-180,700,-70>
        */
        Roots
        transform{rootScaleTransform}
        transform{rootScaleTransform}
        transform{rootScaleTransform}
        scale<0,0.5,0>
        rotate<0,0,30>
        rotate<-80,0,0>
        rotate<0,-30,0>
        translate<-245,800,-150>
    }
}

#declare Roots5 = merge {
    object {
        Roots4
    }
    object {
        Roots
        transform{rootScaleTransform}
        transform{rootScaleTransform}
        transform{rootScaleTransform} 
        transform{rootScaleTransform}
        scale<1.2,0.5,1.2>
        rotate<0,0,30>
        rotate<-30,0,0>
        rotate<0,20,0>
        translate<-250,805,-250>
    }
}
    
#declare Roots6 = merge {
    object {
        Roots5
    }
    object {
        Roots
        transform{rootScaleTransform}
        transform{rootScaleTransform}
        transform{rootScaleTransform} 
        transform{rootScaleTransform}
        transform{rootScaleTransform}
        scale<0,0.35,0>
        rotate<0,0,30>
        rotate<-30,0,0>
        rotate<0,50,0>
        translate<-317,876,-273>
    }
}

#declare Roots7 = merge {
    object {
        Roots6
    }
    object {
        Roots
        transform{rootScaleTransform}
        transform{rootScaleTransform}
        transform{rootScaleTransform} 
        transform{rootScaleTransform}
        transform{rootScaleTransform}
        transform{rootScaleTransform}
        scale<0,0.35,0>
        rotate<0,0,30>
        rotate<-50,0,0>
        rotate<0,90,0>
        translate<-360,920,-260>    
    }
}
        
        


object {
    Roots7
    //rotate <-90,0,0>
    transform{rootWarpTransform}
    //scale<1,1.5,1>
}