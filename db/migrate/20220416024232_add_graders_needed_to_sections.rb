class AddGradersNeededToSections < ActiveRecord::Migration[7.0]
  def change
    add_column :sections, :graders_needed, :integer
  end
end
