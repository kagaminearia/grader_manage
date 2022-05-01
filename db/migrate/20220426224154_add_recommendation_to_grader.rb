class AddRecommendationToGrader < ActiveRecord::Migration[7.0]
  def change
    add_reference :graders, :recommendation, null: false, foreign_key: true
  end
end
