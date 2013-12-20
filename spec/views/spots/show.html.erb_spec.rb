require 'spec_helper'

describe "spots/show" do
  before(:each) do
    @spot = assign(:spot, stub_model(Spot,
      :balance => 1,
      :client => 2,
      :status => "Status",
      :waiter => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Status/)
    rendered.should match(/3/)
  end
end
