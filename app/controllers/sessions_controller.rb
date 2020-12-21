class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create 
        @user = User.find_by(name: params[:user][:name])
        if @user && @user.authenticate(params[:user][:password])
            session[:id] = @user.id
            redirect_to @user
        else
            flash[:errors] = "Name or password is incorrect."
            redirect_to login_path
        end
    end
end
