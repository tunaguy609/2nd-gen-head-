// Base head body geometry only.
// Later modules should add grooves, eye pads/pockets, spigot, collars, and bores.

head_length = 65;
max_diameter = 24;
nose_diameter = 7;
rear_straight_length = 20;

nose_radius = nose_diameter / 2;
max_radius = max_diameter / 2;
taper_length = head_length - rear_straight_length;
curve_steps = 48;

function smoothstep(t) = t * t * (3 - 2 * t);
function taper_radius(t) = nose_radius + (max_radius - nose_radius) * smoothstep(t);

module head_body() {
    rotate_extrude($fn = 180, convexity = 10)
        polygon(points = concat(
            [[0, 0], [nose_radius, 0]],
            [for (i = [1:curve_steps])
                [
                    taper_radius(i / curve_steps),
                    taper_length * (i / curve_steps)
                ]
            ],
            [[max_radius, head_length], [0, head_length]]
        ));
}

head_body();
