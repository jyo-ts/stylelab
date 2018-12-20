class RoomsController < ApplicationController

  before_action :authenticate_user!, :only => [:create, :show, :index, :edit, :update]
  
  def create
  end
  
  def show
  end
  
  def index
  end
  
  def edit
  end
  
  def update
  end
end
