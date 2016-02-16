class GiftPropositionController < ApplicationController
  def new
  	@gift_proposition = GiftProposition.new
  end

  def create
  	@gift_proposition = GiftProposition.new(params.require(:gift_proposition).permit(:name, :url, :brand_name, :price, :description, :comment))
  	if @gift_proposition.save
  		redirect_to root_path, notice: 'Thank you for submitting.'
  	else
  		render 'new'
  	end
  end
end
