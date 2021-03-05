class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_param)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to new_cocktail_dose_path
    else
      render 'new'
    end
  end

  def destroy
    dose = Dose.find(params[:id])
    cocktail = Cocktail.find(dose.cocktail_id)
    dose.destroy

    redirect_to cocktail_path(cocktail)
  end

  def doses_param
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
