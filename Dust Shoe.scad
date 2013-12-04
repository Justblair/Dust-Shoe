// Dust Shoe

spindleCollarD 	= 27 ;
spindleCollarH	= 7 ;
curtainDepth	= 26 ; 
ringThickness	= 5 ; 
vacHoleD		= 42 ;	 
holeDist		= 55 ;
m3HoleD			= 3.4 ; 
lugLength		= 25.2 ; 


difference(){
	curtain();
	fixtureCutout();
}

difference (){
	Top();
	holes();
	fixtureCutout();
}

translate([0,0,-spindleCollarH]){
	%cylinder(r= 52.05/2, h = spindleCollarH);
	%cube([52.05+8, 52.05+8, spindleCollarH +2], center = true);
	translate([0,holeDist, 0]) 
		%cylinder (r= 49/2, h = spindleCollarH);
}
 
module Top(){
	hull(){
		cylinder(r = spindleCollarD / 2 + ringThickness, h = spindleCollarH);
		translate ([0, holeDist, 0])	
			cylinder (r = vacHoleD / 2 + ringThickness, h = spindleCollarH);
	}
		translate ([0, holeDist, 0])	
			cylinder (r = vacHoleD / 2 + ringThickness, h = 10);
	lugs();
}

module holes(){
	translate ([0,0, -.2]){
		cylinder(r = spindleCollarD / 2, h = spindleCollarH + .4);
		translate ([0, holeDist, 0])	
			cylinder (r = vacHoleD / 2, h = 18 + .4);
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
	rotate([0,0,-10]){
	difference(){
		translate ([0, -(ringThickness + 2.5), 0]){
			cube([lugLength, ringThickness, spindleCollarH]);
			translate([0, ringThickness + 5, 0])
				cube([lugLength, ringThickness, spindleCollarH]);
		}
	translate([lugLength - 3.5 ,10,spindleCollarH /2 ])
		rotate ([90,0,0]){
			cylinder(r= m3HoleD/2 , h = 30);
			%cylinder(r = 7/2, h=20);
		}
	}
}
}
module fixtureCutout(){
	rotate([0,0,-10]){
	translate([0,-2.5, 0]){
		cube([lugLength, 5, spindleCollarH]);
	}
	// translate([10,-117.5,spindleCollarH]){
		// cube([120, 120, .4]);
	// }
}