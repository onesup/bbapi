module Likable	

  def like!(current_user)
  	Like.find_or_create_by!(likeable: self) do |like|
  		like.user_id = current_user.id
  	end
  end

  def dislike!
  	like = Like.find_by(likeable: self)  	
  	like.destroy! if like
  end

end