include <config.scad>;
use <grooves.scad>;

difference() {
    cylinder(h = head_height, r = head_radius);
    decorative_grooves();
}
