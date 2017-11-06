class ActorsController < ApplicationController
	def index
		@actors = Actor.all
	end	

	def new
		@actor = Actor.new
	end

	def create
		@actor = Actor.new
		if @actor.save(actor_params)
			flash[:notice] = "Actor creado con éxito"
			redirect_to actors_path
		else
			flash[:error] = "Actor no creado con éxito"
			render :new
		end
	end


	private
		def actor_params
			params.require(:actor).permit(:name, :bio, :birth_date, :birth_place, :image_url, :alive, :death_date, :death_place)
		end
end