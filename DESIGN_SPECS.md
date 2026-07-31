# Design Specifications — 2nd-Gen Trolling Head Lure

## 1. Purpose and Target Species

The 2nd-Gen Head is designed for **offshore trolling** at typical spread speeds of 6–12 knots. It is sized for:

- **Primary targets:** Yellowfin tuna, wahoo, mahi-mahi, blue/black marlin (smaller size variant)
- **Running depth:** Surface to 1 m (depending on ballast weight and trolling speed)
- **Intended position:** Long rigger, short rigger, or flat line

---

## 2. Geometry

### 2.1 Head Profile

| Dimension               | Value     | Notes                                          |
|-------------------------|-----------|------------------------------------------------|
| Overall head length     | 75 mm     | Nose face to skirt collar rear                 |
| Maximum diameter        | 38 mm     | At the skirt collar (rear)                     |
| Nose face diameter      | 32 mm     | Concave cup at the front                       |
| Face concavity depth    | 6 mm      | Dish depth of the concave nose cup             |
| Skirt collar OD         | 40 mm     | Slight flare to retain silicone skirt          |
| Skirt collar length     | 12 mm     | Axial length of the collar                     |
| Body taper angle        | ~4°       | Half-angle from centreline (bullet taper)      |

### 2.2 Through-Wire Channel

| Dimension               | Value     |
|-------------------------|-----------|
| Hole diameter           | 4 mm      |
| Position                | On centreline, nose to skirt collar |
| Counterbore at nose     | 8 mm dia × 4 mm deep (seats loop crimp) |
| Counterbore at collar   | 8 mm dia × 4 mm deep (seats hook snap) |

A **400 lb (180 kg) stainless-steel single-strand or cable** through-wire is threaded through the centreline hole. A swaged/crimped loop is formed at the nose for the leader, and a snap or direct hook is attached at the rear.

### 2.3 Ballast Channel

| Dimension               | Value     |
|-------------------------|-----------|
| Channel diameter        | 12 mm     |
| Channel depth           | 35 mm     | Blind hole from the nose face, concentric with body |
| Purpose                 | Houses a turned lead or tungsten ballast insert |

The ballast insert is pressed or epoxied in place after the through-wire is rigged. See Section 5 for weight guidelines.

### 2.4 Gill Cuts (decorative / hydrodynamic)

Two symmetric **V-shaped grooves** are cut into the sides of the head, 20 mm back from the nose face, running at 30° to the centreline. Groove width: 2 mm; depth: 1.5 mm.

---

## 3. Materials

### 3.1 Head Body

| Option         | Material              | Pros                              | Cons                        |
|----------------|-----------------------|-----------------------------------|-----------------------------|
| 3D-printed     | PETG or ABS           | Low cost, fast iteration          | May need UV coating         |
| Cast resin     | Polyurethane resin    | Smooth finish, easy to colour     | Brittle if thin             |
| Machined       | 6061-T6 aluminium     | Durable, premium                  | Higher cost                 |
| Cast metal     | Lead-free pewter alloy| Self-weighting                    | Heavy; requires mold        |

Recommended surface finish: **spray paint + 2–3 coats automotive clear coat** or **UV-cure epoxy coating** for saltwater durability.

### 3.2 Skirt

- **Material:** 8–10 strand silicone skirting (round-hole sheet cut to length)
- **Length:** 150–180 mm from collar to skirt tip
- **Colour combinations (common):** black/purple, blue/white, pink/white, green/yellow

### 3.3 Through-Wire

- **Single strand:** 400 lb (0.062" / 1.57 mm) stainless-steel wire, haywire twist + barrel roll termination
- **Cable alternative:** 400 lb 49-strand stainless cable with aluminium crimp sleeves

### 3.4 Hook

| Target fish size    | Hook recommendation                       |
|---------------------|-------------------------------------------|
| Mahi / small tuna   | 8/0 – 10/0 inline single hook             |
| Wahoo               | 10/0 – 12/0 inline single + stinger rig  |
| Large tuna / marlin | 11/0 – 14/0 big-game J-hook or circle    |

---

## 4. Hydrodynamics and Action

The **concave face** is the key functional feature. As the lure is trolled:

1. Water is captured in the cup and deflected to the sides.
2. This creates a cone of **cavitation bubbles** behind the face (the "smoke trail").
3. The bubble column destabilises slightly at higher speeds (>9 knots), causing a **side-to-side darting action**.
4. The **bullet taper** allows the lure to self-right quickly and re-enter the water cleanly after popping through the surface.

### Tuning

- **More smoke / more erratic action:** increase `face_concavity` (deeper cup)
- **Straighter, calmer action:** decrease `face_concavity` (shallower cup)
- **Faster running speed preference:** reduce head length and increase ballast weight

---

## 5. Ballast / Weight Guide

| Target trolling speed | Recommended head weight (with ballast) |
|-----------------------|-----------------------------------------|
| 6–8 knots             | 45–55 g                                 |
| 8–10 knots            | 55–70 g                                 |
| 10–12 knots           | 70–90 g                                 |

The unweighted printed/resin head body (75 mm, 38 mm dia) is approximately **18–22 g**. The ballast insert makes up the remaining weight. Turned lead inserts are easy to cast from wheel weights.

---

## 6. Assembly Instructions

1. **Prepare the through-wire:** Cut stainless wire to 300 mm. Form a loop (~30 mm) at one end using haywire twist. This end goes into the **nose counterbore**.
2. **Thread wire through head:** Insert wire from nose to collar end.
3. **Seat the nose loop:** Pull the loop tight into the nose counterbore. Apply a small amount of marine-grade epoxy to lock in place.
4. **Insert ballast:** Press/epoxy the turned ballast insert into the nose ballast channel, around the wire.
5. **Attach skirt:** Slide the silicone skirt over the collar. Secure with a rubber banding or rigging floss whip.
6. **Attach hook:** At the collar end, form a snap or a second haywire loop on the wire and attach the chosen hook or hook-and-stinger rig.
7. **Finish:** Coat with UV-cure epoxy or clear coat. Allow to cure before fishing.

---

## 7. Colour Schemes

| Name              | Head colours          | Skirt colours          |
|-------------------|-----------------------|------------------------|
| Blue Water        | Blue pearl / silver   | Blue / white           |
| Black Magic       | Gloss black           | Black / purple         |
| Mahi Special      | Chartreuse / yellow   | Green / yellow         |
| Wahoo Rocket      | Silver chrome         | Pink / white / silver  |
| Sunrise           | Orange pearl          | Orange / red / yellow  |

Airbrushing with Createx or Wicked Colors automotive acrylics over a white primer base gives the most durable and vibrant results.

---

## 8. Version History

| Version | Date       | Changes                                   |
|---------|------------|-------------------------------------------|
| 1.0     | —          | Original flat-face design                 |
| 2.0     | 2026-07-31 | Added concave face, gill cuts, double counterbore, parametric OpenSCAD model |
