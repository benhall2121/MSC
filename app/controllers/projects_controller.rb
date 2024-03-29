class ProjectsController < ApplicationController
  before_filter :require_admin, :except => [:index, :show, :get_more]
  
  @@limit = 11
  
  def get_more
    @projects_already_displayed = Project.find(:all, :select => 'id', :order => "position, created_at DESC", :limit => params[:count]) 
    
    @projects = Project.find(:all, :conditions => ['id not in (?)', @projects_already_displayed], :order => "position, created_at DESC", :limit => @@limit)
  
    @limit = @@limit
    
    render 'get_more.js.erb'
  end 
  
  def index
    @projects = Project.find(:all, :order => 'position, created_at DESC', :limit => @@limit)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @projects }
    end
  end

  def sort
    params[:project].each_with_index do |id, index|
      Project.update_all({:position => index+1}, {:id => id})
    end
    render :nothing => true
  end

  # GET /projects/1
  # GET /projects/1.xml
  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.xml
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.xml
  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to(root_url, :notice => 'Project was successfully created.') }
        format.xml  { render :xml => @project, :status => :created, :location => @project }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.xml
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to(root_url, :notice => 'Project was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @project.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.xml
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to(projects_url) }
      format.xml  { head :ok }
    end
  end
end
