class Linking < ActiveRecord::Base
  belongs_to :user
  belongs_to :link

  validates :url, presence: true,
                  format: {with: /\A(https?):\/\/[^\s\/$.?#].[^\s]*\z/, message: "Invalid URL" }

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
