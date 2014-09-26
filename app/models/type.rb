class Type < ActiveRecord::Base

  validates :name, presence: true
end
