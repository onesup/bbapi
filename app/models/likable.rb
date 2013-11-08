module Likable	

  def like!(liker)
  	Like.find_or_create_by!(likeable: self, liker: liker) do |like|
  		like.liker = liker
  	end
  end

  def dislike!(liker)
  	like = Like.find_by(likeable: self, liker: liker)  	
  	like.destroy! if like
  end

end