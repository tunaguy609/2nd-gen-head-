include <config.scad>;
use <grooves.scad>;

module head_body() {
    rotate_extrude()
        polygon([
            [0, 0],
            [head_radius, nose_length],
            [head_radius, head_length],
            [0, head_length]
        ]);
}

difference() {
    head_body();
    decorative_grooves();
}
