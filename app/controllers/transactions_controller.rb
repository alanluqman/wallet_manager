class TransactionsController < ApplicationController
  def new
    @categories = current_user.categories
  end

  def create
    group = trx_data[:group_id].drop(1)
    group.each do |cat_id|
      new_trx = current_user.transactions.new(name: trx_data[:name], amount: trx_data[:amount],
                                              category_id: cat_id.to_i)
      flash.alert = 'Opps, Transaction does not created !' unless new_trx.save
    end
    redirect_to user_categories_path(user_id: current_user.id)
  end

  def destroy
    trxn = Transaction.find(params[:id])
    category_id = trxn.category_id
    if trxn.destroy
      redirect_to user_category_path(user_id: current_user.id, id: category_id)
    else
      flash.alert = 'Opps, Transaction does not Deleted !'
    end
  end

  private

  def trx_data
    params.permit(:name, :amount, group_id: [])
  end
end
