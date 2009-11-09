class User < ActiveRecord::Base
  validates_presence_of :full_name,:address
  
  file_column :picture
  has_permalink :full_name,:myname
  #after_create :perma_name
  
 validates_format_of :picture, :with => %r{\.(gif|jpg|png)$}i, :message => "must bee a image and format as GIF ,JPG or PNG ",:allow_nil => true
  
  
end
