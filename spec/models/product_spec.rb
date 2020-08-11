require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:retailer) { Retailer.create!(name: 'Shop') }

  let(:valid_attributes) {
    {
      name: 'Milk',
      description: 'Optional',
      price: '1.23',
      retailer_id: retailer.id,
    }
  }

  subject { Product.create(valid_attributes) }

  describe '#name' do
    it 'is required' do
      subject.name = ''
      expect(subject).not_to be_valid
    end
  end

  describe '#description' do
    it 'is optional' do
      subject.description = ''
      expect(subject).to be_valid
    end
  end

  describe '#price' do
    it 'is required' do
      subject.price = ''
      expect(subject).not_to be_valid
    end

    it 'must be greater than zero' do
      subject.price = '0.00'
      expect(subject).not_to be_valid
    end
  end

  describe '#display_price' do
    it 'formats the price for display in dollars' do
      expect(subject.display_price).to eq('$1.23')
    end
  end
end
