class DropCounts < ActiveRecord::Migration[7.1]
  def change
    drop_table :counts
  end
end
