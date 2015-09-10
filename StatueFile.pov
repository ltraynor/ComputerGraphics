
  
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
    location<0,10,-60>
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


box {
    <-3.5,0,-3.5>
    <3.5,0.5,3.5>
    texture {
        pigment {
            rgb<1,0,0>
        }
    }
} 


object {
    coolCone
} 

object {
    coolCone
    rotate<0,0,180>  
    translate<0,22,0>
}