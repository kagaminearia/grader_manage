class Recommendation < ApplicationRecord

    has_one :grader

    VALID_EMAIL_REGEX = /\w+\.\d+@osu\.edu/
    validates_presence_of :student_firstname, :student_lastname

    validates :student_email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

    
end
