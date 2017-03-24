class LendersController < ApplicationController
  def create
    @lender = Lender.new(lender_params)
    if @lender.save
      session[:user_id] = @lender.id
      session[:user_type] = "lender"
      flash[:notice] = ["Lender successfully created!"]
      redirect_to "/lenders/#{@lender.id}"
    else
      flash[:notice] = @lender.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @lender = current_user
    @borrowers = Borrower.all
    @loans = Loan.where(lender: @lender)
  end

  def lend
  end

  private
  def lender_params
    params.require(:lender).permit(:first_name, :last_name, :email, :password, :money)
  end
end
