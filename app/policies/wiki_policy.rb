class WikiPolicy < ApplicationPolicy
	class Scope < Scope
		attr_reader :user, :scope

		def initialize(user, scope)
			@user  = user
			@scope = scope
		end

		def resolve
			wikis = []
			if @user
				if @user.admin?
					wikis = scope.all
				elsif user.premium?
					all_wikis = scope.all
					all_wikis.each do |wiki|
						if !wiki.private? || wiki.user == user || wiki.users.include?(user)
							wikis << wiki
						end
					end
				else
					all_wikis = scope.all
					wikis     = []
					all_wikis.each do |wiki|
						if !wiki.private? || wiki.users.include?(user)
							wikis << wiki
						end

					end
				end
				wikis
			else
				all_wikis = scope.all
				wikis     = []
				all_wikis.each do |wiki|
					if !wiki.private? || wiki.users.include?(user)
						wikis << wiki
					end
				end
			end
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
		@user == @record.user
	end
end
