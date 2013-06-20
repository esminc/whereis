require 'spec_helper'

describe "watchers/new" do
  before(:each) do
    assign(:watcher, stub_model(Watcher,
      :name => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new watcher form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", watchers_path, "post" do
      assert_select "input#watcher_name[name=?]", "watcher[name]"
      assert_select "input#watcher_email[name=?]", "watcher[email]"
    end
  end
end
