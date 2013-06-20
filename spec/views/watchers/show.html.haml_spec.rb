require 'spec_helper'

describe "watchers/show" do
  before(:each) do
    @watcher = assign(:watcher, stub_model(Watcher,
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
  end
end
