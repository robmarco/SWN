class TrialsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /trials
  # GET /trials.xml
  def index
    @trials = current_user.trials.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trials }
    end
  end

  # GET /trials/1
  # GET /trials/1.xml
  def show
    @trial = Trial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @trial }
    end
  end

  # GET /trials/new
  # GET /trials/new.xml
  def new
    @trial = current_user.trials.new

    @trial_categories = TrialCategory.all
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @trial }
    end
  end

  # GET /trials/1/edit
  def edit
    @trial = Trial.find(params[:id])
    
    #Array de Categorías ordenado con el seleccionado primero
    @trial_categories = []
    TrialCategory.all.each {|c| c.name==@trial.trial_category.name ? @aux=c : @trial_categories << c }
    @trial_categories.insert(0,@aux)
  end

  # POST /trials
  # POST /trials.xml
  def create
    @trial = current_user.trials.new(params[:trial])
    
    @trial_categories = TrialCategory.all
    
    respond_to do |format|
      if @trial.save
        session[:trials_size] = current_user.trials.size
        format.html { redirect_to(@trial, :notice => 'Trial was successfully created.') }
        format.xml  { render :xml => @trial, :status => :created, :location => @trial }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @trial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /trials/1
  # PUT /trials/1.xml
  def update
    @trial = Trial.find(params[:id])

    #Array de Categorías ordenado con el seleccionado primero
    @trial_categories = []
    TrialCategory.all.each {|c| c.name==@trial.trial_category.name ? @aux=c : @trial_categories << c }
    @trial_categories.insert(0,@aux)
    
    respond_to do |format|
      if @trial.update_attributes(params[:trial])
        format.html { redirect_to(@trial, :notice => 'Trial was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @trial.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trials/1
  # DELETE /trials/1.xml
  def destroy
    @trial = Trial.find(params[:id])
    @trial.destroy
    session[:trials_size] = current_user.trials.size

    respond_to do |format|
      format.html { redirect_to(trials_url) }
      format.xml  { head :ok }
    end
  end
end
