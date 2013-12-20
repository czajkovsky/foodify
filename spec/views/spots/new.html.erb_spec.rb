require 'spec_helper'

describe "spots/new" do
  before(:each) do
    assign(:spot, stub_model(Spot,
      :balance => 1,
      :client => 1,
      :status => "MyString",
      :waiter => 1
    ).as_new_record)
  end

  it "renders new spot form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", spots_path, "post" do
      assert_select "input#spot_balance[name=?]", "spot[balance]"
      assert_select "input#spot_client[name=?]", "spot[client]"
      assert_select "input#spot_status[name=?]", "spot[status]"
      assert_select "input#spot_waiter[name=?]", "spot[waiter]"
    end
  end
end
