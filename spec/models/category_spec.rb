require 'rails_helper'

RSpec.describe Category, type: :model do
  subject do
    user = User.new(name: 'alan', email: 'alan@gmail.com', password: 'pass123')
    Category.new(name: 'Food', icon: 'icon', author: user)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'check recipe name' do
    expect(subject.name).to eq('Food')
  end

  it 'blank title raises error' do
    subject.name = ''
    expect { subject.save! }.to raise_error(ActiveModel::StrictValidationFailed)
  end
end
