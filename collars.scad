// Part 4 — collars.scad
// Two retaining collars on the spigot with 10 mm clear spacing between them.

include <spigot.scad>

// ── Collar parameters ────────────────────────────────────────────────────────
collar_wall   =  4;                          // radial wall thickness (mm)
collar_h      = 10;                          // height of each collar (mm)
collar_od     = spigot_od + 2 * collar_wall; // outer diameter (mm)
collar_gap    = 10;                          // clear spacing between collars (mm)

// ── Module ───────────────────────────────────────────────────────────────────
module collar() {
    difference() {
        cylinder(h = collar_h, d = collar_od, $fn = 64);
        cylinder(h = collar_h, d = spigot_od, $fn = 64);
    }
}

// ── Assembly — two collars, 10 mm apart ──────────────────────────────────────
// Lower collar sits at z = 0; upper collar starts immediately after the gap.
translate([0, 0, 0])
    collar();

translate([0, 0, collar_h + collar_gap])
    collar();
