require 'rails_helper'

RSpec.describe "retailers/show", type: :view do
  before(:each) do
    @retailer = assign(:retailer, Retailer.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
