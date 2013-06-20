class TopController < ApplicationController
  def index
    @watchers = Watcher.all
  end
end
