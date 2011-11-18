# encoding: utf-8
class UsersController < ApplicationController
  before_filter :authenticate, :only => [:show]
 
  def new
      @user = User.new
      @title = "Sign up"
  end
  
  def show
     @user = User.find(params[:id])
  end
  
  def create
      @user = User.new(params[:user])
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to Coders Cloud!"
        redirect_to @user
      else
        @title = "Sign up"
        render 'new'
      end
   end
   def setread
     Notification.update_all(:is_read => true)
     respond_to do |format|
           format.js 
     end

   end
    private

   def authenticate
        deny_access unless signed_in?
   end

   def correct_user
        @user = User.find(params[:id])
        redirect_to(root_path) unless current_user?(@user)
    end
end
