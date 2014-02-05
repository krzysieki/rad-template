class UsersController < ApplicationController
  respond_to :json

  def index

    # Gather all post data
    user = User.find(current_user)

    # Respond to request with post data in json format
    respond_with(user) do |format|
      format.json { render :json => user.as_json }
    end

  end
end
