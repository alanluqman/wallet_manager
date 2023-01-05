class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories
  end

  def show
    @category = Category.find(params[:id])
    @tracsactions = Transaction.where(category_id: params[:id]).order(created_at: :desc)
  end

  def new; end

  def create
    new_category = current_user.categories.new(category_params)
    if new_category.save
      redirect_to user_categories_path(user_id: current_user.id)
    else
      flash.alert = 'Opps, Category does not created !'
    end
  end

  def update; end

  def destroy; end

  private

  def category_params
    params.permit(:name, :icon)
  end
end
