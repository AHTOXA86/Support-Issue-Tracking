class UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @data = Ticket.all
  end
end
