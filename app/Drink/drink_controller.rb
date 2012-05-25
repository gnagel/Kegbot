require 'rho/rhocontroller'
require 'helpers/browser_helper'

class DrinkController < Rho::RhoController
  include BrowserHelper

  # GET /Drink
  def index
    @drinks = Drink.find(:all)
    render :back => '/app'
  end

  # GET /Drink/{1}
  def show
    @drink = Drink.find(@params['id'])
    if @drink
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Drink/new
  def new
    @drink = Drink.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Drink/{1}/edit
  def edit
    @drink = Drink.find(@params['id'])
    if @drink
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Drink/create
  def create
    @drink = Drink.create(@params['drink'])
    redirect :action => :index
  end

  # POST /Drink/{1}/update
  def update
    @drink = Drink.find(@params['id'])
    @drink.update_attributes(@params['drink']) if @drink
    redirect :action => :index
  end

  # POST /Drink/{1}/delete
  def delete
    @drink = Drink.find(@params['id'])
    @drink.destroy if @drink
    redirect :action => :index  
  end
end
