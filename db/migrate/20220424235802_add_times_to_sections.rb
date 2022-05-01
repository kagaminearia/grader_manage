class AddTimesToSections < ActiveRecord::Migration[7.0]
  def change
    add_column :sections, :start_time, :string
    add_column :sections, :end_time, :string
  end
end
