class UsersController < ApplicationController
  def new
  end

  def create
  end

  def login_form
  end

  def log_out
    user = current_user

    cookies.encrypted[:uid]
    cookies.encrypted[:name]
    cookies.encrypted[:email]
    cookies.encrypted[:avatar_url]
    cookies.encrypted[:access_token]
  end

 
end
