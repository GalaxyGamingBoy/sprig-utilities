local sprite = app.activeSprite
local img = Image(sprite)
local img_w = img.width
local img_h = img.height
local sprigStr = ""

-- The colors that the sprig supports.
-- To add a new color the template is: {"NAME", "SPRIG_ID", Color(r, g, b, a).rgbaPixel}
local sprigColors = {
    {"BLACK", "0", Color(0, 0, 0, 255).rgbaPixel},
    {"GRAY", "L", Color(73,80,87,255).rgbaPixel},
    {"LIGHT_GRAY", "1", Color(145,151,156,255).rgbaPixel},
    {"WHITE", "2", Color(248, 249, 250, 255).rgbaPixel},
    {"RED", "3", Color(235, 44, 71, 255).rgbaPixel},
    {"BROWN", "C", Color(139, 65, 46, 255).rgbaPixel},
    {"LIGHT_BLUE", "7", Color(25, 177, 248, 255).rgbaPixel},
    {"BLUE", "5", Color(19, 21, 224, 255).rgbaPixel},
    {"YELLOW", "6", Color(254, 230, 16, 255).rgbaPixel},
    {"YELLGRAY", "F", Color(149, 140, 50, 255).rgbaPixel},
    {"LIGHT_GREEN", "4", Color(45, 225, 62, 255).rgbaPixel},
    {"GREEN", "D", Color(29, 148, 16, 255).rgbaPixel},
    {"PINK", "8", Color(245, 109, 187, 255).rgbaPixel},
    {"PURPLE", "H", Color(170, 58, 197, 255).rgbaPixel},
    {"ORANGE", "9", Color(245, 113, 23, 255).rgbaPixel},
    {"NONE", ".", Color(0, 0, 0, 0).rgbaPixel},
}

-- Check if image is 16x16
if img_w == 16 and img_h == 16 then
    -- Loop all pixels
    for it in img:pixels() do
        local pixel = it()

        -- Loop through sprig colors
        for _,v in ipairs(sprigColors) do

            -- If pixelColor matches with a sprig one
            if pixel == v[3] then

                -- Add it to the string
                sprigStr = sprigStr .. v[2]

                -- Create a new line on the end of the canvas
                if it.x == img_w - 1 then
                    sprigStr = sprigStr .. "\n"
                end
            end
        end
    end

    -- Print the converted bitmap
    print(sprigStr)
else
    print("Image MUST be 16x16")
end