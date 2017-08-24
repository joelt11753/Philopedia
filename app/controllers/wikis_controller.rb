class WikisController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@wikis = Wiki.all
		@wikis = @wikis.public_wikis(@wikis)
	end

	def show
		@wiki = Wiki.find(params[:id])
	end

	def new
		@wiki = Wiki.new
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
		@wiki = Wiki.find(params[:id])
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
