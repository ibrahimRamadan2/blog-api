class UserController < ApplicationController
    before_action :authorize_request, except: :create

    def show
        is_Active_user
        @render json: @user
    end

    def create
        @user = User.new(user_params)
        @user.is_activated=false 
        @user.is_deleted.false
        if(@user.save)
            render json: {"data" => "User created"} , status: :ok and return 
        render  json: {"data" => "invalid params" } , status: :bad_request
    end

    def update  
        is_Active_user
        @user = User.update(user_params)
        if(@user.save)
            render json: {"user"=> @user} , status: :ok and return 
        end
        render json: {"erorr" => @user.erorr.full_messages } , status: :ok and return 
    
    end

    def delete
        is_Active_user
        @user.is_deleted=false 
        render json: {"data" => "User Deleted Successfully"} , status: :ok
    end
    


    private 
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation ,:name , :age , :bio)
    end

    def have_permission()
        retrun @user.is_activated &&  !@user.is_deleted
    end

    def is_Active_user()
        return if have_permission
        render json: {"data" : "please activate the user"} :status :forbidden
    end
end
