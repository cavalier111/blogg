class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

 	 helper_method :current_user

	before_action :require_user, :only => :current_user
def current_user 

  	@current_user ||= User.find(session[:user_id]) if session[:user_id] 

	rescue ActiveRecord::RecordNotFound
end


def require_user 
  redirect_to '/login' unless current_user 
end



end
