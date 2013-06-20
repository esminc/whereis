require 'spec_helper'

describe WatchersController do
  # This should return the minimal set of attributes required to create a valid
  # Watcher. As you add validations to Watcher, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyString" }
  end

  describe 'GET index' do
    before do
      @watcher = Watcher.create! valid_attributes
      controller.index
    end
    describe 'assigns all watchers as @watchers' do
      subject { controller.instance_variable_get('@watchers') }
      it { should eq([@watcher]) }
    end
  end

  describe 'GET show' do
    before do
      @watcher = Watcher.create! valid_attributes
      controller.show(@watcher.to_param)
    end
    describe 'assigns the requested watcher as @watcher' do
      subject { controller.instance_variable_get('@watcher') }
      it { should eq(@watcher) }
    end
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

  describe 'GET edit' do
    before do
      @watcher = Watcher.create! valid_attributes
      controller.edit(@watcher.to_param)
    end
    describe 'assigns the requested watcher as @watcher' do
      subject { controller.instance_variable_get('@watcher') }
      it { should eq(@watcher) }
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

  describe 'PUT update' do
    context 'with valid params' do
      describe 'updates the requested watcher, assigns the requested watcher as @watcher, and redirects to the watcher' do
        before do
          @watcher = Watcher.create! valid_attributes
          controller.should_receive(:redirect_to).with(@watcher, anything)
          controller.update(@watcher.to_param, valid_attributes)
        end
        subject { controller.instance_variable_get('@watcher') }
        it { should eq(@watcher) }
      end
    end

    context 'with invalid params' do
      describe "assigns the watcher as @watcher, and re-renders the 'edit' template" do
        before do
          @watcher = Watcher.create! valid_attributes
          # Trigger the behavior that occurs when invalid params are submitted
          Watcher.any_instance.stub(:save) { false }
          controller.should_receive(:render).with(:action => 'edit')
          controller.update(@watcher.to_param, { "name" => "invalid value" })
        end
        subject { controller.instance_variable_get('@watcher') }
        it { should eq(@watcher) }
      end
    end
  end

  describe 'DELETE destroy' do
    before do
      @watcher = Watcher.create! valid_attributes
      controller.stub(:watchers_url) { '/watchers' }
      controller.should_receive(:redirect_to).with('/watchers')
    end
    it 'destroys the requested watcher, and redirects to the watchers list' do
      expect {
        controller.destroy(@watcher.to_param)
      }.to change(Watcher, :count).by(-1)
    end
  end
end
