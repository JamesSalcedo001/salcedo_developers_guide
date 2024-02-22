module Api
    class CategoriesController < ApplicationController
        before_action :set_category, only: [:show, :update, :destroy]
        skip_before_action :authorize, only: [:index, :show]
        before_action :require_admin, only: [:create, :update, :destroy]

        def index
            render json: Category.all
        end

        def show 
            render json: @category
        end

        def create
            category = Category.create!(category_params)
            render json: category
        end

        def update
            if @category.update(category_params)
                render json: @category
            else
                render json: { errors: @category.errors.full_messages }, status: :unprocessable_entity
            end
        end

        def destroy
            @category.destroy
            head :no_content
        end

        private

        def set_category
            @category = Category.find(params[:id])
        end

        def category_params
            params.permit(:name)
        end

    end
end

