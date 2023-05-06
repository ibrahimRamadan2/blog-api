class NestedCommentController < ApplicationController
    before_action :authorize_request
    
    def list   # should list all nested_comments for a comment
        @comment = Comment.find(params[:nested_comment][:comment_id])
        render json: {nested_comments: @comment.nest_comments}  , status: :ok
    end
    
    def create
       
        @comment = Comment.find(params[:nested_comment][:comment_id])
        @nested_comment =@comment.nest_comments.create!(comment_params)
        render json: {comment: @nested_comment} , status: :created
    end

    def update
        @comment = Comment.find(params[:comment][:comment_id])
        @nested_comment = @comment.nest_comments.update!(comment_params)
        render json: {comment: @nested_comment} , status: :ok
    end

    def delete
        @nest_comment = NestComment.find(params[:comment][:id])
        @nest_comment.destroy
        render json: {"message" => "comment deleted"} , status: :ok
    end

    private
    def comment_params
        params.require(:nested_comment).permit(:comment_id, :description ,:user_id)
    end

end
