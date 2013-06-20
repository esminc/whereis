# coding: utf-8

class WatchersController < ApplicationController
  # GET /watchers/new
  def new
    @watcher = Watcher.new
  end

  # POST /watchers
  def create(watcher)
    @watcher = Watcher.new(watcher)

    if @watcher.save
      redirect_to root_path, notice: 'Watcher was successfully created.'
    else
      render action: 'new'
    end
  end
end
