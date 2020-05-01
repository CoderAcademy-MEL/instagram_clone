module PostsHelper
  def image_for(post)
    if post.image.present?
      post.image
    else
      "https://i.picsum.photos/id/#{rand(0...200)}/320/200.jpg"
    end
  end
end
