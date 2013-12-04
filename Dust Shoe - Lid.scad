// Dust Shoe

spindleCollarD 	= 27 ;
spindleCollarH	= 2 ;
curtainDepth	= 5 ; 
ringThickness	= 5 ; 
vacHoleD		= 42 ;	 
holeDist		= 55 ;
m3HoleD			= 3.4 ; 
lugLength		= 25.2 ; 
lip				= .6 ;

difference(){
	curtain();
	//fixtureCutout();
}

difference (){
	Top();
	holes();
	//fixtureCutout();
}

 
module Top(){
	hull(){
		cylinder(r = spindleCollarD / 2 + lip + ringThickness, h = spindleCollarH);
		translate ([0, holeDist, 0])	
			cylinder (r = vacHoleD / 2 + lip + ringThickness, h = spindleCollarH);
	}
}

module holes(){
	translate ([0,0, -.2]){
		cylinder(r = spindleCollarD / 2 + 2.1 , h = spindleCollarH + .4);
	}
}

module curtain(){
	difference(){
		hull(){
			cylinder(r = spindleCollarD / 2 + lip + ringThickness, h = curtainDepth);
			translate ([0, holeDist, 0])	
				cylinder (r = vacHoleD / 2 + lip + ringThickness, h = curtainDepth);
		}
		hull(){
			cylinder(r = spindleCollarD / 2 + lip + ringThickness - .5, h = curtainDepth + .1);
			translate ([0, holeDist, 0])	
				cylinder (r = vacHoleD / 2 + lip + ringThickness - .5, h = curtainDepth + .1);
		}	
	}
}