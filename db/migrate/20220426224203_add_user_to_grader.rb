class AddUserToGrader < ActiveRecord::Migration[7.0]
  def change
    add_reference :graders, :user, null: false, foreign_key: true
  end
end
