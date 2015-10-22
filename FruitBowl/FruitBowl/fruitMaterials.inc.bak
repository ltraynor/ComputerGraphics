//========================================================================================
/*
    Logan Traynor
    10/22/15
    fruitMaterials.inc -- this is the file that contains all of the pigments, finishes,
        and materials for the fruit bowl project. I did some cool stuff that is explained
        along the way; as well as including a story about the fruit within the comments
        to add a little bit of spice while you read. (warning the story isnt all that 
        exciting or in depth, also kind of sporadic)
*/
//========================================================================================
#include "colors.inc" 
 
 
//brick pigment is you basic brick pigment and used on the right grapes
#declare brickPigment = pigment {
    brick
    color Cyan
    color Red  
    scale 0.1
}

//checkerPigment is your basic checker pigment and used on banana 2
#declare checkerPigment = pigment {
    checker
    color Black
    color White
    scale 0.1
}

//hexagon pigment is your basic hexagon pigment and used on bana 1
#declare hexagonPigment = pigment {
    hexagon
    color Blue
    color Gray
    color Brown
    scale 0.1
}

//CandyMap is the color map used for the super cool candy pigment
#declare CandyMap =  color_map {
        [0 color Red]
        [0.5 color Yellow]
        [0.6 color Green]
        [0.9 color Blue]
};

//still a fairly basic pigment but wicked cool, used on the cherries
#declare candyPigment = pigment {
    gradient
    <0,1,0>
    color_map{CandyMap} 
    scale 0.1
} 

//strangeCandyPigment is candyPigment but with a twist -- you can probably 
//figure out what it is
#declare strangeCandyPigment = pigment {
    bumps
    color_map{CandyMap}
    scale 0.1
}
 
//combinationPigmentMap combines two pigments
//should probably change the name of this... 
#declare combinationPigmentMap = pigment_map {
    [0 candyPigment turbulence 10]
    //[0.5 candyPigment turbulence 10]
    [0.9  checkerPigment turbulence 10]
}; 

//comboPigment uses the previous pigment map and makes it into a proper pigment
#declare comboPigment = pigment {
    gradient
    <0,1,0>
    pigment_map{combinationPigmentMap}
}


//this is the ultimate pigment map, it uses all the basic pigments and combines them
#declare ultimatePigmentMap = pigment_map { 
    [0 brickPigment]
    [0.33 checkerPigment]
    [0.66 hexagonPigment]
}

//takes the ultimate pigment map and makes into something... ultimate
#declare ultimatePigment = pigment {
    agate
    pigment_map {ultimatePigmentMap}
    agate_turb 5    
}

//even greater than the ultimate pigment; this combines the ultimate with candyPigment
#declare megaPigmentMap = pigment_map {
    [0 ultimatePigment]
    [1 candyPigment]
}

//The most mega of all pigments
#declare megaPigment = pigment {
    wood
    pigment_map {megaPigmentMap}
    turbulence 5
    scale 0.5
}


//in the beginning there was only darkness...
#declare darkness = pigment {
    color Black
}

//space was nothing but a void
#declare void = finish {
    specular 0
    roughness 0.0005
    emission 0
    ambient 0
    brilliance 0
}

//The Primordials called this the Abyss
#declare Abyss = texture {
    pigment {
        darkness
    }
    finish {
        void
    }
}

//but for every creature of the dark, there would come to be one of light
#declare divinity = finish {
    specular 1 
    roughness 0.25
    emission 100
    ambient 100
    brilliance 100      
}


//their radiance pierced the abyss, and it wasn't long before fruits of all
// types arose from then nothing
#declare Radiance = texture {
    pigment {
        color Yellow
    }
    finish {
        divinity
    }
}     


//==================================================
//Material definitions
//==================================================


//====================================================
/* This is my cherrries material,its made of "candy"
   and I think that they look pretty sweet.
*/
#declare Cherries1_MappedPigment = candyPigment;

#declare Cherries1_Finish = finish {
    specular 0.5 //Max highlight intensity: 0 -> 1
    roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Cherries1_Material_ = material {
	texture {
	    pigment { uv_mapping Cherries1_MappedPigment}
		finish { Cherries1_Finish }
	}
}


//==================================================
/* The second batch of cherries looks the same as the
    first because it is so dang cool.
*/
#declare Cherries2_MappedPigment = candyPigment;

#declare Cherries2_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Cherries2_Material_ = material {
	texture {
		pigment { uv_mapping Cherries2_MappedPigment }
		finish { Cherries2_Finish }
	}
}


//==================================================
/* Material for the plate on which everything sits
    I wanted it to be dark.
*/
#declare Plate_MappedPigment = darkness;


#declare Plate_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};


#declare Plate_Material_ = material {
	texture {
	    pigment { uv_mapping Plate_MappedPigment }
		finish { Plate_Finish } 
		//Abyss
	}
}


//================================================== 
/* Grapestem is unchanged
*/
#declare GrapeStem_MappedPigment = pigment { color rgb <0.72,0.86,0.67> }

#declare GrapeStem_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare GrapeStem_Material_ = material {
	texture {
		pigment { uv_mapping GrapeStem_MappedPigment }
		finish { GrapeStem_Finish }
	}
}


//==================================================
/* The precious fruits hang delicately above the Abyss
*/
#declare Sheet_Material_ = material {
	texture {
		Abyss
	}
}


//==================================================
/* First of the primordial Plums -- who ruled in the 
    days before the light
*/
#declare Plum1_Material_ = material {
	texture {
		Abyss
	}
};


//==================================================
/* Second of the primordial Plums -- whose light shone 
    first
*/
#declare Plum2_Material_ = material {
	texture {
		Radiance
	}
}


//==================================================
/* Third of the primordial Plums -- who betrayed the
    light
*/
#declare Plum3_Material_ = material {
	texture {
		Abyss
	}
}
 
 
//================================================== 
/* Fourth of the primordial Plums -- who saw the error 
    in their ways
*/
#declare Plum4_Material_ = material {
	texture {
		Radiance
	}
}


//==================================================
/* Fifth of the primordial Plums -- The strongest of
    all of the Primordials, ushered the second age of 
    dark
*/
#declare Plum5_Material_ = material {
	texture {
		Abyss
	}
}
                                                    
                                                    
//==================================================
/* Last of the primordial Plums -- from whom all 
    later fruits arose
*/
#declare Plum6_Material_ = material {
	texture {
		Radiance
	}
}


//================================================== 
/* I did some crazy tumultuous stuff with this guy,
    mixed candy with checkers and shook it up
*/
#declare Orange_MappedPigment = comboPigment;

#declare Orange_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Orange_Material_ = material {
	texture {
		pigment { uv_mapping Orange_MappedPigment }
		finish { Orange_Finish }
	}
}                                 


//================================================== 
/* OrangeStem is unchanged
*/
#declare OrangeStem_MappedPigment = pigment { color rgb <0.20,0.86,0.40> }
#declare OrangeStem_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare OrangeStem_Material_ = material {
	texture {
		pigment { uv_mapping OrangeStem_MappedPigment }
		finish { OrangeStem_Finish }
	}
} 


//==================================================
/* I put the ultimate pigment on the Pear, as it is
    one of the higher creations
*/
#declare Pear_MappedPigment = ultimatePigment;


#declare Pear_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Pear_Material_ = material {
	texture {
		pigment { uv_mapping Pear_MappedPigment }
		finish { Pear_Finish }
	}
}


//==================================================
/* LeftGrapeStems is unchanged
*/
#declare LeftGrapeStems_MappedPigment = pigment { color rgb <0.01,0.93,0.25> }

#declare LeftGrapeStems_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare LeftGrapeStems_Material_ = material {
	texture {
		pigment { uv_mapping LeftGrapeStems_MappedPigment }
		finish { LeftGrapeStems_Finish }
	}
} 


//==================================================
/* The left grapes have a variation on the candy pigment
*/
#declare LeftGrapes_MappedPigment = strangeCandyPigment;

#declare LeftGrapes_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare LeftGrapes_Material_ = material {
	texture {
		pigment { uv_mapping LeftGrapes_MappedPigment }
		finish { LeftGrapes_Finish }
	}
}                                                       


//==================================================
/*  The apple has the mightiest of all pigments, as it 
    is considered the highest of all the fruits - and
    ruler of the plate
*/
#declare Apple_MappedPigment = megaPigment;

#declare Apple_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Apple_Material_ = material {
	texture {
		pigment { uv_mapping Apple_MappedPigment }
		finish { Apple_Finish }
	}
}


//==================================================
/*  Right grapes have the brick pattern as their pigment,
    one of the first fruits
*/
#declare RightGrapes_MappedPigment = brickPigment;


#declare RightGrapes_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare RightGrapes_Material_ = material {
	texture {
		pigment { uv_mapping RightGrapes_MappedPigment }
		finish { RightGrapes_Finish }
	}
}

//================================================== 
/* RightGrapeStems is unchanged
*/
#declare RightGrapeStems_MappedPigment = pigment { color rgb <0.46,0.81,0.63> }

#declare RightGrapeStems_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare RightGrapeStems_Material_ = material {
	texture {
		pigment { uv_mapping RightGrapeStems_MappedPigment }
		finish { RightGrapeStems_Finish }
	}
}


//================================================== 
/* AppleLeft is unchanged because it looks freaking awesome
    with the material i put on the apple
*/
#declare AppleLeaf_MappedPigment = pigment { color rgb <0.14,0.07,0.20> }

#declare AppleLeaf_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare AppleLeaf_Material_ = material {
	texture {
		pigment { uv_mapping AppleLeaf_MappedPigment }
		finish { AppleLeaf_Finish }
	}
}


//================================================== 
/*  AppleStem is unchanged
*/
#declare AppleStem_MappedPigment = pigment { color rgb <0.40,0.75,0.21> }

#declare AppleStem_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare AppleStem_Material_ = material {
	texture {
		pigment { uv_mapping AppleStem_MappedPigment }
		finish { AppleStem_Finish }
	}
} 


//==================================================
/*  Banana 1 has the hexagon pigment, but you would 
    never know just by looking at it
*/
#declare Banana1_MappedPigment = hexagonPigment

#declare Banana1_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Banana1_Material_ = material {
	texture {
		pigment { uv_mapping Banana1_MappedPigment }
		finish { Banana1_Finish }
	}
}


//==================================================
/*  Banana 2 is checkered but has no finish - as it was
    the first fruit created by the Sixth Primordial,
    and it knew not yet what could be
*/
#declare Banana2_MappedPigment = checkerPigment

#declare Banana2_Material_ = material {
	texture {
		pigment { uv_mapping Banana2_MappedPigment }
	}
}//==================================================
