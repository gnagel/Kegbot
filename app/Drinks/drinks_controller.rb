require 'rho/rhocontroller'
require 'helpers/browser_helper'

class DrinksController < Rho::RhoController
  include BrowserHelper

  # GET /Drinks
  def index
    @drinkses = Drinks.find(:all)
    render :back => '/app'
  end

  # GET /Drinks/{1}
  def show
    @drinks = Drinks.find(@params['id'])
    if @drinks
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Drinks/new
  def new
    @drinks = Drinks.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Drinks/{1}/edit
  def edit
    @drinks = Drinks.find(@params['id'])
    if @drinks
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Drinks/create
  def create
    @drinks = Drinks.create(@params['drinks'])
    redirect :action => :index
  end

  # POST /Drinks/{1}/update
  def update
    @drinks = Drinks.find(@params['id'])
    @drinks.update_attributes(@params['drinks']) if @drinks
    redirect :action => :index
  end

  # POST /Drinks/{1}/delete
  def delete
    @drinks = Drinks.find(@params['id'])
    @drinks.destroy if @drinks
    redirect :action => :index  
  end
end
