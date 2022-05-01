class AddNumGradersToSections < ActiveRecord::Migration[7.0]
  def change
    add_column :sections, :num_graders, :integer
  end
end
