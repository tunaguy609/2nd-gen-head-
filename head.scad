include <config.scad>;
use <grooves.scad>;

function rounded_nose_points() = [
    for (step = [0 : nose_samples])
        [
            nose_end_radius * sin(90 * step / nose_samples),
            nose_length * step / nose_samples
        ]
];

function body_profile_points() =
    concat(
        rounded_nose_points(),
        [
            [expansion_one_end_radius, expansion_one_end],
            [expansion_two_end_radius, expansion_two_end],
            [head_radius, transition_end],
            [head_radius, head_length],
            [0, head_length]
        ]
    );

module head_body() {
    assert(
        nose_length < expansion_one_end &&
        expansion_one_end < expansion_two_end &&
        expansion_two_end < transition_end &&
        transition_end < head_length,
        "Body profile dimensions must increase from nose to rear."
    );

    rotate_extrude()
        polygon(body_profile_points());
}

difference() {
    head_body();
    decorative_grooves();
}
