class GithubUsersController < ApplicationController
  @@current_page = 1
  @@user
  @@total_pages

  def index
    @@current_page = 1
  end

  def search
    @@current_page = 1
    @current_page = @@current_page
    @@user = params[:user]
    user_uri = "https://api.github.com/users/#{@@user}?client_id=#{id}&client_secret=#{secret}"
    @user = JSON.load open(user_uri)
    @user_repos = user_repos @@current_page
    @@total_pages = (@user["public_repos"].to_f/10).ceil
    @total_pages = @@total_pages

    respond_to do |format|
      format.html { redirect_to root_path}
      format.js
    end
  end

  def next
    @total_pages = @@total_pages
    if @@current_page == @@total_pages
    else
      page = @@current_page + 1
      paginate page
    end
  end

  def prev
    @total_pages = @@total_pages
    if @@current_page == 1
    else
      page = @@current_page - 1
      paginate page
    end
  end

  def page
    @total_pages = @@total_pages
    paginate params[:page].to_i
  end

private
  def user_repos current_page
    repo_uri = "https://api.github.com/users/#{@@user}/repos?page=#{current_page}&per_page=10&client_id=#{id}&client_secret=#{secret}"
    JSON.load open(repo_uri)
  end

  def id
    ENV["CLIENT_ID"]
  end

  def secret
    ENV["CLIENT_SECRET"]
  end

  def paginate page
    @@current_page = page
    @current_page = @@current_page
    @user_repos = user_repos @@current_page

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

end
