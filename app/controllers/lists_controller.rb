class ListsController < ApplicationController
	def index
		@lists = List.all
	end 

	def new
		@list_new = List.new
	end

	def create
		@list_new = List.new(list_params)

		if @list_new.save
	  	redirect_to lists_path
	  else
	    render :new, status: :unprocessable_entity
	  end
	end 

	def show
		@list_find = List.find(params[:id])
		# @movies = Movie.all()
		@bookmarks = Bookmark.all
		@bookmark = Bookmark.new
	end 

	private
    def list_params
      params.require(:list).permit(:name)
    end
end
