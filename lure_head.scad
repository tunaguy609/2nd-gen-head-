// ============================================================
//  2nd-Gen Trolling Head Lure — Parametric OpenSCAD Model
//  Version 2.0  |  2026-07-31
//  License: CC BY 4.0
//
//  Usage:
//    F5 = quick preview
//    F6 = full render
//    File > Export > Export as STL for 3D printing
//
//  All dimensions in millimetres.
// ============================================================

// ── Top-level parameters ────────────────────────────────────
// Change these to customise the lure head size and shape.

head_length      = 75;   // Total length of the head body (nose to collar rear)
head_diameter    = 38;   // Maximum diameter at the widest point (collar OD)
face_diameter    = 32;   // Outer diameter of the concave nose cup
face_concavity   = 6;    // Depth of the concave dish on the nose face
taper_start      = 20;   // Distance from nose where bullet taper begins
skirt_collar_len = 12;   // Length of the rear skirt collar
skirt_collar_od  = 40;   // OD of the skirt collar (slight flare)

ballast_dia      = 12;   // Diameter of the internal ballast channel
ballast_depth    = 35;   // Depth of the ballast blind hole from the nose face

line_hole_dia    = 4;    // Diameter of the centreline through-wire hole
cbore_dia        = 8;    // Counterbore diameter at nose and collar ends
cbore_depth      = 4;    // Counterbore axial depth

gill_cut_width   = 2;    // Width of gill-cut groove
gill_cut_depth   = 1.5;  // Depth of gill-cut groove
gill_cut_offset  = 20;   // Distance from nose face to gill-cut centre
gill_cut_angle   = 30;   // Angle of gill cut from centreline (degrees)

$fn = 80;  // Smoothness — increase for final render, decrease for fast preview

// ── Derived values ──────────────────────────────────────────
body_len = head_length - skirt_collar_len;  // Length of tapered bullet body

// ============================================================
//  Main assembly
// ============================================================

difference() {
    lure_solid();
    lure_cuts();
}


// ── Solid body (before any cuts) ────────────────────────────
module lure_solid() {
    union() {
        bullet_body();
        skirt_collar();
    }
}


// ── Bullet body ─────────────────────────────────────────────
// A cylinder from the nose to the taper start, then a frustum
// (truncated cone) from the taper start to the collar.
module bullet_body() {
    // Constant-diameter nose section
    cylinder(h = taper_start, d = face_diameter);

    // Tapered section from nose cylinder to collar diameter
    translate([0, 0, taper_start])
        cylinder(
            h = body_len - taper_start,
            d1 = face_diameter,
            d2 = head_diameter
        );
}


// ── Skirt collar (rear flare) ────────────────────────────────
module skirt_collar() {
    translate([0, 0, body_len])
        cylinder(h = skirt_collar_len, d = skirt_collar_od);
}


// ── All subtracted features ──────────────────────────────────
module lure_cuts() {
    concave_face();
    through_wire_hole();
    ballast_channel();
    nose_counterbore();
    collar_counterbore();
    gill_cuts();
}


// ── Concave nose face ────────────────────────────────────────
// A sphere segment carved into the front face to form the cup.
module concave_face() {
    // Radius of the sphere whose segment forms the concavity.
    // r is chosen so the sphere intersects the face plane at face_diameter/2
    // and the deepest point is face_concavity below the face.
    r = (pow(face_diameter / 2, 2) + pow(face_concavity, 2))
        / (2 * face_concavity);

    translate([0, 0, face_concavity - r])
        sphere(r = r);
}


// ── Centreline through-wire hole ─────────────────────────────
module through_wire_hole() {
    cylinder(h = head_length + 1, d = line_hole_dia, center = false);
}


// ── Ballast blind hole (from nose face) ──────────────────────
module ballast_channel() {
    // Offset by face_concavity so the channel starts at the deepest
    // point of the cup rather than the original nose plane.
    translate([0, 0, 0])
        cylinder(h = ballast_depth, d = ballast_dia);
}


// ── Nose counterbore (seats leader crimp loop) ───────────────
module nose_counterbore() {
    translate([0, 0, -0.01])
        cylinder(h = cbore_depth + 0.01, d = cbore_dia);
}


// ── Collar counterbore (seats hook attachment crimp) ─────────
module collar_counterbore() {
    translate([0, 0, head_length - cbore_depth])
        cylinder(h = cbore_depth + 0.01, d = cbore_dia);
}


// ── Gill cuts (symmetric V-grooves on each side) ─────────────
module gill_cuts() {
    for (side = [-1, 1]) {
        rotate([0, 0, 90 * side])
            translate([0, 0, gill_cut_offset])
                rotate([gill_cut_angle, 0, 0])
                    translate([-(head_diameter), -gill_cut_width / 2, 0])
                        cube([
                            head_diameter * 2,
                            gill_cut_width,
                            gill_cut_depth * 20  // long enough to cut fully through surface
                        ]);
    }
}
