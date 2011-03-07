class UsersController < ApplicationController
    respond_to :html, :json

    def create
        @u = User.new

        @u.udid = params[:udid]
        @u.name = params[:name]

        if @u.save
            render :json => {:success => true}
        else
            render :json => {:success => true, :id => @u.id}
            render :json => {:success => false}
        end
    end

end
