class ArticleController < ApplicationController
    before_action :authorize_request
    
    def list 
        render  json: {"data" => Article.all}
    end

    def show
        @article = Article.find(1)
        render json: {"data" => @article} , status: :ok
    end

    def create 
        @article = Article.new(acticle_params)
        categories = Category.where(id: params[:article][:categories_id]) 
        @article.categories = categories
        if  @article.save
            render json: {"article" => @article} , status: :created and return 
        end
        render json: {:error => @article.errors.full_messages } , status: :bad_request   

    end

    def update
        @article = Article.find(params[:article][:id])
        if @article.update(acticle_params)
            categories = Category.where(id: params[:article][:categories_id]) 
            @article.categories = categories
            render json: {"article" => @article} , status: :ok
        else 
            render json: { :error => @article.errors.full_messages} , status: :bad_request
        end
    end

    def delete 
        @article = Article.find(params[:article][:id])
        @article.destroy
        return render json: {"message" => "article deleted"}
    end

    def search_in_article 
        title = params.fetch(:text, "")
        result = Article.where("title LIKE ? OR description LIKE ?", "%#{title}%", "%#{title}%")
        render json: {"data" => result} 
    end

    private 

    def acticle_params
        params.require(:article).permit(:title, :description , :user_id)
    end

   
end
