class Wiki < ActiveRecord::Base
	belongs_to :user

	has_many :collaborators
	has_many :users, through: :collaborators

	scope :public_wikis, -> (wikis) { where private: false }

	after_initialize { self.private ||= false }
end
