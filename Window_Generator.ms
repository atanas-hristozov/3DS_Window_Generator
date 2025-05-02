-- Define function to generate the window with frame as one mesh based on user input
fn generateWindowWithFrame windowHeightInUnits frameThicknessInUnits frameDepthInUnits = (
    -- Define static parameters for the window
    glassThickness = 1     -- Thickness of the glass (window) in cm
    windowWidth = 100     -- Width of the window in cm

    -- Convert the dimensions to scene units (assuming 1 unit = 1 cm in this case)
    glassThicknessInUnits = glassThickness
    windowWidthInUnits = windowWidth

    -- Create the glass (window pane) with 1 cm thickness
    glass = box length:windowWidthInUnits width:glassThicknessInUnits height:windowHeightInUnits
    glass.position = [0, 0, frameThicknessInUnits]  -- Position the glass at the origin
	
	convertToMesh glass

    -- Set material ID 2 to glass
    for f = 1 to glass.numfaces do (
        setFaceMatID glass f 2
    )

    -- Create the frame
    -- The frame will surround the glass and have thickness and depth
    frameWidth = windowWidthInUnits + 2 * frameThicknessInUnits
    frameHeight = windowHeightInUnits + 2 * frameThicknessInUnits

    -- Outer frame box (the entire frame surrounding the glass)
    frameOuter = box length:frameWidth width:frameDepthInUnits height:frameHeight
    frameOuter.position = [0, 0, 0]

    -- Inner hollow part (to make space for the glass) - subtract the glass area from the frame
    frameInner = box length:windowWidthInUnits width:frameDepthInUnits height:windowHeightInUnits
    frameInner.position = [0, 0, frameThicknessInUnits]

    -- Create the frame by subtracting the inner hollow part from the outer frame
    frame = frameOuter - frameInner
	convertToMesh frame
	for f = 1 to frame.numfaces do (
        setFaceMatID frame f 1
    )

    -- Attach the frame and the glass to create a single mesh
    attach frame glass

    -- Output the final mesh (glass + frame)
    finalWindow = frame

    -- Delete the inner frame (we don't need it anymore after subtraction)
    delete frameInner

    -- Return the final window mesh
    finalWindow
)

-- Create the UI
rollout windowRollout "Window Generator" width:250 height:300
(
    -- Label for height input
    label lblHeight "Window Height (cm):" width:220 height:20 align:#left

    -- Spinner for user to input height (default is 150 cm)
    spinner spnHeight "Height:" range:[1, 500, 150] type:#float width:200 height:20 align:#center

    -- Label for frame thickness input
    label lblFrameThickness "Frame Thickness (cm):" width:220 height:20 align:#left

    -- Spinner for user to input frame thickness (default is 5 cm)
    spinner spnFrameThickness "Frame Thickness:" range:[1, 50, 5] type:#float width:200 height:20 align:#center

    -- Label for frame depth input
    label lblFrameDepth "Frame Depth (cm):" width:220 height:20 align:#left

    -- Spinner for user to input frame depth (default is 10 cm)
    spinner spnFrameDepth "Frame Depth:" range:[1, 50, 10] type:#float width:200 height:20 align:#center

    -- Button to generate window with frame
    button btnGenerate "Generate Window" width:180 height:40 align:#center

    -- Define button action
    on btnGenerate pressed do
    (
        -- Get the height value from the spinner
        windowHeightInUnits = spnHeight.value

        -- Get the frame thickness value from the spinner
        frameThicknessInUnits = spnFrameThickness.value

        -- Get the frame depth value from the spinner
        frameDepthInUnits = spnFrameDepth.value

        -- Call the function to generate the window with the input height, frame thickness, and frame depth
        generateWindowWithFrame windowHeightInUnits frameThicknessInUnits frameDepthInUnits
    )
)

-- Create the window (UI) and display it
createDialog windowRollout
