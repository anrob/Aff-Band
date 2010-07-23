class ActsController < ApplicationController
  def index
    @acts = Act.all    
       unless request.subdomain.blank?   
    @users = User.find_by_subdomain!(request.subdomain) 
    @profile = Profile.where(:user_id => @users)   
    else
        @profiles = Profile.all  
    end
  end
  
  def show
    #@act = Act.find_by_subdomain!(request.subdomain)   
   @users = User.find_by_subdomain!(request.subdomain) 
     @profile = Profile.where(:user_id => @users)
    @act = Act.find(params[:id])
    
  end
  
  def new
    @act = Act.new  
   #@users = User.find_by_subdomain!(request.subdomain) 
     @profile = Profile.where(:user_id => @users)
  end
  
  def create
    @act = Act.new(params[:act])
    if @act.save 
      if params[:act][:photo].blank? 
      flash[:notice] = "Successfully created act." 
    
      redirect_to @act
      else
      #render :action => "crop" 
      render :action => "new"  
      end
    else
      render :action => 'new'
    end
  end
  
  def edit
    @act = Act.find(params[:id]) 
    #@users = User.find_by_subdomain!(request.subdomain) 
    # @profile = Profile.where(:user_id => @users)
  end
  
  def update
    @users = User.find_by_subdomain!(request.subdomain) 
    @profile = Profile.where(:user_id => @users)
    @act = Act.find(params[:id]) 
    if @act.update_attributes(params[:act])
    if params[:act][:photo].blank? 
      flash[:notice] = "Successfully updated act." 
      redirect_to @act
        else
         #render :action => "crop"
          redirect_to @act  
        end
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @act = Act.find(params[:id])
    @act.destroy
    flash[:notice] = "Successfully destroyed act."
    redirect_to acts_url
  end
end
