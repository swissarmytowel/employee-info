class StaticPagesController < ApplicationController
  def home
  end

  def login
    if is_logged_in?
      flash.now[:danger] = "Already logged in!"
    end
  end

  def signup
  end
end
