class CatsController < ApplicationController

    def index
        @kitties = Cat.all 
        # render json: kitties
        render :index
    end

    def show
        @kitty = Cat.find_by(id: params[:id])

        if @kitty
            render :show
        else
            redirect_to cats_url
        end
    end

    def new
        render :new
    end

    def create
        @kitty = Cat.new(cat_params)

        if @kitty.save
            redirect_to cat_url(@kitty.id)
        else
            fail
        end
    end

    def update
         @kitty = Cat.find_by(id: params[:id])

        if @kitty.update(cat_params)
            redirect_to cat_url(@kitty.id)
        else
            fail
        end
    end

    def edit
        @kitty = Cat.find_by(id: params[:id])
        render :edit
    end

    private

    def cat_params
        params.require(:cat).permit(:age, :birth_date, :color, :description, :name, :sex)
    end
end