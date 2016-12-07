class GithubUsersController < ApplicationController
  def index
  end

  def search
    id = ENV["CLIENT_ID"]
    secret = ENV["CLIENT_SECRET"]
    u = params[:user]
    user_uri = "https://api.github.com/users/#{u}?client_id=#{id}&client_secret=#{secret}"
    repo_uri = "https://api.github.com/users/#{u}/repos?client_id=#{id}&client_secret=#{secret}"
    @user = JSON.load open(user_uri)
    @user_repos = JSON.load open(repo_uri)

    respond_to do |format|
      format.html { redirect_to root_path}
      format.js
    end
  end
end
