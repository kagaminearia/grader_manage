class Section < ApplicationRecord
  belongs_to :course

  # Each section needs 1 grader by default
  def default_graders_needed
    self.graders_needed = 1
  end
  
  # Each section starts with 0 graders
  def default_num_graders
    self.num_graders = 0
  end

  after_initialize :default_graders_needed, if: :new_record?
  after_initialize :default_num_graders, if: :new_record?
end
