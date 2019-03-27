class UsersController < ApplicationController
  
  before_action :authenticate_user!, :only => [:show, :index, :edit, :update]
  # before_action :friend_status
  
  def show
   #current_userから見たfriend status表示
    @user = User.find(params[:id])
      @friend_status = ""
      @mes_status = ""
        # Friend.where(follower: current_user.id).each do |f|
          if Friend.find_by('follower = ? and followed = ?', current_user.id, params[:id]) 
            if Friend.find_by('follower = ? and followed = ?', params[:id], current_user.id) 
              @friend_status = "f"
              # 以下DM(Apply)用
              if @user.id != current_user.id
                if Entry.find_by(user_id: current_user.id)
                    Entry.where(user_id: current_user.id).each do |f|
                      if Entry.find_by('user_id = ? and room_id = ?', params[:id], f.room_id)
                        @mes_status = "opened"
                          logger.debug("---------------------***** @mes_status = #{params[:id]}")
                        @mes_room = f.room_id
                      else
                        # Entryテーブル内に自分と相手のが無い場合
                        # @mes_status = "unopened"
                        @room = Room.new
                        @entry = Entry.new
                      end
                end
              else
                  logger.debug("---------------------¥¥¥¥¥¥¥¥¥¥¥ = #{params[:id]}")
                  # Entryに自分のレコードが１件もない場合
                  @room = Room.new
                  @entry = Entry.new
                end
              end
            else
              @friend_status = "r"
            end    
          else
            if Friend.find_by('follower = ? and followed = ?', params[:id], current_user.id) 
              @friend_status = "w"
            else
              @friend_status = ""
            end
          end
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:first_name, :last_name, :age, :salon_name, :salon_url, :profile, :image, :icon_name, :photo))
  end
  
  def following
    @user = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end
  
  def followers
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
end
