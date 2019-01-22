$fn = 64;

translate([0, 0, 6])
rotate([90, 0, 0])
difference() {
    cylinder(r=6, h=60);
    translate([0, 0, -1])
    cylinder(r=5, h=62);
}

translate([-6, -2, 0])
cube([12, 42, 1]);

translate([-6, -2, 0])
cube([12, 2, 6]);