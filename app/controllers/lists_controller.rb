# frozen_string_literal: true

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
      # render :new, status: :unprocessable_entity
      redirect_back_or_to lists_path, notice: "#{@list_new.errors.full_messages.to_sentence}"
    end
  end

  def show
    @list_find = List.find(params[:id])

    @bookmarks = Bookmark.all
    @reviews = Review.all

    @bookmark = Bookmark.new
    @review = Review.new
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
