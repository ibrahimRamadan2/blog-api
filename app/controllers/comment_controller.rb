class CommentController < ApplicationController
    before_action :authorize_request
    
    def list   # should list all comments for an article
        @article = Article.find(params[:comment][:article_id])
        render json: {comments: @article.comments}  , status: :ok
    end
    
    def create
        @comment = @article.comments.create!(comment_params)
        render json: {comment: @comment} , status: :created
    end

    def update
        @comment = Comment.find(params[:comment][:id])
        @comment.update!(comment_params)
        render json: {comment: @comment} , status: :ok
    end

    def delete
        @comment = Comment.find(params[:comment][:id])
        @comment.destroy
        render json: {"message" => "comment deleted"} , status: :ok
    end

    private
    def comment_params
        params.require(:comment).permit(:article_id, :description , :user_id)
    end

end
