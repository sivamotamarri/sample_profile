require 'RMagick'

#~ if !ARGV[0]
    #~ puts "Usage: watermark <path-to-image>"
    #~ exit
#~ end

image = Magick::Image.read("animal_13.jpg").first

mark = Magick::Image.new(image.columns, image.rows)

gc = Magick::Draw.new
gc.gravity = Magick::NorthWestGravity
gc.pointsize = 24
gc.font_family = "White"
gc.font_weight = Magick::BoldWeight
gc.stroke = 'none'
gc.annotate(mark, 0, 0, 0, 0, "Watermark by Siva")

mark = mark.shade(true, 310, 30)

image.composite!(mark, Magick::NorthGravity, Magick::HardLightCompositeOp)

out = "animal_13.jpg".sub(/\./, "-wm.")
puts "Writing #{out}"
image.write(out)