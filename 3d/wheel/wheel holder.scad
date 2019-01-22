// 6 inch ball
// center is 11.6 inches from bottom plate
// center is 3.5 inches in front of posts

// thorlabs piece is 16.1 mm center-to-center
// vertical arms are 2 (or integers >= 2) inches in front of headpost posts
// vertical arms are 7 or 5 inches apart

// Mounting posts are expected to be 2 inches in front of headpost bars

// Move backwards 2 cm

use <utilities.scad>
use <curvedPipe.scad>
$fn = 64;

wheel_diameter = 14; // in cm
wheel_width = 6; // in cm
spring_width = 10; // in mm
spring_length = 30; // in mm, originally 50
spring_thickness = 1.8; // in mm
distance_from_wheel_to_headpost_supports = 10.4; // in cm, center-to-center
running_encoder = false;

//bearings 13.4 mm diameter
// Full width = 200 mm

module bearingCase(width, thickness) {
    union() {
        translate([0, 0, 12])
        rotate([0, 90, 0])
        difference() {
            union() {
                cylinder(r=13.4/2 + 3, h=3);
                translate([0, -13.4/2 - 3, 0])
                cube([12, 13.4 + 6, 3]);
            }
            
            translate([0, 0, -1])
            cylinder(r=13.4/2, h=5);
        }
        
        translate([0, -13.4/2 - 3, 0])
        linear_extrude(3)
        polygon([[0, 0], [3, 13.4 + 6], [width + 5, 0]]);
    
        // Toe plate
        translate([15, -13.4/2 - 3 - 3.3, 0])
        rotate([0, -90, 0])
        linear_extrude(width)
        polygon([[0, 0], [thickness, 0], [3, 3.3], [0, 3.3]]);
    }
}


module spring(w, l, d, fb=08) {
    // Backwards must be less than 2 inches - 50 mm
    // Forwards must be 1.5 inches- 38 mm
    // 7 
    // Total width must be less than 160 mm
    // FB is forward-back distance. originally 28. Now 08.
    
    backward = (l - fb)/2;
    forward = fb + backward;
    
    // Spring forward
    translate([0, -backward - 3, 0])
    cube([w, forward, d]);
    
    // Spring back
    translate([13, -backward - 3, 0])
    cube([w, backward, d]);
    
    // Hinge
    translate([0, -backward - 3, 0]) {
        cube([23, 3, 3]);
        translate([0, 0, 3])
        rotate([0, 90, 0])
        cylinder(r=3, h=23);
    }
    
    translate([13, -3, 0])
    cube([10, 3, 3]);
    
    translate([13, 0, 3])
    rotate([0, 90, 0])
    cylinder(r=3, h=12);
}

module post(ww) {
    translate([70, 0, 6])
    rotate([0, 90, 0])
    pipe(12.0, 8.0, 30 - 3.05);
    
    translate([ww/2 + 2.5 + 5 + 25, 0, 3])
    rotate([0, 90, 0])
    hullPipe(6, 12, -12/2 + 6/2, 2, 100 - (30 + ww/2 + 2.5 + 5 + 25));  
//    hullPipe(w, 12, -6 + w/2, 1, 15);
}

module encoderHolder(clearance=1.5) {
    // For Yuma E6B2-CWZ3E
    
    translate([0, -31, (40 + clearance)/2 + 2])
    rotate([-90, 0, 0])
    union() {
        // Faceplate
        difference() {
            cylinder(r=(40 + clearance)/2 + 2, h=3);
            translate([0, 0, -1])
            cylinder(r=(20.2 + clearance)/2, h=5);
            
            translate([0, 0, -1])
            difference() {
                cylinder(r=40/2 - 3.5, h=5);
                translate([0, 0, -1])
                cylinder(r=20.2/2 + 3.5, h=7);
                translate([-5, 8, -2])
                cube(10);
                
                rotate([0, 0, 120])
                translate([-5, 8, -2])
                cube(10);
                
                rotate([0, 0, 240])
                translate([-5, 8, -2])
                cube(10);
            }
        }
        
        // Body
        translate([0, 0, -42]) {
        difference() {
            union() {
                // Long body
                difference() {
                    cylinder(r=(40 + clearance)/2 + 2, h=42);
                    translate([0, 0, -1])
                    cylinder(r=(40 + clearance)/2, h=44);
                }
                
                // Rim
                difference() {
                    cylinder(r=(40 + clearance)/2 + 2, h=2);
                    translate([0, 0, -1])
                    cylinder(r=(40 + clearance)/2 - 2, h=4);
                }
            }
            
            translate([0, 0, -8]) {
                translate([-4.25, 15, -1])
                cube([9.5, 20, 50]);
                
                linear_extrude(50)
                polygon([
                    [0, 0],
                    [50*sin(45), 50*cos(45)],
                    [50*sin(165), 50*cos(165)],
                ]);
                
                linear_extrude(50)
                polygon([
                    [0, 0],
                    [50*sin(195), 50*cos(195)],
                    [50*sin(-45), 50*cos(-45)],
                ]);
                
            }
        }}
    }
}

module halfBracket(wd, ww, wf, sw, sl, sd, fb=8) {
    union() {
        post(ww);
        // Bearing, when translated correctly, is 25 mm ahead of 0
        translate([ww/2 + 2.5, fb+10, 0])
        bearingCase(sw, sd);
        translate([ww/2 + 2.5 + 5, 0, 0])
        spring(sw, sl, sd);
        
        translate([0, 0, 3])
        curvedPipe([
            [ww/2 + 2.5 + 13 + 3 + 5 + 5, 0, 0],
            [ww/2 + 2.5 + 13 + 3 + 5 + 5, wd/2 + 10 + 38 + 10, 0],
            [0, wd/2 + 10 + 38 + 10, 0],
        ], 2, [20], 6, 2, fn=128);
    }
}

module bracket(wd, ww, wf, sw, sl, sd, enc=true) {
    if (running_encoder) {
        difference() {
            union() {
                copy_mirror([1, 0, 0]) {
                    halfBracket(wd, ww, wf, sw, sl, sd);
                }
                meterAdd(wd, ww);
            }
            
            meterSubtract(wd, ww);
        }
    }
    else {
        union() {
            halfBracket(wd, ww, wf, sw, sl, sd);
            mirror([1, 0, 0])
            halfBracket(wd, ww, wf, sw, sl, sd);
        }
    }
}

module meterAdd(wd, ww) {
    //reflectanceMeter(wd, ww);
    pairedBreakDetector(wd, ww);
    translate([10, 5, 0])
    adafruitMetro(wd, ww);
    
}

module meterSubtract(wd, ww) {
    metro_w = 20;
    metro_h = 44;
    metro_d = 4.5;
    
    translate([24, 5, 0])
    translate([ww/2 + 22, wd/2 + 38 + 10 + 3 + 2 - metro_h - 3.5, 2])
    cube([metro_w + 0.5, metro_h + 0.5, 15]);
        
    translate([17, 0, -1])
    translate([ww/2 + 5, 38 + wd/2 - 3, 0])
    translate([0, -19.1/2, 2])
    cube([20, 19.1, 15]);
}

module breakDetector(wd, ww) {
    // Do not print! For reference only
    color([0.3, 0.3, 0.6])
    translate([-2.5, -18.6/2, 0])
    difference() {
        cube([15.2, 18.6, 5]);
        translate([-1, 8.6/2, -1])
        cube([13.2, 10, 7]);
    }
}

module pairedBreakDetector(wd, ww) {
    translate([ww/2 + 5, 38 + wd/2 - 3, 0]) {
        union() {
            //translate([0, 0, 1.5])
            //breakDetector(wd, ww);
            
            //translate([0, 0, 6.5])
            //breakDetector(wd, ww);
            
            translate([11, -18.6/2 - 2, 0])
            cube([15, 18.6 + 4, 1]);
        
            translate([11, -18.6/2 - 2 - 0.25, 0])
            cube([15, 2, 1.5 + 10 + 2]);
        
            translate([11, 18.6/2 + 0.25, 0])
            cube([15, 2, 1.5 + 10 + 2]);
        
            difference() {
                translate([15.2 - 2.5 - 5.5, -(18.6 + 0.5 + 4)/2, 0])
                cube([3 + 0.5 + 4, 18.6 + 0.5 + 4, 1 + 10 + 0.5 + 2]);
                
                translate([11.7, 5, -1])
                cube([10, 7.6, 20]);
                
                translate([11.7, -5 - 7.6, -1])
                cube([10, 7.6, 20]);
                
                translate([1.75, -8.3, 1])
                cube([10, 16.6, 15]);  
              
                translate([0, -19.1/2, 1.25])
                cube([13.2, 19.1, 10.5]);  
                
                translate([12, -1.5, 1.25])
                cube([5, 3, 11.5]);
            }
        }
    }    
}

module reflectanceMeter(wd, ww) {
    meter_w = 7.7;
    meter_h = 14;
    meter_d = 1.7;
    board_d = 1.5;
    
//    translate([0, 10, 0])
    translate([ww/2 + 3 + meter_d, wd/2 + 38 + 10 - meter_w/2 - 2 - 16, 0])
    difference() {
        cube([board_d + 2, meter_w + 4.5, meter_h + 2]);
        translate([-2, 2.25, 2])
        cube([board_d + 2, meter_w + 0.5, meter_h + 2]);
        // Wire output
        translate([-1, 2.25, 2 + meter_h - 3.5])
        cube([5, meter_w + 0.5, 20]);
    }
}

module adafruitMetro(wd, ww) {
    metro_w = 20;
    metro_h = 44;
    metro_d = 4.5;
    
    translate([ww/2 + 20 + 14, wd/2 + 38 + 10 + 3 - metro_h - 3.5, 0])
    difference() {
        union() {
            cube([metro_w + 4.5, metro_h + 3.5, 13.5]);
            translate([0, 10, 0])
            linear_extrude(13.5)
            polygon([
                [0, 0], [-14, 5], [-14, 28.0], [0, 33]
            ]);
        }    
        translate([2, 2, 2])
        cube([metro_w + 0.5, metro_h + 0.5, metro_d + 2 + 4]);
        translate([metro_w/2 + 4.5/2 - 6, metro_h, 2])
        //cube([9, 5, 5.5]);
        cube([12, 5, 10]);
        
        translate([0, 10, 2])
        linear_extrude(20)
        polygon([
            [3, 2], [-14, 7.5], [-14, 25.5], [3, 31]
        ]);
        
    }
}

//adafruitMetro(wheel_diameter*10, wheel_width*10);
//reflectanceMeter(wheel_diameter*10, wheel_width*10);
bracket(wheel_diameter*10, wheel_width*10, distance_from_wheel_to_headpost_supports*10, spring_width, spring_length, spring_thickness, running_encoder);