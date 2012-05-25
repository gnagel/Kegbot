require 'rho/rhocontroller'
require 'helpers/browser_helper'

class KegController < Rho::RhoController
  include BrowserHelper

  # GET /Kegs
  def index
    @kegses = Kegs.find(:all)
    render :back => '/app'
  end

  # GET /Kegs/{1}
  def show
    @kegs = Kegs.find(@params['id'])
    if @kegs
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Kegs/new
  def new
    @kegs = Kegs.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Kegs/{1}/edit
  def edit
    @kegs = Kegs.find(@params['id'])
    if @kegs
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Kegs/create
  def create
    @kegs = Kegs.create(@params['kegs'])
    redirect :action => :index
  end

  # POST /Kegs/{1}/update
  def update
    @kegs = Kegs.find(@params['id'])
    @kegs.update_attributes(@params['kegs']) if @kegs
    redirect :action => :index
  end

  # POST /Kegs/{1}/delete
  def delete
    @kegs = Kegs.find(@params['id'])
    @kegs.destroy if @kegs
    redirect :action => :index  
  end
end
