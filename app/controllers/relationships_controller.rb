class RelationshipsController < ApplicationController
  
  def create
    @user = User.find(params[:relationship][:following_id])
    current_user.follow!(@user)
    redirect_to @user
  end
  
  def destroy
    logger.debug("=================== current_user.id = #{current_user.id}")
    @user = Relationship.find_by(follower_id: current_user.id, following_id: params[:id])
    @user.destroy
    redirect_to "/users/#{current_user.id}"
    
    # @user = Relationship.find(params[:id]).following
    # current_user.unfollow!(@user)
    # redirect_to @user
  end
end