class IconGenerator

  def ico(png, options = {})
    options[:sizes].each do |name, size|
      ico = yield(name, options)
      convert_with_image_magick(png, ico, size)
    end
  end

  def png(svg, options = {})
    options[:sizes].each do |name, size|
      png = yield(name, options)
      convert_with_inkscape(svg, png, size)
    end
  end

  private

  def convert_with_image_magick(png, ico, size)
    options = ""
    if size.kind_of?(Array)
      options += size.reduce('') { |memo, size| "#{memo} \\( -clone 0 -resize #{size} \\)" }
      options += " -delete 0"
    else
      options += " -resize #{size}"
    end
    puts %x{convert #{png} #{options} #{ico}}
  end

  def convert_with_inkscape(svg, png, size)
    options = "--without-gui --export-width #{size} --export-height #{size}"
    puts %x{inkscape #{options} --export-png #{png} #{svg}}
  end

end
