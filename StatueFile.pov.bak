///////////////////////////////////////////////////////////////////////////////////////////////
//Logan Traynor
//9/21/15
//StatueFile.pov - my attempt at a cool looking statue that attempts to incorporate everything
//         that I have learned thus far. I was not attempting to recreate anything specific,
//         I was simply making things that I thought would look cool. I tried hard to make a
//         pyramid shape by using a cube and then differencing invisible cubes from the sides 
//         of it at an angle, however this did not work out and playing around with the rota-
//         tions proved exceedingly frustrating. I do however think I know where I went wrong
//         and perhaps I will pin down the technique in a dedicated file   
//
//P.S. feel free to play around with the camera angle, some of them are weird!
//////////////////////////////////////////////////////////////////////////////////////////////




//////////////////////////////////////
//variables on variables


//central cones of the statue  
#declare coolCone = cone {
    <0,11,-1> //point 1
    0.2     //radius of point 1   
    <0,0.5,0> // point 2
    2.5       //radius of point 2
    texture {
        pigment {
            rgb<0.6,0,0.7>
        }
    
    }
}

//cubes used as the platforms
#declare coolCube = box {
    <-3.5,0,-3.5>
    <3.5,0.5,3.5>
    texture {
        pigment {
            rgb<1,0,0>
        }
    }
}

//spheres that make up the sphere pillars and there is also one in the very center (you may have missed it)
#declare superSphere = sphere {
    <0,0,0>
    1.15   //radius 
    texture {
        pigment {
            rgb<0,1,1>
        }
    }
}    

//toruses used for the "X" shape around the center
#declare terrificTorus = torus {
    5.5 //outer radius
    0.65 //inner radius
    //translate <0,0.5,0>
    texture {
        pigment {
            rgb <0.5,0.5,0.5>
        }
    }
}

//the golden rings that circle the top cone
#declare goldenTorus = torus {
    5.5 //outer radius
    0.65 //inner radius
    //translate <0,0.5,0>
    texture {
        pigment {
            rgb <1,1,0>
        }
    }
}

//glorious sphere pillars
#declare spherePillar = union {
    
    #declare index = 10;
    #while (index >= 1)
        object {
            superSphere
            translate<0,index,0>
        }
    
        #declare index = index - 1.5;  
    #end
}

//cube I used in my attempted pyramids
#declare cubeForPyramid = box {
    <0,0,0>
    <2.3, 2.3, 2.3>
    texture {
        pigment {
            rgb<1,0.5,0>
        }
    }
}
  
//invisible cubes to help make the pyramids  
#declare invisibleCube = box {
    <0,0,0>
    <5, 5, 5>
    texture {
        pigment {
            rgbf<1,1,1,1>
        }
    }
}

//i tried, but couldnt quite get it...
#declare pyramidAttempt = difference {    
    object { 
        cubeForPyramid
        translate <0,10,0>
    }
    object {
        invisibleCube
        translate <-8.5,9,0>
        rotate<0,0,-20>
        scale <1,1,1>

    }
    object {
        invisibleCube
        translate <5.5,8,0> 
        rotate<0,0,20>
        
    }
} 


//one pyramidAttempt atop another
#declare doublePyramid = union {
    object {
        pyramidAttempt
    }
    object {
        pyramidAttempt
        rotate<0,0,180>
        translate<2.15,24.75,0>
    }
}

//pillar or doublePyramids ****I kinda got lazy with this code and just modified the loop from my sphere pillars so it came out like crap****
#declare pyramidPillar = union {
    #declare index = 4;
    #while (index >= 1)
        object {
            doublePyramid
            translate<0,3*index,0>
        }
    
        #declare index = index - 1.25;  
    #end 
} 

//the almighty sphere
#declare megaSphere = sphere {
    <0,0,0>
    10   //radius 
    texture {
        pigment {
            rgb<1,1,1>
        }
    }
}       

  
///////////////////////////////////
//background lightsource and ground
  
background {
    rgb<0,0.6,0.75>
}           

  
light_source {
    <-10,20,0> //location
    rgb<1,1,1>
}  
  
  
light_source {
    <10,20,0> //location
    rgb<1,1,1>
}    


light_source {
    <0,20,-10> //location
    rgb<1,1,1>
} 

 
light_source {
    <0,20,10> //location
    rgb<1,1,1>
}   
 
 
light_source {
    <0,5,10> //location
    rgb<1,1,1>
}    

light_source {
    <0,5,-10> //location
    rgb<1,1,1>
}    
 
camera {
    location<0,30,-50>
    look_at <0,10,0>
}
 
  
plane {
    <0,1,0> //normal vector
    0 //distance from origin
    texture {
        pigment {
            rgb<0,0.4,0>
        }
    }
}  


///////////////////////////////// 
//base and cone hourglass

object {
    coolCube
}


object {
    coolCone
} 

object {
    coolCone
    rotate<0,0,180>  
    translate<0,22,0>
} 

//////////////////////////////////
//make the platforms
object {
    coolCube
    translate<-4,11,0> 
}

object {
    coolCube
    translate<4,11,0>
}    

//ball in the center
object {
    superSphere
    translate<0,11,0>
} 


///////////////////////////////////
//torus rings

object {
    terrificTorus
    rotate <0,0,55> 
    translate <0.5,12,0>
    
} 

object {
    terrificTorus
    rotate <0,0,-55>
    translate <-0.5,12,0>
}

object {
    goldenTorus
    translate <0,19.5,0> 
    scale <0.7,0,0.7> 
}

object {
    goldenTorus
    translate <0,17,0>
    scale <0.5,0,0.5>
}   

object {
    goldenTorus
    translate <0,14.5,0>
    scale <0.4,0,0.4>
}

object {
    goldenTorus
    translate <0,23,0>
    scale <1.5,0,1.5>
}

///////////////////////////////////  
//make the sphere Pillars

object {
    spherePillar
    translate<-4.5,0,0>
}
                                 
object { 
    spherePillar
    translate<4.5,0,0>
}

object {
    spherePillar
    translate<-7,0,2.25>
}

object {
    spherePillar
    translate<7,0,2.25>
}

object {
    spherePillar
    translate<-7,0,-2.25>
}

object {
    spherePillar
    translate<7,0,-2.25>
}

/////////////////////////////////////
//try out the pyramids
    

object {
    pyramidPillar
    translate<-7.5,-2.5,-1.15>  
}

object {
    pyramidPillar
    translate <5.25,-2.5,-1.15>
}
//didnt really work


////////////////////////////////////
//the almighty sphere

object {
    megaSphere
    translate <0,33,0>
}