module retaining_collar(spigot_diameter, collar_width, collar_thickness, z_offset = 0) {
    translate([0, 0, z_offset])
        difference() {
            cylinder(h = collar_width, d = spigot_diameter + (2 * collar_thickness));
            cylinder(h = collar_width, d = spigot_diameter);
        }
}

module retaining_collars(
    spigot_diameter,
    collar_width = 5,
    collar_thickness = 2,
    clear_spacing = 10
) {
    retaining_collar(spigot_diameter, collar_width, collar_thickness, 0);
    retaining_collar(
        spigot_diameter,
        collar_width,
        collar_thickness,
        collar_width + clear_spacing
    );
}
