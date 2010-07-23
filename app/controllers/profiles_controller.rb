class ProfilesController < ApplicationController
  def index  
  @users = User.find_by_subdomain!(request.subdomain) 
    @profile = Profile.where(:user_id => @users)
  end
  
  def show   
  @users = User.find_by_subdomain!(request.subdomain)
  @profile = Profile.find(params[:id])  
  
  end
  
  def new
    @profile = Profile.new
  end
  
  def create
    @profile = Profile.new(params[:profile])
    if @profile.save
      flash[:notice] = "Successfully created profile."
      redirect_to @profile
    else
      render :action => 'new'
    end
  end
  
  def edit  
  @users = User.all
    @profile = Profile.find(params[:id])
  end
  
  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      flash[:notice] = "Successfully updated profile."
      redirect_to @profile
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    flash[:notice] = "Successfully destroyed profile."
    redirect_to profiles_url
  end
end
