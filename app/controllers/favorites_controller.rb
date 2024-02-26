class FavoritesController < ApplicationController
  # before_action :authenticate_user!

  def create
    @blog = Blog.find(params[:blog_id])
    @favorite = current_user.favorites.create(blog_id: params[:blog_id])
    respond_to do |format|
      format.js { render 'blogs/index' }
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.js { render 'blogs/index' }  
    end
  end
end
