class HomeController < ApplicationController
  def index
  	if !current_user.nil?
  		@user = User.find_by(params[:id])
  	end
  end
end
