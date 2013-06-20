require 'spec_helper'

describe "Watchers" do
  describe "GET /watchers/new" do
    it "works! (now write some real specs)" do
      get new_watchers_path
      response.status.should be(200)
    end
  end
end
