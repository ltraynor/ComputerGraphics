//////////////////////////////////////
//variables on variables
  
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


#declare coolCube = box {
    <-3.5,0,-3.5>
    <3.5,0.5,3.5>
    texture {
        pigment {
            rgb<1,0,0>
        }
    }
}


#declare superSphere = sphere {
    <0,0,0>
    1.15   //radius 
    texture {
        pigment {
            rgb<0,1,1>
        }
    }
}    


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

 
camera {
    location<0,15,-40>
    look_at <0,3,0>
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

