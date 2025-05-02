Here's a clean and professional GitHub `README.md` for your 3ds Max script that generates a window with a frame based on user input:

---

# 🪟 3ds Max Window Generator Script

This MaxScript provides a user interface to generate a parametric 3D window model with a surrounding frame. The resulting model is created as a single mesh, combining the glass and the frame with customizable dimensions.

## 📌 Features

* Interactive UI with spinners for input
* Generates a single mesh combining:

  * Glass pane (Material ID: 2)
  * Outer frame (Material ID: 1)
* Parameterized window dimensions:

  * Window height
  * Frame thickness
  * Frame depth
* Automatically positions the glass within the frame

## 🛠️ Parameters

| Parameter       | Description                              | Default | Range    |
| --------------- | ---------------------------------------- | ------- | -------- |
| Window Height   | Vertical size of the glass pane          | 150 cm  | 1–500 cm |
| Frame Thickness | Thickness of the border around the glass | 5 cm    | 1–50 cm  |
| Frame Depth     | Depth (extrusion) of the frame           | 10 cm   | 1–50 cm  |

## 🚀 How to Use

1. Open **3ds Max**.
2. Open the **MaxScript Editor**.
3. Paste the script into the editor.
4. Run the script (`Ctrl + E`).
5. A dialog box titled **"Window Generator"** will appear.
6. Set your desired values and click **"Generate Window"**.

The generated window will appear in your scene with the specified dimensions.

## 📦 Output

* A single editable mesh
* Glass and frame assigned separate material IDs for easy material assignment
* The inner hollow part of the frame is automatically subtracted to make space for the glass

## 🧱 Example Use Case

Quickly prototype architectural elements like modern windows or parametric facade panels, ideal for visualization and design workflows in 3ds Max.


