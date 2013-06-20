require "spec_helper"

describe WatchersController do
  describe "routing" do
    it "routes to #new" do
      get("/watchers/new").should route_to("watchers#new")
    end

    it "routes to #create" do
      post("/watchers").should route_to("watchers#create")
    end
  end
end
