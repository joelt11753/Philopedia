class Wiki < ActiveRecord::Base
	belongs_to :user

	has_many :collaborators
	has_many :users, through: :collaborators

	after_initialize { self.private ||= false }
end
