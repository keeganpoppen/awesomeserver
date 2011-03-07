class User < ActiveRecord::Base
  has_many :compositions

	def as_json(opts={})
	 {:id => id, :name => name}
	end

end
