//==========================================================
/*
  Logan Traynor
  10/22/15
  fruitScene.pov -- the file that renders the entire project,
    however most of the worthwhile code and comments are in
    fruitMaterials.inc
*/
//==========================================================

#include "fruitModels.inc" //Geometry

//the background
background { color rgb<0,0,0> }

//position the camera
camera {
        location <0,8,-13>
        look_at <0,0,0>  
} 

//==========================
// Add Lights Here!
//===========================

//generic point light
#declare PointLight = light_source {
    <0,0,0>
    rgb<1,1,1>
}


//cool spotlight
#declare SpotLight = light_source {
    <0,50,0>
    rgb<1,1,1>
    spotlight
    radius 5
    falloff 8.25
    tightness 0
    point_at<0,0,0>
}


//cool directional light
#declare DirectionalLight = light_source {
    <-300,0,0>
    rgb<1,1,0.8>
    parallel
    point_at<0,0,0>
}
  
  
//not a hueg fane of these lights
#declare AreaLight = light_source {
    <20,20,-20>
    rgb<1,1,1>
    area_light
    <1,0,1>,<0,1,1>, 4,4
}
 
 
//these are dope though 
#declare ShadowlessLight = light_source {
    <200,30,50>
    rgb<0.5,0.5,0.5>
    shadowless
    
} 

/*
object {
    PointLight
    translate<-100,0,0>
}
*/


object {SpotLight
    rotate<0,0,-20>
}


object {DirectionalLight}

//object {AreaLight}

object {ShadowlessLight}


object{
      fruit_
      rotate <0,-90,0>
      translate <-2,-1,10> //Moved to center the fruit at <0,0,0>
}
