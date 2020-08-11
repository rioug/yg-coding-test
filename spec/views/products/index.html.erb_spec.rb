require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        name: "Name",
        description: "Description",
        price: "1.23",
        retailer: Retailer.create!(name: 'Shop 1')
      ),
      Product.create!(
        name: "Name",
        description: "Description",
        price: "1.23",
        retailer: Retailer.create!(name: 'Shop 2')
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "1.23".to_s, count: 2
  end
end
