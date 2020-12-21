class UsersController < ApplicationController
    def show
        # byebug
        @user = User.find(params[:id])
    end 

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to @user
        else
            flash[:errors] = "Password and confirmation must match."
            redirect_to new_user_path
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
