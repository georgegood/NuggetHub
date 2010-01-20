class NuggetsController < ApplicationController
  load_and_authorize_resource  

  def show
    @nugget = Nugget.find(params[:id])
    redirect_to @nugget, :status => 301 if @nugget.has_better_id?
  end

  def new
    @nugget = Nugget.new
    @nugget.body = ""
    @hide_add_nugget = true
  end

  def create
    @nugget = Nugget.new(params[:nugget])
    @nugget.user = current_user
    
    if @nugget.save
      flash[:notice] = "Your Nugget was successfully posted"
      redirect_to root_url
    else
      render :action => 'new'
    end
  end

  def edit
    @nugget = Nugget.find(params[:id])
  end

  def update
    @nugget = Nugget.find(params[:id])

    if @nugget.update_attributes(params[:nugget])
      flash[:notice] = 'Your Nugget was successfully updated.'
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
