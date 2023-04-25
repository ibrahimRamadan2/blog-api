class ArticleController < ApplicationController
    def list 
        render  json: {"data" => Article.all}
    end

    def show
        render json: {"data" => Article.find(params[:id])}
    end

    def create 
        @article = Article.create!(acticle_params)
        render json: {"article" => @article} , status: :created
    end

    def update
        @article = Article.find(params[:article][:id])
        if @article.update(acticle_params)
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

    private 

    def acticle_params
        params.require(:article).permit(:title, :description)
    end

end
