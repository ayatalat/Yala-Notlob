class Group < ApplicationRecord
  belongs_to :user
  acts_as_followable

end
