class Grader < ApplicationRecord
  belongs_to :recommendation, optional: true
  belongs_to :user

  serialize :classes, Array
  
  CLASSES = @courses

  serialize :available_times, Array

  AVAILABLE_TIMES = %w[8:00AM_-_9:00AM 9:00AM_-_10:00AM 10:00AM_-_11:00AM 11:00AM_-_12:00PM 12:00PM_-_1:00PM 1:00PM_-_2:00PM 2:00PM_-_3:00PM 3:00PM_-_4:00PM 4:00PM_-_5:00PM 5:00PM_-_6:00PM 6:00PM_-_7:00PM 7:00PM_-_8:00PM]

  VALID_EMAIL_REGEX = /\w+\.\d+@osu\.edu/

  validates_presence_of :first_name, :last_name

  # Custom email validation
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  # Courses must be selected
  validates_presence_of :classes
  
  # Times must be selected
  validates_presence_of :available_times
end
