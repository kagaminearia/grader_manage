json.extract! recommendation, :id, :student_firstname, :student_lastname, :student_email, :course_index, :course_section, :reasons, :created_at, :updated_at
json.url recommendation_url(recommendation, format: :json)
