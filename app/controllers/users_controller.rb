class UsersController < ApplicationController
  respond_to :json

  def currentuser
    user = current_user

    # Respond to request with post data in json format
    # respond_with(user) do |format|
    #   format.json {  }
    # end

    render :json => user.as_json
  end

  def show
    if current_user.admin
      # Gather all post data
      user = User.find()
    else
      user = User.find(current_user)
    end


    # Respond to request with post data in json format
    respond_with(user) do |format|
      format.json { render :json => user.as_json }
    end
  end

  def index
    # Gather all post data
    @users = User.all

    # Respond to request with post data in json format
    respond_with(@users) do |format|
      format.json { render :json => @users.as_json(:include => :customers) }
    end
  end
end
