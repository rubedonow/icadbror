class ResourcesController < ApplicationController
  def index
    @resources = Resource.all
  end
  
  def show
    @resource = Resource.find(params[:id])
  end
  
  def new
    @resource = Resource.new
  end

  def edit
    @resource = Resource.find(params[:id])
  end
  
  def create
    @resource = Resource.new(resource_params)
 
    if @resource.save
      redirect_to @resource #redirect to show action, could be any other message...
    else
      render 'new'
    end
  end
  
  def update
      @resource = Resource.find(params[:id])
 
      if @resource.update(resource_params)
        redirect_to @resource
      else
        render 'edit'
      end
  end
    
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
 
    redirect_to resources_path
  end
    
  # editable fields
  private
    def resource_params
      params.require(:resource).permit(:resno, :resname, :rate)
    end
end
