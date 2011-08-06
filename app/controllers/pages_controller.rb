class PagesController < ApplicationController
  def home
    @title = "CodersCloud"
  end

  def help
    @title = "Aide"
  end
end
