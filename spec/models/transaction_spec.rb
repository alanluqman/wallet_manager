require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject do
    user = User.create(name: 'alan', email: 'alan@gmail.com', password: 'password123')
    category = Category.create(name: 'Food', icon: 'icon', author: user)
    Transaction.create(name: 'burger', amount: 8, author: user, category:)
  end

  it '# is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it '# transaction name should be burger' do
    expect(subject.name).to eq('burger')
  end
end
