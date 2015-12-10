/*
 *  Logan Traynor
 *  12/10/15
 *  rootFileForTree.inc - this is the file that started it all... my despairm but
 *      also my glory. I mean the tree didn't come out all that grand but the 
 *      roots look freaking awesome. Anyway I wish there was some way I could have
 *      automated this,and believe me I tried, but ultimately I had to manually do 
 *      everything so that it looked good. Used to be a stand alone file, now 
 *      edited to be an include file.
*/

#include "colors.inc"


//the first piece...
#declare rootBase = lathe {
    linear_spline 
    4
    <100,0>, <100,150>
    <85, 180>, <75, 200>
}

//the second piece....
#declare rootPiece1 = lathe {
    linear_spline
    4
    <75,0>, <75,100>
    <65, 125>, <60, 160>
    rotate <0,0,15>
}

//make it look more rooty
#declare rootWarpTransform = transform {
    matrix <1,1,0,  //a11 a12 a13
            0,1,0,  //a21 a22 a23
            0,0,1,  //a31 a32 a33
            0,0,0>  //a14 a24 a34
}

//to make the demensions a little better
#declare rootScaleTransform = transform {
    scale<0.65,0.9,0.65>
}


//the first unit of root
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

//and it just builds on itself from there....
#declare rootPiece2 = object {
    object {
        Roots
        transform{rootScaleTransform}
        rotate<0,0,20>
        translate<-40,335,0>        
    }
}

#declare rootPiece3 = object {
    object {
       Roots
       transform{rootScaleTransform}
       transform{rootScaleTransform}
       rotate<0,0,25>
       rotate<0,-60,0>
       translate<-150,600,10>
    }
}


#declare rootPiece4 = object {
    object {
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
   

#declare rootPiece5 = object {
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

#declare rootPiece6 = object {
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

#declare rootPiece7 = object {
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


//this next part is an attempt to condense all the stupid annoyance of above
#declare Roots2 = merge {
    object {
        Roots
    }
    object {
        rootPiece2
    }
}

#declare Roots3 = merge {
    object {
        Roots2
    }
    object {
        rootPiece3
    }
}

#declare Roots4 = merge {
    object {
        Roots3
    }
    object {
        rootPiece4
    }
}

#declare Roots5 = merge {
    object {
        Roots4
    }
    object {
        rootPiece5
    }
}
    
#declare Roots6 = merge {
    object {
        Roots5
    }
    object {
        rootPiece6
    }
}

#declare Roots7 = merge {
    object {
        Roots6
    }
    object {
        rootPiece7
    }
}
        


//now we switch to segments to try and simplify even more.....        
#declare rootSegment1 = object {
    object {
        Roots3
    }
}

#declare rootSegment2 = merge {
    object {
        rootPiece4
    }
    object {
        rootPiece5
    }
    object {
        rootPiece6
    }
    object {
        rootPiece7
    }
}


//this is a single root. I apologize for the awful naming conventions
#declare rooots = merge {
    object {
        rootSegment1
    }
    object {
        rootSegment2
        rotate<0,0,-0.5>
        rotate<0,0,0>
        translate<30,25,60>
    }
}

//the multiple roots to be attached to the tree
#declare RoootsFinal = union {
    object {
        rooots
        scale 0.1
        rotate<95,0,0>
        translate<0,-5,-15>
    }
    object {
        rooots
        scale 0.1
        rotate<95,0,0>
        translate<15,-15,-10>
        rotate<0,20,40>
    }
    object {
        rooots
        scale 0.1
        rotate<95,40,0>
        translate<15,-15,-10>
        rotate<0,0,80>
        translate<5,-20,0>
    }
    object {
        rooots
        scale 0.1
        rotate<95,0,180>
        rotate<0,-50,0>
        translate<-10,-10,-25>
    }    
}
