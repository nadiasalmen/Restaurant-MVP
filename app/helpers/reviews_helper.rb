module ReviewsHelper
  def star_rating(rating)
    counter = 0
    stars = ""
    5.times do
      stars += "<i class='fa #{rating > counter ? 'fa-star' : 'fa-star-o'}'></i>"
      counter += 1
    end
    stars
  end
end
