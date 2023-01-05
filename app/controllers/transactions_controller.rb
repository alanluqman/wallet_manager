class TransactionsController < ApplicationController
  def index; end

  def show; end

  def new
    @categories = current_user.categories
  end

  def create
    group = trx_data[:group_id].drop(1)
    group.each do |cat_id|
      new_trx = current_user.transactions.new(name: trx_data[:name], amount: trx_data[:amount], category_id: cat_id.to_i)
      if !new_trx.save
        flash.alert = "Opps, Transaction does not created !"
      end
    end
    redirect_to user_categories_path(user_id: current_user.id)
  end

  def update; end

  def destroy; end

  private

  def trx_data
    params.permit(:name, :amount, group_id: [])
  end
end
