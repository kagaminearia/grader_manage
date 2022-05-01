require 'httparty'

class Course < ApplicationRecord
    has_many :sections, :dependent => :delete_all 
    accepts_nested_attributes_for :sections
end