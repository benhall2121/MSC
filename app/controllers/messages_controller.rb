class MessagesController < ApplicationController
  include ApplicationHelper
  
  # GET /messages
  # GET /messages.xml
  def index
    @messages = Message.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = Message.new(:message_type => params[:message_type])
    
    respond_to do |format|
    	    format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = Message.new(params[:message])
    
    respond_to do |format|
      if @message.save
        if @message.message_type == 'sms'   
        	
      	randnum = rand(10000).to_s;	
      	message = @message.message     
      	phone = phoneNumber
      	url = 'https://api.tropo.com/1.0/sessions?action=create&token=0452fe7820523740b9b540e50072440c154005259a1b2ac08ca573e69cf7a3428f3637927a92c9d6c4704b05&numberToDial=' + phone + '&msg=' + message
      	response = RestClient.get URI.encode(url)	
        	
       elsif @message.message_type == 'order'
       	  ContactMailer.order_email(@message).deliver
       else
      	  #Email
          ContactMailer.contact_email(@message).deliver
	end
	
        format.js  { render :nothing => true }
        format.html { render :nothing => true }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.js  { render :nothing => true }
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.xml
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to(@message, :notice => 'Message was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end
end
