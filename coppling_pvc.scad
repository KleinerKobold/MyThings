/*
    for building a house with pvc tubes
*/

difference() {
	cylinder (h = 80, r=19, center = true, $fn=100);
	translate ([0,0,20]) rotate ([90,0,0]) cylinder (h = 40, r=15, center = true, $fn=100);
    translate ([0,0,-20]) rotate ([90,0,90]) cylinder (h = 40, r=15, center = true, $fn=100);
}