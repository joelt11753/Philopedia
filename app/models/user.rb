class User < ActiveRecord::Base

	has_many :collaborators
	has_many :wikis, through: :collaborators

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable

	after_initialize { self.role ||= :standard }

	enum role: [:standard, :admin, :premium]

	def avatar_url(size)
		gravatar_id = Digest::MD5::hexdigest(self.email).downcase
		"http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
	end
end
