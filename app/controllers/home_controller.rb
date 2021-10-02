class HomeController < ApplicationController
  before_action :authenticate_user!
  layout 'login'

  def index
  end
end
