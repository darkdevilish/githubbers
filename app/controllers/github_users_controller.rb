class GithubUsersController < ApplicationController
  def index
  end

  def search
    client_id = "485994f65f0cca2d779a"
    client_secret = "8f7cd14c67e2d5f8e75a35fe165802c22945ea3b"
    github = Github.new client_id: client_id, client_secret: client_secret
    @user = github.users.get user: params[:user]

    respond_to do |format|
      format.html { redirect_to root_path}
      format.js
    end
  end
end
