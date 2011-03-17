class UsersController < ApplicationController
    respond_to :html, :json

    def create
		obj = ActiveSupport::JSON.decode(request.body) 

        @u = User.where(:udid => obj['udid'])
        
        if @u.length > 0
            @u = @u.first
        else
            @u = User.new
        end

        @u.udid = obj['udid']
        @u.name = obj['name'] 

        if @u.save
            render :json => {:success => true, :id => @u.id}
        else
            render :json => {:success => false}
        end
    end

end
