class AddCollaborationToApplies < ActiveRecord::Migration[5.0]
  def change
    add_column :applies, :collaboration, :text
  end
end
