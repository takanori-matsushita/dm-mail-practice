class ManagementsController < ApplicationController
  layout 'admin_common'
  before_action :authenticate_admin!

  def index
    @users = User.select("id, name, email")
  end
end
