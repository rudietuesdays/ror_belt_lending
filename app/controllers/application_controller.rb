class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    if session[:user_type] == "lender"
      Lender.find(session[:user_id]) if session[:user_id]
      # puts '*'*20
      # puts session[:user_type]
      # puts session[:user_id]
    else
      Borrower.find(session[:user_id]) if session[:user_id]
    end
  end

  helper_method :current_user

end
