module Likable	

  def like!(current_user)
  	Like.find_or_create_by!(likeable: self, user_id: current_user.id) do |like|
  		like.user_id = current_user.id
  	end
  end

  def dislike!(current_user)
  	like = Like.find_by(likeable: self, user_id: current_user.id)  	
  	like.destroy! if like
  end

end