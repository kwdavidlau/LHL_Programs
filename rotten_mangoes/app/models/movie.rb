class Movie < ApplicationRecord
  has_many :reviews
  has_and_belongs_to_many :actors
  mount_uploader :poster_image_url, ImageUploader

  scope :by_title,          -> (params) { where(title: params[:title]) }
  # scope :by_title_and_director,     -> { by_title.where(director: params[:director]) }
  scope :by_director,       -> (params) { where(director: params[:director])}
  scope :by_runtime,        -> (params) {
    choice = params[:runtime_in_minutes]
    if choice == "Under 90 minutes"
      where('runtime_in_minutes < ?', 90)
    elsif choice == "Over 120 minutes"
      where('runtime_in_minutes > ?', 120)
    else
      where('runtime_in_minutes > ?', 90).where('runtime_in_minutes < ?', 120)
    end
  }

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :poster_image_url,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_past

  def review_average
    reviews.sum(:rating_out_of_ten)/reviews.size if reviews.size != 0
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end


end
