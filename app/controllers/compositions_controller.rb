class CompositionsController < ApplicationController
	respond_to :html, :json

  def create
		@comp = Composition.new

		obj = ActiveSupport::JSON.decode(request.body) 

		@comp.name = obj['name']
		@comp.user = User.find(obj['user_id'])
		@comp.data = ActiveSupport::JSON.encode(obj['data'])

		if @comp.save
			render :json => {:success => true}
		else
			render :json => {:success => false}
		end
  end

	def index
	  @compositions = Composition.all
		respond_with @compositions, :include_data => false
	end

	def show
		@composition = Composition.find(params[:id])
		respond_with @composition, :include_data => true
	end

end
