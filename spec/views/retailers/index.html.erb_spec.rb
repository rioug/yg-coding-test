require 'rails_helper'

RSpec.describe "retailers/index", type: :view do
  before(:each) do
    assign(:retailers, [
      Retailer.create!(
        name: "Name"
      ),
      Retailer.create!(
        name: "Name"
      )
    ])
  end

  it "renders a list of retailers" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
