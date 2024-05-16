

class PagesController < ApplicationController
  def index
    require "rqrcode"

    @count = Count.first&.count || 0
    @qrcode = RQRCode::QRCode.new("http://youtube.com/")

    @png = @qrcode.as_png(
      bit_depth: 1,
      border_modules: 4,
      color_mode: ChunkyPNG::COLOR_GRAYSCALE,
      color: "black",
      file: nil,
      fill: "white",
      module_px_size: 6,
      resize_exactly_to: false,
      resize_gte_to: false,
      size: 120
    )

    IO.binwrite("./app/assets/images/youtube#{@count}-qrcode.png", @png.to_s)

    count_record = Count.first_or_create
    count_record.update(count: @count + 1)
  end
end
