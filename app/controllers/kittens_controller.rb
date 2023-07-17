class KittensController < ApplicationController
  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kitten }
      format.json { render :json => @kitten }
    end
  end

  def index
    @kittens = Kitten.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kittens }
      format.json { render :json => @kittens }
    end
  end

  def new
    @kitten = Kitten.new 
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to @kitten , notice: "New kitten added"
    else
      render :new, status: :unprocessable_entity 
    end

  end

  def edit
    @kitten = Kitten.find(params[:id])

  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten , notice: "Kitten changed"
    else
      render :edit, status: :unprocessable_entity 
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
