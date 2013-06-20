require 'spec_helper'

describe WatchersController do
  def valid_attributes
    { "name" => "MyString" }
  end

  describe 'GET new' do
    before do
      controller.new
    end
    describe 'assigns a new watcher as @watcher' do
      subject { controller.instance_variable_get('@watcher') }
      it { should be_a_new(Watcher) }
    end
  end

  describe 'POST create' do
    context 'with valid params' do
      before do
        controller.should_receive(:redirect_to) {|u| u.should eq(Watcher.last) }
      end
      describe 'creates a new Watcher' do
        it { expect {
          controller.create(valid_attributes)
        }.to change(Watcher, :count).by(1) }
      end

      describe 'assigns a newly created watcher as @watcher and redirects to the created watcher' do
        before do
          controller.create(valid_attributes)
        end
        subject { controller.instance_variable_get('@watcher') }
        it { should be_a(Watcher) }
        it { should be_persisted }
      end
    end

    context 'with invalid params' do
      describe "assigns a newly created but unsaved watcher as @watcher, and re-renders the 'new' template" do
        before do
          Watcher.any_instance.stub(:save) { false }
          controller.should_receive(:render).with(:action => 'new')
          controller.create({ "name" => "invalid value" })
        end
        subject { controller.instance_variable_get('@watcher') }
        it { should be_a_new(Watcher) }
      end
    end
  end
end
