class AddAvailableTimesToGraders < ActiveRecord::Migration[7.0]
  def change
    add_column :graders, :available_times, :text, default: [].to_yaml
  end
end
