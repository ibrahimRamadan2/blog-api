class CategoryController < ApplicationController
    def list 
        render json: {"categories": Category.all}
    end

    def show
        @category = Category.find(params[:id])
        render json: {"category": @category}
    end
    def create
        @category = Category.new(category_params)
        if @category.save
            render json: {"category": @category} , status: :ok
        else 
            render json: {"error": @category.errors.full_messages } , status: :bad_request
        end
    end
    
    def update
        @category = Category.find(params[:category][:id])
        if(@category.update(category_params) )
           render json: {"category": @category} , status: :ok
        else 
            render json: {"error": @category.errors.full_messages } , status: :bad_request
        end
    end

    def delete
        @category = Category.find(params[:category][:id])
        @category.destroy
        render json: {"message": "Category deleted"}
    end

    private 
    def category_params
        params.require(:category).permit(:name)
    end
end
