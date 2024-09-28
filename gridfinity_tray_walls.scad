// gridfinity parameters; feel free to edit for customization, but don't if you want compatibility
$fa = 8;
$fs = 0.25;
grid = 42;
bpod = 4;

/* user parameters
    gridx,gridy = same as always
    wallx,wally = thickness of walls in x,y
    u = height of walls above baseplate (x7mm)
*/
gridx = 4;
gridy = 5;
wall = 2;
u = 1;

// shape drawing and parameter math; do not change
overlap = 0.001;
height = u==0 ? 0 : 7*u+overlap;
cubex = grid*gridx;
cubey = grid*gridy;

translate([-(cubex+bpod)/2-wall,-(cubey+bpod)/2-wall,0])
union() {
   intersection() { // corner 1 (quadrant )
      difference() {
         translate([bpod+wall,bpod+wall,0])
            cylinder(h=height,r=bpod+wall);
         translate([bpod+wall,bpod+wall,-overlap])
            cylinder(h=height+2*overlap,r=bpod);
      }
      cube([bpod+wall,bpod+wall,height]);
   }
   translate([cubex+wall,0,0])
   intersection() { // corner 2 (quadrant )
      difference() {
         translate([0,bpod+wall,0])
            cylinder(h=height,r=bpod+wall);
         translate([0,bpod+wall,-overlap])
            cylinder(h=height+2*overlap,r=bpod);
      }
      cube([bpod+wall,bpod+wall,height]);
   }
   translate([cubex+wall,cubey+wall,0])
   intersection() { // corner 3 (quadrant )
      difference() {
         cylinder(h=height,r=bpod+wall);
         translate([0,0,-overlap])
            cylinder(h=height+2*overlap,r=bpod);
      }
      cube([bpod+wall,bpod+wall,height]);
   }
   translate([0,cubey+wall,0])
   intersection() { // corner 4 (quadrant )
      difference() {
         translate([bpod+wall,0,0])
            cylinder(h=height,r=bpod+wall);
         translate([bpod+wall,0,-overlap])
            cylinder(h=height+2*overlap,r=bpod);
      }
      cube([bpod+wall,bpod+wall,height]);
   }
   translate([0,bpod+wall,0])
      cube([wall,cubey-bpod,height]); // side 1
   translate([bpod+wall,0,0])
      cube([cubex-bpod,wall,height]); // side 2
   translate([cubex+bpod+wall,bpod+wall,0])
      cube([wall,cubey-bpod,height]); // side 3
   translate([bpod+wall,cubey+bpod+wall,0])
      cube([cubex-bpod,wall,height]); // side 4
}