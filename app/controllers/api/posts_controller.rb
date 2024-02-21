module Api
    class PostsController < ApplicationController
        skip_before_action :authorize, only: [:index, :show]
    end    

    def index
        Post.all
    end

    def show
        render json: Post.find(params[:id])
    end

    def create
        @post = @current_user.posts.build(post_params)
        if @post.save
            render json: @post, status: :created, location: @post
        else
            render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
    end


    def update
        @post = @current_user.posts.find(params[:id])
        if @post.update
            render json: @post
        else
            render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def destroy
        @post = @current_user.posts.find(params[:id])
        @post.destroy
        head :no_content
    end

    private 

    def post_params
        params.permit(:title, :content, :category_ids: [])
    end

    end
end