module collar_ring(z_pos, body_od = 24, collar_width = 2, collar_height = 1) {
    difference() {
        translate([0, 0, z_pos])
            cylinder(h = collar_width, d = body_od + (2 * collar_height), $fn = 128);
        translate([0, 0, z_pos - 0.01])
            cylinder(h = collar_width + 0.02, d = body_od, $fn = 128);
    }
}

module collars(
    body_od = 24,
    collar_width = 2,
    collar_height = 1,
    clear_spacing = 10,
    rear_offset = 0
) {
    collar_ring(
        z_pos = rear_offset,
        body_od = body_od,
        collar_width = collar_width,
        collar_height = collar_height
    );

    collar_ring(
        z_pos = rear_offset + collar_width + clear_spacing,
        body_od = body_od,
        collar_width = collar_width,
        collar_height = collar_height
    );
}
