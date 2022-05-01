json.extract! course, :id, :subject, :catalognumber, :sections, :coursetitle, :coursedescription, :campus, :day, :time, :instructors, :created_at, :updated_at
json.url course_url(course, format: :json)
