class RelationshipsController < ApplicationController
    
    
    def create
        @user = User.find(params[:relationship][:watching_id])
        current_user.connect!(@user)
        redirect_to @user.profile
    end
    
    def destroy
        @user = Relationship.find(params[:id]).watching
        current_user.remove!(@user)
        redirect_to @user.profile
    end
end