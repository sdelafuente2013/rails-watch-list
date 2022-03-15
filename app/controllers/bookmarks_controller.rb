# frozen_string_literal: true

class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(list_params)
    @bookmark.list = List.find(params[:id])

    if @bookmark.save
      redirect_to list_path
    else
      redirect_back_or_to lists_path, notice: "#{@bookmark.errors.full_messages.to_sentence}"
    end
  end

  private

  def list_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
