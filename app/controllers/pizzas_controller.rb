class PizzasController < ApplicationController

before_action :find_pizza, only:[:show, :edit, :update, :destroy]

 def index
   @pizzas = Pizza.all

 end


 def show
   render :show
 end

 def new
   @pizza = Pizza.new
   @restaurants = Restaurant.all
 end

 def create

   @pizza = Pizza.create(pizza_params)
   if @pizza.valid?
   redirect_to pizzas_path

   else
     flash[:errors] = @pizza.errors.full_messages
      redirect_to new_pizza_path
   end

  end
  
 def edit
   @restaurants = Restaurant.all
 end

 def update
   @pizza.update(pizza_params)
   redirect_to pizza_path(@pizza)
 end


 def destroy
   @pizza.delete
   redirect_to pizzas_path
 end


private

 def find_pizza
   @pizza = Pizza.find(params[:id])
 end

 def pizza_params
   params.require(:pizza).permit(:name, :ingredients, :restaurant_id)
 end

end
