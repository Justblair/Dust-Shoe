// Dust Shoe

spindleCollarD 	= 26;
spindleCollarH	= 6 ;
curtainDepth	= 26 ; 
ringThickness	= 5 ; 
vacHoleD		= 42 ;	 
holeDist		= 50 ;
m3HoleD			= 3.4 ; 


difference(){
	curtain();
	fixtureCutout();
}

difference (){
	Top();
	holes();
	fixtureCutout();
}

module Top(){
	hull(){
		cylinder(r = spindleCollarD / 2 + ringThickness, h = spindleCollarH);
		translate ([0, holeDist, 0])	
			cylinder (r = vacHoleD / 2 + ringThickness, h = spindleCollarH);
	}
	lugs();
}

module holes(){
	translate ([0,0, -.2]){
		cylinder(r = spindleCollarD / 2, h = spindleCollarH + .4);
		translate ([0, holeDist, 0])	
			cylinder (r = vacHoleD / 2, h = spindleCollarH + .4);
			}
}

module curtain(){
	difference(){
		hull(){
			cylinder(r = spindleCollarD / 2 + ringThickness, h = curtainDepth);
			translate ([0, holeDist, 0])	
				cylinder (r = vacHoleD / 2 + ringThickness, h = curtainDepth);
		}
		hull(){
			cylinder(r = spindleCollarD / 2 + ringThickness - .5, h = curtainDepth + .1);
			translate ([0, holeDist, 0])	
				cylinder (r = vacHoleD / 2 + ringThickness - .5, h = curtainDepth + .1);
		}	
	}
}

module lugs(){
	difference(){
		translate ([0, -(ringThickness + 2.5), 0]){
			cube([30, ringThickness, spindleCollarH]);
			translate([0, ringThickness + 5, 0])
				cube([30, ringThickness, spindleCollarH]);
		}
	translate([30 - 5 ,10,spindleCollarH /2 ])
		rotate ([90,0,0])
			cylinder(r= m3HoleD/2 , h = 30);
	}
}

module fixtureCutout(){
	translate([0,-2.5, 0]){
		cube([30, 5, spindleCollarH]);
	}
	translate([10,-117.5,spindleCollarH]){
		cube([120, 120, .4]);
	}
}