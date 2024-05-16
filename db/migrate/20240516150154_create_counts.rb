class CreateCounts < ActiveRecord::Migration[7.1]
  def change
    create_table :counts do |t|
      t.integer :count

      t.timestamps
    end
  end
end
