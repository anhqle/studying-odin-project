class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end
  
  before_filter :require_login, only: [:destroy]
end
