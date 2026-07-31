//
//==================================================
//  HAYWIRE TACKLE
//  DOUBLE SKIRT TROLLING LURE
//==================================================
//

// Resolution
$fn = 180;

//--------------------------------------------------
// HEAD
//--------------------------------------------------

headLength = 65;

bodyDiameter = 24;

noseDiameter = 7;


//--------------------------------------------------
// SPIGOT
//--------------------------------------------------

spigotDiameter = 19;

spigotLength = 22;

shoulderRadius = 1;


//--------------------------------------------------
// COLLARS
//--------------------------------------------------

collarWidth = 2;

collarHeight = 1;

collarSpacing = 10;

// Distance from shoulder to first collar
collarOffset = 6;


//--------------------------------------------------
// EYES
//--------------------------------------------------

eyeDiameter = 10;

eyeDepth = 2.5;

eyeFromNose = 50;

// Flatten pad diameter around eye
eyePadDiameter = 14;

eyePadDepth = 0.6;


//--------------------------------------------------
// GROOVES
//--------------------------------------------------

grooveWidth = 1.5;

grooveDepth = 1.0;

groove1 = 30;

groove2 = 36;


//--------------------------------------------------
// INTERNAL BORES
//--------------------------------------------------

leaderHole = 2.5;

skirtPocketDepth = 20;

skirtPocketDiameter = 16;


//--------------------------------------------------
// RENDER OPTIONS
//--------------------------------------------------

showLeaderHole = true;

showEyePads = true;

showGrooves = true;

showCollars = true;


//--------------------------------------------------
// DERIVED VALUES
//--------------------------------------------------

noseRadius = noseDiameter / 2;
bodyRadius = bodyDiameter / 2;
spigotRadius = spigotDiameter / 2;
totalLength = headLength + spigotLength;

groove1Start = groove1 - grooveWidth / 2;
groove1End = groove1 + grooveWidth / 2;
groove2Start = groove2 - grooveWidth / 2;
groove2End = groove2 + grooveWidth / 2;

collar1Start = headLength + collarOffset;
collar1End = collar1Start + collarWidth;
collar2Start = collar1Start + collarSpacing;
collar2End = collar2Start + collarWidth;

function lerp(a, b, t) = a + (b - a) * t;

function headBaseRadius(z) =
    lerp(noseRadius, bodyRadius, min(max(z / headLength, 0), 1));

function headOuterPoints() =
    showGrooves ?
        [
            [noseRadius, 0],
            [headBaseRadius(groove1Start), groove1Start],
            [headBaseRadius(groove1Start) - grooveDepth, groove1Start],
            [headBaseRadius(groove1End) - grooveDepth, groove1End],
            [headBaseRadius(groove1End), groove1End],
            [headBaseRadius(groove2Start), groove2Start],
            [headBaseRadius(groove2Start) - grooveDepth, groove2Start],
            [headBaseRadius(groove2End) - grooveDepth, groove2End],
            [headBaseRadius(groove2End), groove2End],
            [bodyRadius, headLength]
        ] :
        [
            [noseRadius, 0],
            [bodyRadius, headLength]
        ];

function spigotOuterPoints() =
    showCollars ?
        [
            [bodyRadius, headLength],
            [spigotRadius, headLength + shoulderRadius],
            [spigotRadius, collar1Start],
            [spigotRadius + collarHeight, collar1Start],
            [spigotRadius + collarHeight, collar1End],
            [spigotRadius, collar1End],
            [spigotRadius, collar2Start],
            [spigotRadius + collarHeight, collar2Start],
            [spigotRadius + collarHeight, collar2End],
            [spigotRadius, collar2End],
            [spigotRadius, totalLength]
        ] :
        [
            [bodyRadius, headLength],
            [spigotRadius, headLength + shoulderRadius],
            [spigotRadius, totalLength]
        ];

function outerProfilePoints() =
    concat(
        [[0, 0]],
        headOuterPoints(),
        spigotOuterPoints(),
        [[0, totalLength]]
    );

module outerShell() {
    rotate_extrude(convexity = 10)
    polygon(points = outerProfilePoints());
}

module radialPocket(diameter, depth, z, side) {
    translate([side * (headBaseRadius(z) - depth + diameter / 2), 0, z])
    rotate([90, 0, 0])
    cylinder(h = diameter * 2, d = diameter, center = true);
}

module lureHead() {
    difference() {
        outerShell();

        if (showLeaderHole) {
            translate([0, 0, -1])
            cylinder(h = totalLength + 2, d = leaderHole);
        }

        translate([0, 0, totalLength - skirtPocketDepth])
        cylinder(h = skirtPocketDepth + 1, d = skirtPocketDiameter);

        if (showEyePads) {
            radialPocket(eyePadDiameter, eyePadDepth, eyeFromNose, 1);
            radialPocket(eyePadDiameter, eyePadDepth, eyeFromNose, -1);
        }

        radialPocket(eyeDiameter, eyeDepth, eyeFromNose, 1);
        radialPocket(eyeDiameter, eyeDepth, eyeFromNose, -1);
    }
}

lureHead();
