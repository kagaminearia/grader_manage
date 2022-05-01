class AddClassesToGraders < ActiveRecord::Migration[7.0]
  def change
    add_column :graders, :classes, :text, default: [].to_yaml
  end
end
