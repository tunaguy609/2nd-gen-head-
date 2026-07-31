include <config.scad>;
use <grooves.scad>;

//===========================================
// EYE PADS
//===========================================

module eyePads() {
    assert(
        eyeFromNose >= nose_length && eyeFromNose <= head_length,
        "eyeFromNose must be within the body length."
    );

    for (side = [-1, 1]) {
        translate([
            side * (bodyDiameter / 2 - 0.3),
            0,
            eyeFromNose
        ])
            rotate([0, side == 1 ? -90 : 90, 0])
                cylinder(
                    d = eyePadDiameter,
                    h = eyePadDepth
                );
    }
}

//===========================================
// EYE POCKETS
//===========================================

module eyePockets() {
    for (side = [-1, 1]) {
        translate([
            side * (bodyDiameter / 2 + 0.02),
            0,
            eyeFromNose
        ])
            rotate([0, side == 1 ? -90 : 90, 0])
                cylinder(
                    d = eyeDiameter,
                    h = eyeDepth
                );
    }
}

//===========================================
// BODY WITH EYES
//===========================================

module lureWithEyes() {
    difference() {
        union() {
            lureWithGrooves();

            if (showEyePads)
                eyePads();
        }

        eyePockets();
    }
}
