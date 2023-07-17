class KittensController < ApplicationController
  def show
    @kitten = Kitten.find(params[:id])
  end

  def index
    @kittens = Kitten.all
  end

  def new
    @kitten = Kitten.new 
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to @kitten , notice: "New kitten added"
    else
      render :new, status: :unprocessable_entity , flash.now[:notice] = "Kitten not added"
    end

  end

  def edit
    @kitten = Kitten.find(params[:id])

  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update
      redirect_to @kitten , notice: "Kitten changed"
    else
      render :edit, status: :unprocessable_entity , flash.now[:notice] = "Kitten not updated"
    end


  end

  def destroy
    @kitten = Kitten.find(params[:id])
    @kitten.destroy

    redirect_to root_path, status: :see_other , notice: "Kitten deleted"
  end

  private 
  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end 
end
