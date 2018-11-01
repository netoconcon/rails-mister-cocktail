class DosesController < ApplicationController
  before_action :cocktail_find, only: [:new, :create]

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktail/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktails_path
  end

  private

  def cocktail_find
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def doses_params
    params.require(:dose).permit(:ingredient_id, :description, :cocktail_id)
  end
end
