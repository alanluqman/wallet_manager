require 'rails_helper'

RSpec.describe 'categories/new.html.erb', type: :feature do
  describe 'categories#new' do
    before(:example) do
      @user = User.create(name: 'Alan', email: 'test@gmail.com', password: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'should display Create New Category' do
      visit new_user_category_path(user_id: @user.id)
      expect(page).to have_content('Create New Category')
    end

    it 'should display Create Category button' do
      visit new_user_category_path(user_id: @user.id)
      expect(page).to have_button('Create Category')
    end
  end
end
