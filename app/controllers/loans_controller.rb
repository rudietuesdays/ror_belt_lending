class LoansController < ApplicationController
  def create
    @amount = params[:amount].to_i
    @lender = current_user
    @borrower = Borrower.find(params[:id])
    # @lender.skip_password
    # @borrower.skip_password
    puts @borrower.first_name
    @loan = Loan.new(amount: @amount, lender: @lender, borrower: @borrower)
    @loan.save
    @money = @lender.money - @amount
    puts @money
    puts "borrower:"
    puts @borrower.first_name
    @raised = @borrower.amt_raised + @amount
    @borrower.update(amt_raised: @raised)
    @lender.update(money: @money)
    flash[:notice] = ["You've created a new loan"]
    redirect_to :back

  end
end
