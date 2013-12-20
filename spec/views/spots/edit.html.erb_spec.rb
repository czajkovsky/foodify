require 'spec_helper'

describe "spots/edit" do
  before(:each) do
    @spot = assign(:spot, stub_model(Spot,
      :balance => 1,
      :client => 1,
      :state => "MyString",
      :waiter => 1
    ))
  end

  it "renders the edit spot form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", spot_path(@spot), "post" do
      assert_select "input#spot_balance[name=?]", "spot[balance]"
      assert_select "input#spot_client[name=?]", "spot[client]"
      assert_select "input#spot_status[name=?]", "spot[status]"
      assert_select "input#spot_waiter[name=?]", "spot[waiter]"
    end
  end
end
