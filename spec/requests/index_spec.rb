require 'rails_helper'

RSpec.describe 'categories/index.html.erb', type: :feature do
  describe 'categories#index' do
    before(:example) do
      @user = User.create(name: 'Alan', email: 'test@gmail.com', password: 'password')
      @category = Category.create(name: 'Food', icon: 'food', author: @user)
      visit new_user_session_path
      fill_in 'Email', with: 'test@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
    end

    it 'should display user name' do
      expect(page).to have_content(@user.name)
    end

    it 'should display Categories' do
      expect(page).to have_content('Categories')
    end

    it 'should display Add Category' do
      expect(page).to have_content('Add Category')
    end

    it 'should display Category name' do
      expect(page).to have_content('Food')
    end
  end
end
