require 'rails_helper'

RSpec.describe Retailer, type: :model do
  let(:valid_attributes) {
    {
      name: 'Shop',
    }
  }

  subject { Retailer.create(valid_attributes) }

  describe '#name' do
    it 'is required' do
      subject.name = ''
      expect(subject).not_to be_valid
    end
  end
end
