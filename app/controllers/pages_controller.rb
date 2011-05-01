class PagesController < ApplicationController
  def home
    @title = "CodersCloud Home page"
  end

  def help
    @title = "Help"
  end
end
