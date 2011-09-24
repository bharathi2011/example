class Book < ActiveRecord::Base
  belongs_to :Subject
  attr_accessible :title, :author, :price, :comments, :subject_id

  def self.search(search)
    if search
      where(' title LIKE ?', "%#{search}")
    else
      scoped
    end
  end

end

