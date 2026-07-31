# 2nd-gen-head-

OpenSCAD model files for a lure head with a rounded nose, staged body expansion, decorative grooves, machined eye pads, and final internal bores.

## Files

- `/home/runner/work/2nd-gen-head-/2nd-gen-head-/config.scad` stores the tunable profile stations, rear diameter, and groove settings.
- `/home/runner/work/2nd-gen-head-/2nd-gen-head-/grooves.scad` defines the groove cutters.
- `/home/runner/work/2nd-gen-head-/2nd-gen-head-/body.scad` defines the main body profile and grooved-body module.
- `/home/runner/work/2nd-gen-head-/2nd-gen-head-/eyes.scad` creates the eye pads first and then cuts the eye pockets into them.
- `/home/runner/work/2nd-gen-head-/2nd-gen-head-/bores.scad` adds the internal bores and renders the finished lure.
- `/home/runner/work/2nd-gen-head-/2nd-gen-head-/head.scad` remains a compatibility entry point that renders `finalLure()`.

## Usage

Render `/home/runner/work/2nd-gen-head-/2nd-gen-head-/head.scad` in OpenSCAD. The default profile uses:

- 0–8 mm: rounded nose
- 8–25 mm: gentle expansion
- 25–45 mm: continued expansion
- 45–53 mm: transition into the 24 mm rear diameter
- 53–65 mm: straight rear section

Adjust the profile station radii or groove values in `config.scad` to tune the final shape.
Adjust the eye pad and eye pocket settings in `config.scad` to tune the eye placement.
Adjust the leader-hole and skirt-bore settings in `config.scad` before exporting the final STL from `bores.scad` or `head.scad`.