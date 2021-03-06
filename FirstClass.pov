
#declare spherePos = <-2.5,0.5,0>;

background { 
    rgb<1,0.6,0.35>
}


camera {
    location<0,3,-10>
    look_at <0,1,0>
}

 
light_source {
    <-100,40,-4> //location
    rgb<1,1,1>
}
         

light_source {
    <100,40,-4> //location
    rgb<1,1,1>
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

 
sphere {
    spherePos //position of sphere
    1   //radius 
    texture {
        pigment {
            rgb<0,1,1>
        }
    }
}    
   

sphere {
    <0,-0.25,-2.5> //position of sphere
    1   //radius 
    texture {
        pigment {
            rgb<0,1,1>
        }
    }
}   
   

sphere {
    <2.5,0.5,0> //position of sphere
    1   //radius 
    texture {
        pigment {
            rgb<0,1,1>
        }
    }
}


box {
    <-1,0,-1>
    <1,0.5,3>
    texture {
        pigment {
            rgb<1,0,0>
        }
    }
}  


cone {
    <15,1,-1> //point 1
    0.3     //radius of point 1   
    <15,4,10> // point 2
    1.5       //radius of point 2
    texture {
        pigment {
            rgb<0.6,0,0.7>
        }
    
    }
}


cone {
    <0,1,-1> //point 1
    0.3     //radius of point 1   
    <0,5,1> // point 2
    1       //radius of point 2
    texture {
        pigment {
            rgb<0.6,0,0.7>
        }
    
    }
}


torus {
    5.5 //outer radius
    0.65 //inner radius
    translate <0,0.5,0>
    texture {
        pigment {
            rgb <0,0,1>
        }
    }
}