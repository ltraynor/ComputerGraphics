#include "colors.inc"

background {
    rgb<0,1,1>
}

camera {
    location <0, 600, -750>
    look_at <0,0,0>
}

light_source {
    <0,1000,0>
    rgb<1,1,1>
}

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


#declare rootTransform = transform {
    matrix <1,1,0,  //a11 a12 a13
            0,1,0,  //a21 a22 a23
            0,0,1,  //a31 a32 a33
            0,0,0>  //a14 a24 a34
}


#declare Roots = merge {
    object {
        rootBase
    }
    object {
        rootPiece1
        translate <0,200,0>
    }
    pigment {color Brown}
    finish {
        roughness 0.05
        specular 0.3
    }
}


object {
    Roots
    //rotate <-90,0,0>
    transform{rootTransform}
}