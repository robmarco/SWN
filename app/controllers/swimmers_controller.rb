# coding: utf-8
class SwimmersController < ApplicationController
  INDEX_COLUMNS = "id,name,secname,born,category,state, genre, licence"
  before_filter :authenticate_user!
  
  # GET /swimmers
  def index
    # Ordenado para el Excel
    @swimmers = current_user.swimmers.select(INDEX_COLUMNS).order('genre ASC, category ASC, secname ASC')
    
    # Nadadores filtrados por estado para los render del index
    @swimmers_fed = current_user.swimmers.select(INDEX_COLUMNS).federado.order('genre ASC, category ASC, secname ASC')
    @swimmers_nofed = current_user.swimmers.select(INDEX_COLUMNS).no_federado.order('genre ASC, category ASC, secname ASC')
    @swimmers_baja = current_user.swimmers.select(INDEX_COLUMNS).baja.order('genre ASC, category ASC, secname ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.xls
      format.pdf do      
        html = render_to_string(:layout => "pdf", :action => "pdf/swimmers.html.erb")
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/public/stylesheets/print.css" 
        send_data kit.to_pdf, :filename =>  "qs_nadadores.pdf", 
                              :type => 'application/pdf',
                              disposition: "inline"
      end
    end
  end

  # GET /swimmers/1
  def show
    @swimmer = current_user.swimmers.find(params[:id])
    @swimmer_competition_results = @swimmer.competition_results.joins(:competition).order("date_competition DESC")
    @swimmer_trial_results = @swimmer.trial_results.joins(:trial).order("date_trial DESC")

    respond_to do |format|
      format.html # show.html.erb
      format.pdf do      
        html = render_to_string(:layout => "pdf", :action => "pdf/swimmer.html.erb")
        kit = PDFKit.new(html)
        kit.stylesheets << "#{Rails.root}/public/stylesheets/print.css" 
        send_data kit.to_pdf, :filename =>  "qs_nadador_#{@swimmer.id}.pdf", 
                              :type => 'application/pdf',
                              disposition: "inline"
      end
    end
  end

  # GET /swimmers/new
  def new
    @swimmer = current_user.swimmers.new
    
    @categories = Category.all
    @states = State.all
    @countries = Country.all
    
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /swimmers/1/edit
  def edit
    @swimmer = current_user.swimmers.find(params[:id])
    
    #Array de Categorías ordenado con el seleccionado primero
    @categories = []
    Category.all.each {|c| c.name==@swimmer.category ? @aux=c : @categories << c }
    @categories.insert(0,@aux)
    
    #Array de Estado ordenado con el seleccionado primero
    @states = []
    State.all.each {|s| s.name==@swimmer.state ? @aux=s : @states << s}
    @states.insert(0,@aux)
    
    #Array de Estado ordenado con el seleccionado primero
    @countries = []
    Country.all.each {|s| s.name==@swimmer.country ? @aux=s : @countries << s}
    @countries.insert(0,@aux)
    
  end

  # POST /swimmers
  def create
    @swimmer = current_user.swimmers.new(params[:swimmer])
    
    @categories = Category.all
    @states = State.all
    @countries = Country.all
    
    respond_to do |format|
      if @swimmer.save
        session[:swimmers_size] = current_user.swimmers.size

        format.html { redirect_to(@swimmer, :notice => 'Swimmer was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /swimmers/1
  def update
    @swimmer = current_user.swimmers.find(params[:id])
    
    #Array de Categorías ordenado con el seleccionado primero
    @categories = []
    Category.all.each {|c| c.name==@swimmer.category ? @aux=c : @categories << c }
    @categories.insert(0,@aux)
    
    #Array de Estado ordenado con el seleccionado primero
    @states = []
    State.all.each {|s| s.name==@swimmer.state ? @aux=s : @states << s}
    @states.insert(0,@aux)
    
    #Array de Estado ordenado con el seleccionado primero
    @countries = []
    Country.all.each {|s| s.name==@swimmer.country ? @aux=s : @countries << s}
    @countries.insert(0,@aux)
    
    respond_to do |format|
      if @swimmer.update_attributes(params[:swimmer])
        format.html { redirect_to(@swimmer, :notice => 'Swimmer was successfully updated.') }
      else
          format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /swimmers/1
  def destroy
    @swimmer = current_user.swimmers.find(params[:id])
    @swimmer.destroy
    session[:swimmers_size] = current_user.swimmers.size
                                        
    respond_to do |format|
      format.html { redirect_to(swimmers_url) }
    end
  end

  def delete_photo
    @swimmer = current_user.swimmers.find(params[:id])
    @swimmer.photo = nil

    respond_to do |format|
      if @swimmer.save
        format.html { redirect_to(@swimmer, :notice => 'Swimmer Photo was successfully deleted.') }
      else
        format.html { redirect_to(@swimmer) }
      end      
    end    
  end

  def send_message_private
    @swimmer = current_user.swimmers.find(params[:id])
    @message = params[:message]

    respond_to do |format|
      if @message.present?
        # Send email using Swimmer_email Mailer
        SwimmerMailer.personal_message(current_user, @swimmer, @message).deliver
        
        format.html { redirect_to(@swimmer, :notice => 'Email was sent successfully to swimmer.')}
      else
        format.html { redirect_to(@swimmer, :alert => 'Email was not sent because message is blank.')}
      end
    end
  end

  def send_message
  end

  def send_message_post    
    @swimmers_list = Swimmer.select("email").find_by_ids(params[:swimmers_list]) # Could be insecure & error if Swimmer.id no exist!
    @message = params[:message]                                                 

    respond_to do |format|
      if params[:swimmers_list].present? && params[:message].present?
        SwimmerMailer.message_to(current_user, @swimmers_list, @message).deliver        
        format.html { redirect_to(swimmers_url, :notice => "Email was sent successfully to swimmers.")}
      else
        format.html { redirect_to(send_message_swimmers_url, :alert => 'Email was not sent because swimmer destinatary or message are blank.')}
      end
    end
  end

end
