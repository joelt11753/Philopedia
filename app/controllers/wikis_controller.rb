class WikisController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@policy_wikis = policy_scope(Wiki)
	end

	def show
		@wiki = Wiki.find(params[:id])
		authorize @wiki
	end

	def new
		@wiki = Wiki.new
		authorize @wiki
	end

	def create
		@wiki = Wiki.new(wiki_params)

		@wiki.user = current_user

		if @wiki.save
			redirect_to @wiki, notice: "Your new article was created"
		else
			flash.now[:alert] = "Error creating article. Please try again."
			render :new
		end
	end

	def edit
		@wiki          = Wiki.find(params[:id])
		@users         = User.all
		@get_wikis     = Collaborator.where(wiki_id: @wiki.id)
		@collaborators = User.where(id: @get_wikis.pluck(:user_id))
	end

	def update
		@wiki = Wiki.find(params[:id])
		@wiki.assign_attributes(wiki_params)

		if @wiki.save
			flash[:notice] = "Article updated successful."
			redirect_to @wiki
		else
			flash.now[:alert] = "Update failed, please try again"
			render :edit
		end
	end

	def destroy
		@wiki = Wiki.find(params[:id])

		if @wiki.destroy
			flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
			redirect_to action: :index
		else
			flash.now[:alert] = "There was an error deleting the article."
			render :show
		end
	end

	private

	def wiki_params
		params.require(:wiki).permit(:title, :body, :private)
	end
end
