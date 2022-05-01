class AddReviewedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :reviewed, :boolean
  end
end
