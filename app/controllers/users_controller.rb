class UsersController < ApplicationController
  def login
    if current_user
      redirect_to suggestions_path
    end
  end
end
