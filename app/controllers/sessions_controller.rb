class SessionsController < ApplicationController
  def index
    # @user_type = params[:user_type]

  end

  def new
    # puts '*'*20
    # puts params[:user_type]
    session[:user_type] = params[:user_type]
    puts session[:user_type]
  end

  def create

    # login user
    if session[:user_type] == "lender"
      @lender = Lender.find_by(email: params[:email])
      # if authenticate is true
      if @lender and @lender.authenticate(params[:password])
        # save uid to session
        session[:user_id] = @lender.id
        session[:user_type] = "lender"
        # redirect to user's profile page
        redirect_to "/lenders/#{@lender.id}"
      # if auth is false
      else
        # add error message
        flash[:notice] = ["Invalid email or password"]
        # redirect to login page
        redirect_to :back
      end
    else
      @borrower = Borrower.find_by(email: params[:email])
      # if authenticate is true
      if @borrower and @borrower.authenticate(params[:password])
        # save uid to session
        session[:user_id] = @borrower.id
        session[:user_type] = "borrower"
        # redirect to user's profile page
        redirect_to "/borrowers/#{@borrower.id}"
      # if auth is false
      else
        # add error message
        flash[:notice] = ["Invalid email or password"]
        # redirect to login page
        redirect_to :back
      end
    end
  end

  def destroy
    reset_session
    redirect_to '/register'
  end
end
