#include "colors.inc" 
 
 
//declaring my stuff here
#declare brickPigment = pigment {
    brick
    color Cyan
    color Red  
    scale 0.1
}

#declare checkerPigment = pigment {
    checker
    color Black
    color White
    scale 0.1
}

#declare hexagonPigment = pigment {
    hexagon
    color Blue
    color Gray
    color Brown
    scale 0.1
}

/* 
//dont have a Box declared to use for this object pigment
#declare ObjectPigment = pigment {
    object {
        Box
        color Red
        color Blue
    }             
    turbulence 0.1
}
*/

#declare ColorMap =  color_map {
        [0 color Red]
        [0.5 color Yellow]
        [0.6 color Green]
        [0.9 color Blue]
};

#declare candyPigment = pigment {
    gradient
    <0,1,0>
    color_map{ColorMap} 
    scale 0.1
} 

#declare strangeCandyPigment = pigment {
    bumps
    color_map{ColorMap}
    scale 0.1
}

#declare PigmentMap = pigment_map {
    [0 candyPigment turbulence 10]
    //[0.5 candyPigment turbulence 10]
    [0.9  checkerPigment turbulence 10]
}; 

#declare testPigment2 = pigment {
    gradient
    <0,1,0>
    pigment_map{PigmentMap}
}

#declare ultimatePigmentMap = pigment_map { 
    [0 brickPigment]
    [0.33 checkerPigment]
    [0.66 hexagonPigment]
    //wood
    //turbulence 0.05
}

#declare ultimatePigment = pigment {
    agate
    pigment_map {ultimatePigmentMap}
    agate_turb 5    
}

#declare megaPigmentMap = pigment_map {
    [0 ultimatePigment]
    [1 candyPigment]
}

#declare megaPigment = pigment {
    wood
    pigment_map {megaPigmentMap}
    turbulence 5
    scale 0.5
}


#declare darkness = pigment {
    color Black
}

#declare void = finish {
    specular 0
    roughness 0.0005
    emission 0
    ambient 0
    brilliance 0
}

#declare Abyss = texture {
    pigment {
        darkness
    }
    finish {
        void
    }
}

#declare divinity = finish {
    specular 1 //Max highlight intensity: 0 -> 1
    roughness 0.25 //surface roughness: 0.0005 -> 1
    emission 100
    ambient 100
    brilliance 100      
}


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
//#declare Cherries1_MappedPigment = pigment { color rgb <1,0,0> };
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
//#declare Cherries2_MappedPigment = pigment { color rgb <0.59,0.44,0.58> };
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
//#declare Plate_MappedPigment = pigment { color rgb <0.21,0.91,0.28> }
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
#declare Sheet_MappedPigment = pigment { color rgb <0.60,0.20,0.34> }

#declare Sheet_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Sheet_Material_ = material {
	texture {
		pigment { uv_mapping Sheet_MappedPigment }
		finish { Sheet_Finish }
	}
}

//==================================================
//#declare Plum1_MappedPigment = pigment { color rgb <0.12,0.00,0.69> }
#declare Plum1_MappedPigment = pigment{color Yellow};


#declare Plum1_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
    roughness 0.1 //surface roughness: 0.0005 -> 1       
};

#declare Plum1_Material_ = material {
	texture {
		Abyss
	}
}
//==================================================
//#declare Plum2_MappedPigment = pigment { color rgb <0.62,0.17,0.42> }
#declare Plum2_MappedPigment = pigment{color Yellow};


#declare Plum2_Finish = finish {
	specular 1 //Max highlight intensity: 0 -> 1
    roughness 0.25 //surface roughness: 0.0005 -> 1
    emission 100
    ambient 100
    brilliance 100            
};

#declare Plum2_Material_ = material {
	texture {
		Radiance
	}
}
//==================================================
#declare Plum3_MappedPigment = pigment { color rgb <0.24,0.96,0.86> }

#declare Plum3_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Plum3_Material_ = material {
	texture {
		Abyss
	}
}
//==================================================
#declare Plum4_MappedPigment = pigment { color rgb <0.20,0.64,0.04> }

#declare Plum4_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Plum4_Material_ = material {
	texture {
		Radiance
	}
}
//==================================================
#declare Plum5_MappedPigment = pigment { color rgb <0.06,0.88,0.77> }

#declare Plum5_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Plum5_Material_ = material {
	texture {
		Abyss
	}
}
//==================================================
#declare Plum6_MappedPigment = pigment { color rgb <0.24,0.10,0.93> }

#declare Plum6_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};

#declare Plum6_Material_ = material {
	texture {
		Radiance
	}
}
//==================================================
//#declare Orange_MappedPigment = pigment { color rgb <0.14,0.62,0.82> }
#declare Orange_MappedPigment = testPigment2;

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
//#declare Pear_MappedPigment = pigment { color rgb <0.24,0.07,0.80> }
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
//#declare LeftGrapes_MappedPigment = pigment { color rgb <0.63,0.98,0.66> }
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
//#declare Apple_MappedPigment = pigment { color rgb <0.94,0.05,0.20> }
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
//#declare RightGrapes_MappedPigment = pigment { color rgb <0.98,0.77,0.37> }
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
//#declare Banana1_MappedPigment = pigment { color rgb <0.78,0.20,0.00> }
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
//#declare Banana2_MappedPigment = pigment { color rgb <0.19,0.64,0.56> }
#declare Banana2_MappedPigment = checkerPigment


/*
#declare Banana2_Finish = finish {
	specular 0.5 //Max highlight intensity: 0 -> 1
      roughness 0.1 //surface roughness: 0.0005 -> 1             
};
*/

#declare Banana2_Material_ = material {
	texture {
		pigment { uv_mapping Banana2_MappedPigment }
		//finish { Banana2_Finish }
	}
}//==================================================
