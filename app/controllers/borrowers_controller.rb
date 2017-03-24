class BorrowersController < ApplicationController
  def create
    @borrower = Borrower.new(borrower_params)
    if @borrower.save
      session[:user_id] = @borrower.id
      session[:user_type] = "borrower"
      flash[:notice] = ["Borrower successfully created!"]
      redirect_to "/borrowers/#{@borrower.id}"
    else
      flash[:notice] = @borrower.errors.full_messages
      redirect_to :back
    end
  end

  def show
    @borrower = current_user
    @lenders = Lender.all
  end

  private
  def borrower_params
    params.require(:borrower).permit(:first_name, :last_name, :email, :password, :need_title, :need_descrip, :need_amt, :amt_raised)
  end
end
