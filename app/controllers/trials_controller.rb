# encoding: utf-8

class TrialsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /trials
  # GET /trials.xml
  def index
    @trials = current_user.trials.order(:date_trial)
    @trial_categories = TrialCategory.order(:name)
    
    respond_to do |format|
      format.html # index.html.erb
      format.pdf do      
        html = render_to_string(:layout => "pdf", :action => "pdf/trials.html.erb")
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/public/stylesheets/print.css" 
        send_data kit.to_pdf, :filename =>  "qs_tests.pdf", 
                              :type => 'application/pdf',
                              disposition: "inline"
      end
    end
  end

  # GET /trials/1
  # GET /trials/1.xml
  def show
    @trial = current_user.trials.find(params[:id])
    @trial_results = @trial.trial_results.joins(:swimmer).order("secname ASC, name ASC")

    respond_to do |format|
      format.html # show.html.erb
      format.pdf do      
        html = render_to_string(:layout => "pdf", :action => "pdf/trial.html.erb")
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/public/stylesheets/print.css" 
        send_data kit.to_pdf, :filename =>  "qs_test_#{@trial.id}.pdf", 
                              :type => 'application/pdf',
                              disposition: "inline"
      end
    end
  end

  # GET /trials/new
  # GET /trials/new.xml
  def new
    @trial = current_user.trials.new

    @trial_categories = TrialCategory.all
    
    # Result built when try to add a new competition
    # @trial_result = @trial.trial_results.build
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /trials/1/edit
  def edit
    @trial = current_user.trials.find(params[:id])
    
    #Array de Categorías ordenado con el seleccionado primero
    @trial_categories = []
    TrialCategory.all.each {|c| c.name==@trial.trial_category.name ? @aux=c : @trial_categories << c }
    @trial_categories.insert(0,@aux)
    
    respond_to do |format|
      format.html
      format.js
    end
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
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /trials/1
  # PUT /trials/1.xml
  def update
    @trial = current_user.trials.find(params[:id])

    #Array de Categorías ordenado con el seleccionado primero
    @trial_categories = []
    TrialCategory.all.each {|c| c.name==@trial.trial_category.name ? @aux=c : @trial_categories << c }
    @trial_categories.insert(0,@aux)
    
    respond_to do |format|
      if @trial.update_attributes(params[:trial])
        format.html { redirect_to(@trial, :notice => 'Trial was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /trials/1
  # DELETE /trials/1.xml
  def destroy
    @trial = current_user.trials.find(params[:id])
    @trial.destroy
    session[:trials_size] = current_user.trials.size
    
    respond_to do |format|
      format.html { redirect_to(trials_url) }
    end
  end
end
