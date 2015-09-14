
  
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
 

///////////////////////////////////
  
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

object {
    coolCube
    translate<-4,11,0> 
}

object {
    coolCube
    translate<4,11,0>
}    

object {
    superSphere
    translate<0,11,0>
} 

///////////////////////////////////

object {
    superSphere
    translate<-4.5,10,0>
}  

object {
    superSphere
    translate<-4.5,8.5,0>
}

object {
    superSphere
    translate<-4.5,7,0>
}

object {
    superSphere
    translate<-4.5,5.5,0>
}

object {
    superSphere
    translate<-4.5,4,0>
} 

object {
    superSphere
    translate<-4.5,2.5,0>
}                       

object {
    superSphere
    translate<-4.5,1,0>
}      

//////////////////////////////////
                                 

object {
    superSphere
    translate<4.5,10,0>
}  

object {
    superSphere
    translate<4.5,8.5,0>
}

object {
    superSphere
    translate<4.5,7,0>
}

object {
    superSphere
    translate<4.5,5.5,0>
}

object {
    superSphere
    translate<4.5,4,0>
} 

object {
    superSphere
    translate<4.5,2.5,0>
}                       

object {
    superSphere
    translate<4.5,1,0>
}  

///////////////////////////////


object {
    superSphere
    translate<-7,10,2.25>
}  

object {
    superSphere
    translate<-7,8.5,2.25>
}

object {
    superSphere
    translate<-7,7,2.25>
}

object {
    superSphere
    translate<-7,5.5,2.25>
}

object {
    superSphere
    translate<-7,4,2.25>
} 

object {
    superSphere
    translate<-7,2.5,2.25>
}                       

object {
    superSphere
    translate<-7,1,2.25>
}   

///////////////////////////////


object {
    superSphere
    translate<7,10,2.25>
}  

object {
    superSphere
    translate<7,8.5,2.25>
}

object {
    superSphere
    translate<7,7,2.25>
}

object {
    superSphere
    translate<7,5.5,2.25>
}

object {
    superSphere
    translate<7,4,2.25>
} 

object {
    superSphere
    translate<7,2.5,2.25>
}                       

object {
    superSphere
    translate<7,1,2.25>
}                               

//////////////////////////////////////

object {
    superSphere
    translate<-7,10,-2.25>
}  

object {
    superSphere
    translate<-7,8.5,-2.25>
}

object {
    superSphere
    translate<-7,7,-2.25>
}

object {
    superSphere
    translate<-7,5.5,-2.25>
}

object {
    superSphere
    translate<-7,4,-2.25>
} 

object {
    superSphere
    translate<-7,2.5,-2.25>
}                       

object {
    superSphere
    translate<-7,1,-2.25>    
}

//////////////////////////////



object {
    superSphere
    translate<7,10,-2.25>
}  

object {
    superSphere
    translate<7,8.5,-2.25>
}

object {
    superSphere
    translate<7,7,-2.25>
}

object {
    superSphere
    translate<7,5.5,-2.25>
}

object {
    superSphere
    translate<7,4,-2.25>
} 

object {
    superSphere
    translate<7,2.5,-2.25>
}                       

object {
    superSphere
    translate<7,1,-2.25>    
}