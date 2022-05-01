class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :subject
      t.string :catalognumber
      t.string :coursetitle
      t.text :coursedescription
      t.string :campus
      t.string :day
      t.string :time
      t.string :instructors

      t.timestamps
    end
  end
end
