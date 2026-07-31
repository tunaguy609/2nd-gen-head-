include <config.scad>;

function groove_z(index) =
    head_height - groove_top_offset - groove_width - index * (groove_width + groove_spacing);

module groove_cut(z_position) {
    translate([0, 0, z_position])
        rotate_extrude()
            translate([head_radius - groove_depth, 0, 0])
                square([groove_depth, groove_width]);
}

module decorative_grooves() {
    for (index = [0 : groove_count - 1]) {
        groove_cut(groove_z(index));
    }
}
