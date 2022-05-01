class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.string :student_firstname
      t.string :student_lastname
      t.string :student_email
      t.string :course_index
      t.string :course_section
      t.text :reasons

      t.timestamps
    end
  end
end
