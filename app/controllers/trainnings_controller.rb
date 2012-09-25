class TrainningsController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /trainnings
  # GET /trainnings.xml
  def index
    @trainnings = current_user.trainnings.order(:date_trainning)
    @last_trainning = current_user.trainnings.last
    
    #@last_12_trainnings = current_user.trainnings.where('date_trainning < ?', current_user.trainnings.maximum("date_trainning")+1).limit(12).reverse_order
    #@last_12_trainnings = @trainnings.take_while {|i| i.date_trainning < (@trainnings.last.date_trainning)+1}.last(12)
    @last_12_trainnings = @trainnings.last(12).map(&:date_trainning).uniq
    
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /trainnings/1
  # GET /trainnings/1.xml
  def show
    @trainning = current_user.trainnings.find(params[:id])
    @trainning_exercises = @trainning.trainning_exercises

    respond_to do |format|
      format.html # show.html.erb
      format.pdf do      
        html = render_to_string(:layout => "pdf", :action => "pdf/trainning.html.erb")
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/public/stylesheets/print.css" 
        send_data kit.to_pdf, :filename =>  "qs_entrenamiento_#{@trainning.date_trainning.strftime('%d%m%Y')}.pdf", 
                              :type => 'application/pdf',
                              disposition: "inline"
      end
    end
  end

  # GET /trainnings/new
  # GET /trainnings/new.xml
  def new
    @trainning = current_user.trainnings.new
    
    # Exercise built when try to add a new trainning session
    @trainning_exercise = @trainning.trainning_exercises.build

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /trainnings/1/edit
  def edit
    @trainning = current_user.trainnings.find(params[:id])
  end

  # POST /trainnings
  # POST /trainnings.xml
  def create
    @trainning = current_user.trainnings.new(params[:trainning])

    respond_to do |format|
      if @trainning.save
        session[:trainnings_size] = current_user.trainnings.size
                
        format.html { redirect_to(@trainning, :notice => 'Trainning was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /trainnings/1
  # PUT /trainnings/1.xml
  def update
    @trainning = current_user.trainnings.find(params[:id])

    respond_to do |format|
      if @trainning.update_attributes(params[:trainning])
        format.html { redirect_to(@trainning, :notice => 'Trainning was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /trainnings/1
  # DELETE /trainnings/1.xml
  def destroy
    @trainning = current_user.trainnings.find(params[:id])
    @trainning.destroy
    session[:trainnings_size] = current_user.trainnings.size
    
    respond_to do |format|
      format.html { redirect_to(trainnings_url) }
    end
  end
end
