class QrCode < ApplicationRecord
  require 'rqrcode'

  def generate_qr_code(link)
    # Controleer of de link niet leeg is
    if link.present?
      @qrcode = RQRCode::QRCode.new(link)

      @png = @qrcode.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: 'black',
        file: nil,
        fill: 'white',
        module_px_size: 6,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 120
      )

      # Sla de QR-code op in de database
      qr_code = self

      # Gebruik de ID van de opgeslagen QR-code in de filenaam
      filename = "qrcode-#{qr_code.id}.png"
      IO.binwrite("./app/assets/images/#{filename}", @png.to_s)
    else
      Rails.logger.warn "Geen geldige link opgegeven voor QR-code generatie."
    end
  end
end
