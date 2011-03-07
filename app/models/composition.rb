class Composition < ActiveRecord::Base
  belongs_to :user

	def as_json(opts={})
		obj = {:id => id, :name => name, :user => user.as_json}
		obj[:data] = ActiveSupport::JSON.decode(data) if opts.has_key?(:include_data) && opts[:include_data]
		obj
	end

end
