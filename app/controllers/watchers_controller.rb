# coding: utf-8

class WatchersController < ApplicationController
  # GET /watchers
  def index
    @watchers = Watcher.all
  end

  # GET /watchers/1
  def show(id)
    @watcher = Watcher.find(id)
  end

  # GET /watchers/new
  def new
    @watcher = Watcher.new
  end

  # GET /watchers/1/edit
  def edit(id)
    @watcher = Watcher.find(id)
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

  # PUT /watchers/1
  def update(id, watcher)
    @watcher = Watcher.find(id)

    if @watcher.update_attributes(watcher)
      redirect_to @watcher, notice: 'Watcher was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /watchers/1
  def destroy(id)
    @watcher = Watcher.find(id)
    @watcher.destroy

    redirect_to watchers_url
  end
end
