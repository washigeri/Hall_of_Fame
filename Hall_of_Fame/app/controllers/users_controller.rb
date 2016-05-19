class UsersController < ApplicationController
  require 'will_paginate/array'
  before_filter :authenticate_user!, :only => :show_user_details
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(:page => params[:page])
  end

  def show_user_details
    @user = User.find(params[:id])
  end


end
