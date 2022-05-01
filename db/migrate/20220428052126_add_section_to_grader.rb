class AddSectionToGrader < ActiveRecord::Migration[7.0]
  def change
    add_reference :graders, :section, null: true, foreign_key: true, default: nil
  end
end
