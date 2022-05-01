class User < ApplicationRecord
  has_one :grader
  accepts_nested_attributes_for :grader, :allow_destroy => true

  VALID_EMAIL_REGEX = /\w+\.\d+@osu\.edu/
  @@admin_created = false
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :first_name, :last_name
  # Create the three user roles for the OSU course catalog
  # 0 = Student, 1 = Instructor, 2 = Admin
  enum role: %i[student instructor admin]

  # Custom email validation
  validates :email, format: { with: VALID_EMAIL_REGEX }

  # Set the default role when a new user is created
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :student
  end

  # Set review setting for admins to approve or deny new admins/instructors
  after_initialize :set_default_reviewed, if: :new_record?

  def set_default_reviewed
   if "student" === self.role # students don't need to be approved
     self.reviewed ||= true
   elsif "admin" === self.role && @@admin_created == false # first admin doesn't need to be reviewed
     self.reviewed ||= true
     @@admin_created = true
   else # instructors and admins other than original need approval
     self.reviewed ||= false
   end
  end
end
