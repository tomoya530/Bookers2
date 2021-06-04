class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.unfollow(params[:id])
    redirect_back(fallback_location: root_path)
  end

  def following_user
    @user = User.find(params[:user_id])
    @users = @user.following_user.all
  end

  def follower_user
    @user = User.find(params[:user_id])
    @users = @user.follower_user.all
  end

end
