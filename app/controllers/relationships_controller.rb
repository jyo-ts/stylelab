class RelationshipsController < ApplicationController
  
   before_action :authenticate_user!

  def index
    
    @relationships = []
    @request_relationships = []
    @receive_relationships = []
    @relationship_status = ""
    
    Relationship.where(follower_id: current_user.id).each do |r|
      if Relationship.find_by('follower_id = ? and following_id = ?', r.following_id, current_user.id) 
      # logger.debug("--------------------- 友達　r.following_id = #{r.following_id}")
        @relationships.push(r.following_id)
        @relationship_status = "f"
        
      else
      logger.debug("--------------------- 申請中r.following_id = #{r.following_id}")
       
        @request_relationships.push(r.following_id)
        @relationship_status = "r"

      end
    end
    
    Relationship.where(following_id: current_user.id).each do |r|
      if !Relationship.find_by('follower_id = ? and following_id = ?', current_user.id, r.follower_id) 
      # logger.debug("--------------------- 承認待ち　r.following_id = #{r.follower_id}")
        	@receive_relationships.push(r.following_id)
    	    @relationship_status = "w"

      end
    end
         
  end
  
  
  def create
      # if !Friend.find_by(follower: @current_user.id, followed: params[@user.id])
        @relationship = Relationship.new(
            follower_id: current_user.id,
            following_id: params[:id])
        @relationship.save
        logger.debug("--------------------- 承認　r.follower_id = #{@relationship.follower_id}")
        logger.debug("--------------------- 承認　r.following_id = #{@relationship.following_id}")
        redirect_to "/relationship"
      # end    
  end
  
  
  # def create
  #   @user = User.find(params[:relationship][:following_id])
  #   current_user.follow!(@user)
  #   redirect_to @user
  # end
  
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