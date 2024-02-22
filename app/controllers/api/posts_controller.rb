module Api
    class PostsController < ApplicationController
        before_action :set_post, only: [:show, :update, :destroy]
        skip_before_action :authorize, only: [:index, :show]
        before_action :require_admin, only: [:create, :update, :destroy]

    def index
        render json: Post.all
    end

    def show
        render json: @post
    end


    def create
        post = @current_user.posts.build(post_params)
        if post.save
            render json: post, status: :created
        else
            render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
        end
    end


    def update
        if @post.update(post_params)
            render json: @post
        else
            render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
        end
    end


    def destroy
        @post.destroy
        head :no_content
    end


    private 

    def set_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.permit(:title, :content, category_ids: [])
    end

    end
end