////////////////////////////////////////

#declare initialBox = box {
    <0,0,0>
    <1,1,1>
    texture {
        pigment {
            rgb<1,0,0>
        }
    }
}

#declare negativeBox = box {
    <0,0,0>
    <2,0.5,1>
    texture {
        pigment {
            rgbf<1,1,1,1>
        }
    }
}

////////////////////////////////////////
background {
    rgb<0,1,1>
}


light_source {
    <0,3,-10>
    rgb<1,1,1>
}

light_source {
    <0,5,30>
    rgb<1,1,1>
}

camera {
    location<10,3,-5>
    look_at <0,1,0>
} 

plane {
    <0,1,0> //normal vector
    0 //distance from origin
    texture {
        pigment {
            rgb<1,1,0>
        }
    }
}

////////////////////////////////////


difference {
    object {
        initialBox
    }
    object {
        negativeBox
        rotate<0,0,65>
        translate<0,0,0>
    }
    object {
        negativeBox
        rotate<0,0,-65>
        translate<0.5,1,0>
    }
}