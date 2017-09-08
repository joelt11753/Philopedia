class WikiPolicy < ApplicationPolicy
	class Scope < Scope
		def resolve
			scope
		end
	end

	def new?
		@user
	end

	def edit?
		user_is_owner_of_record?
	end

	def show?
		if @record.private?
			user_is_owner_of_record?
		else
			true
		end
	end

	def destroy?
		user_is_owner_of_record?
	end

	private

	def user_is_owner_of_record?
		@user == @record || @user.role == 'admin'
	end
end
