include <config.scad>;
use <eyes.scad>;

//==================================================
// INTERNAL BORES
//==================================================

module internalBores() {
    assert(
        skirtPocketDepth <= headLength,
        "skirtPocketDepth must not exceed the overall head length."
    );

    // Leader through-hole
    if (showLeaderHole)
        translate([0, 0, -spigotLength - 1])
            cylinder(
                h = headLength + spigotLength + 2,
                d = leaderHole
            );

    // Rear skirt pocket
    translate([0, 0, headLength - skirtPocketDepth])
        cylinder(
            h = skirtPocketDepth + 0.01,
            d = skirtPocketDiameter
        );
}

//==================================================
// FINAL LURE
//==================================================

module finalLure() {
    difference() {
        lureWithEyes();
        internalBores();
    }
}

// Render the finished lure
finalLure();
