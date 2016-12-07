class GithubUsersController < ApplicationController
  def index
  end

  def search
    client_id = ENV["CLIENT_ID"]
    client_secret = ENV["CLIENT_SECRET"]
    github = Github.new client_id: client_id, client_secret: client_secret
    @user = github.users.get user: params[:user]
    @user_repos = github.repos.list user: params[:user]

    respond_to do |format|
      format.html { redirect_to root_path}
      format.js
    end
  end
end
