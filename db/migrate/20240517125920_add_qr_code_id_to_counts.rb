class AddQrCodeIdToCounts < ActiveRecord::Migration[7.1]
  def change
    add_reference :counts, :qr_code, null: false, foreign_key: true
  end
end
