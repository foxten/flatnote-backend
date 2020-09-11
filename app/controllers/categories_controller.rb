class CategoriesController < ApplicationController

    def index
        categories = Category.all
        render json: categories, include: :notes
    end

    def show
        category = Category.find(params[:id])
        render json: category.to_json(:include => {:notes => {:only => [:subject]}})
    end

    def create
        category = Category.create(category_params)
        render json: category, include: :notes
    end

    def edit
        category = Category.find(params[:id])
    end

    def update
        category = Category.find(params[:id])
        category.update(name: params[:neName])
        render json: category, include: :notes
    end

    def destroy
        category = category.find(params[:id])
        category.destroy
        render json: category
    end

    private
        def category_params
            params.require(:category).permit(:name)
        end

end
