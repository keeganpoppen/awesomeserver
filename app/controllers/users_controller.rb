class UsersController < ApplicationController
    respond_to :html, :json

    def create
        @u = User.new

		obj = ActiveSupport::JSON.decode(request.body) 

        @u.udid = obj['udid']
        @u.name = obj['name'] 

        if @u.save
            render :json => {:success => true}
        else
            render :json => {:success => true, :id => @u.id}
            render :json => {:success => false}
        end
    end

end
