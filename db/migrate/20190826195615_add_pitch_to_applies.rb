class AddPitchToApplies < ActiveRecord::Migration[5.0]
  def change
    add_column :applies, :pitch, :text
  end
end
