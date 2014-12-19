class UsersController < ApplicationController
    before_action :signed_in_user, only: [:index, :edit, :update]
    before_action :correct_user,   only: [:edit, :update]
    before_action :admin_user,     only: :destroy


    def show
        @user = User.find(params[:id])
        @profile = @user.profile(params[:id])
    end
    
    def destroy
        User.find(params[:id]).destroy
        flash[:success] = "User deleted."
        redirect_to users_url
    end
    
    def new
    end


def watching
    @title = "Watching"
    @user = User.find(params[:id])
    @users = @user.watched_users.paginate(page: params[:page])
    render 'show_connect'
end

def contacts
    @title = "Contacts"
    @user = User.find(params[:id])
    @users = @user.contacts.paginate(page: params[:page])
    render 'show_connect'
end

private

def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age)
end


    # Before filters
    
    def signed_in_user
        redirect_to new_user_registration_url, notice: "Please sign in." unless signed_in?
    end
    
    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
    
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
end