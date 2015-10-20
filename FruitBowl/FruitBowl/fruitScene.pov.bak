#include "fruitModels.inc" //Geometry

background { color rgb<0,0,0> }

camera {
        location <0,8,-13>
        look_at <0,0,0>  
} 

// Add Lights Here!

#declare PointLight = light_source {
    <0,0,0>
    rgb<1,1,1>
}

#declare SpotLight = light_source {
    <0,50,0>
    rgb<1,1,1>
    spotlight
    radius 5
    falloff 9
    tightness 0
    point_at<0,0,0>
}

#declare DirectionalLight = light_source {
    <100,100,0>
    rgb<1,1,0.8>
    parallel
    point_at<0,0,0>
}

#declare AreaLight = light_source {
    <20,20,-20>
    rgb<1,1,1>
    area_light
    <1,0,1>,<0,1,1>, 4,4
}

#declare ShadowlessLight = light_source {
    <-20,30,50>
    rgb<0.5,0.5,0.5>
    shadowless
    
} 

/*
object {
    PointLight
    translate<-500,200,0>
}
*/

object {SpotLight
    rotate<0,0,-20>}
    //translate<100,0,0>}

//object {DirectionalLight}

//object {AreaLight}

//object {ShadowlessLight}

object{
      fruit_
      rotate <0,-90,0>
      translate <-2,-1,10> //Moved to center the fruit at <0,0,0>
}
