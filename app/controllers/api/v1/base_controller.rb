class Api::V1::BaseController < ApplicationController
# base controller can do some authority check for all Api::V1 controllers
#   helper_method :current_user
# private
# 	def current_user
# 		@current_user ||= ::User.active.find(session[:user_id]) if session[:user_id]
# 	end
end
