class YogaClass < ActiveRecord::Base
  belongs_to :user
  has_many :yoga_sessions
end
