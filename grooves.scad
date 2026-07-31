include <config.scad>;

function groove_z(index) =
    head_length - groove_back_offset - groove_width - index * (groove_width + groove_spacing);

module groove_cut(z_position) {
    translate([0, 0, z_position])
        rotate_extrude()
            translate([head_radius - groove_depth, 0, 0])
                square([groove_depth, groove_width]);
}

module decorative_grooves() {
    assert(
        groove_count == 0 || groove_z(groove_count - 1) >= nose_length,
        "Grooves extend into the tapered nose; reduce groove_count or spacing."
    );

    for (index = [0 : groove_count - 1]) {
        groove_cut(groove_z(index));
    }
}
