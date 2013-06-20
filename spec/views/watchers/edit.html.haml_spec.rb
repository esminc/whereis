require 'spec_helper'

describe "watchers/edit" do
  before(:each) do
    @watcher = assign(:watcher, stub_model(Watcher,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit watcher form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", watcher_path(@watcher), "post" do
      assert_select "input#watcher_name[name=?]", "watcher[name]"
      assert_select "input#watcher_email[name=?]", "watcher[email]"
    end
  end
end
