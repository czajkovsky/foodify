require 'spec_helper'

describe "spots/index" do
  before(:each) do
    assign(:spots, [
      stub_model(Spot,
        :balance => 1,
        :client => 2,
        :status => "Status",
        :waiter => 3
      ),
      stub_model(Spot,
        :balance => 1,
        :client => 2,
        :status => "Status",
        :waiter => 3
      )
    ])
  end

  it "renders a list of spots" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
