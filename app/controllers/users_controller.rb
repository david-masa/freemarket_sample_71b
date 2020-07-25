class UsersController < ApplicationController
  def index
    @card = Card.where(user_id: current_user.id).first
  end
end
