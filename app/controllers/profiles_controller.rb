class ProfilesController < ApplicationController
    before_action :signed_in_user
  
      # will need to add before action and correct user for profile create,edit, update
    def index
        @search = Profile.search(params[:q])
        @profiles = @search.result
        #  @user = User.find(params[:id])
        #  @profile = @user.profile(params[:id])
    end
  
    def new
        @profile = Profile.new

    end
    
    def create
        @profile = current_user.build_profile(profile_params)
        if @profile.update_attributes(profile_params)
            redirect_to current_user
            else
            render 'edit'
        end
    end
    
    
    
    def show
        @profile = Profile.find(params[:id])
    end
    
   
    
    def edit
        @profile = current_user.profile(params[:id])
    end

    def update
        @profile = current_user.profile(params[:id])
        if @profile.update_attributes(profile_params)
            redirect_to current_user
            else
            render 'edit'
        end
    end
    
    
    def destroy
    end


private

def profile_params
    params.require(:profile).permit(:name, :gender, :age, :mytown, :myschools, :myjob, :facts, :avatar, :birthdate)

end


# Before filters
    
    def signed_in_user
        unless signed_in?
            store_location
            redirect_to signin_url, notice: "Please sign in."
        end
    end

end