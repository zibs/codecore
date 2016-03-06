class Linking < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  def show_icon(title)
    if title.downcase == "github"
      "github"
    elsif title.downcase == "linkedin"
      "linkedin"
    elsif title.downcase == "twitter"
      "twitter"
    else
      title
    end
  end
end
