# 2nd-Gen Trolling Head Lure

A parametric design for a second-generation trolling head lure, optimized for offshore big-game fishing. The design is fully open-source and can be 3D-printed, cast in resin, or machined from aluminum.

---

## Overview

The **2nd-Gen Head** is a bullet-style trolling lure head designed to run straight and true at speeds between 6 and 12 knots. It improves on classic bullet-head designs with:

- A **concave face** that creates a consistent bubble trail and "smoke"
- An **internal weighted insert channel** for lead/tungsten ballast
- A **double-line through-hole** for a reinforced rigging loop
- Streamlined gill cuts for visual appeal and water deflection

---

## Repository Structure

```
.
├── README.md                  ← This file
├── DESIGN_SPECS.md            ← Detailed design specifications
├── BOM.md                     ← Bill of materials
└── lure_head.scad             ← Parametric OpenSCAD 3D model
```

---

## Quick Start

### View / Render the 3D Model

1. Install [OpenSCAD](https://openscad.org/) (free, open-source CAD)
2. Open `lure_head.scad`
3. Press **F5** to preview or **F6** to render
4. Export as STL for 3D printing via **File → Export → Export as STL**

### Key Parameters (top of `lure_head.scad`)

| Parameter         | Default | Description                              |
|-------------------|---------|------------------------------------------|
| `head_length`     | 75 mm   | Total length of the lure head            |
| `head_diameter`   | 38 mm   | Maximum diameter at the widest point     |
| `face_concavity`  | 6 mm    | Depth of the concave face cup            |
| `ballast_diameter`| 12 mm   | Diameter of the internal ballast channel |
| `line_hole_dia`   | 4 mm    | Diameter of the through-wire hole        |

---

## Printing / Casting Recommendations

| Method         | Material              | Notes                                    |
|----------------|-----------------------|------------------------------------------|
| FDM 3D Print   | PETG or ABS           | 100% infill, 3+ perimeters               |
| Resin Print    | Standard/ABS-like UV resin | Paint and UV-coat after printing    |
| Lost-PLA cast  | Aluminum or lead-free alloy | Best weight and durability          |

---

## Rigging

See [`DESIGN_SPECS.md`](DESIGN_SPECS.md) for full rigging instructions and hook-size recommendations.

---

## License

[Creative Commons Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/) — free to use, modify, and share with attribution.