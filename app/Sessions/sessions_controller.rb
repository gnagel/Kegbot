require 'rho/rhocontroller'
require 'helpers/browser_helper'

class SessionsController < Rho::RhoController
  include BrowserHelper

  # GET /Sessions
  def index
    @sessionses = Sessions.find(:all)
    render :back => '/app'
  end

  # GET /Sessions/{1}
  def show
    @sessions = Sessions.find(@params['id'])
    if @sessions
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Sessions/new
  def new
    @sessions = Sessions.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Sessions/{1}/edit
  def edit
    @sessions = Sessions.find(@params['id'])
    if @sessions
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Sessions/create
  def create
    @sessions = Sessions.create(@params['sessions'])
    redirect :action => :index
  end

  # POST /Sessions/{1}/update
  def update
    @sessions = Sessions.find(@params['id'])
    @sessions.update_attributes(@params['sessions']) if @sessions
    redirect :action => :index
  end

  # POST /Sessions/{1}/delete
  def delete
    @sessions = Sessions.find(@params['id'])
    @sessions.destroy if @sessions
    redirect :action => :index  
  end
end
