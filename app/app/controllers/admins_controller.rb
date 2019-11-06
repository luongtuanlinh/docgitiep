class AdminsController < ApplicationController
  layout 'admin'
  def index
    render 'admins/starter'
  end
end
