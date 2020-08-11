require 'rails_helper'

RSpec.describe "retailers/edit", type: :view do
  before(:each) do
    @retailer = assign(:retailer, Retailer.create!(
      name: "MyString"
    ))
  end

  it "renders the edit retailer form" do
    render

    assert_select "form[action=?][method=?]", retailer_path(@retailer), "post" do

      assert_select "input[name=?]", "retailer[name]"
    end
  end
end
