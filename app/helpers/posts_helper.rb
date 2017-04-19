module PostsHelper
  
  def tag_links(tags)
  tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 
  end
  def category_links(categories)
  categories.split(",").map{|category| link_to category.strip, category_path(category.strip) }.join(", ") 
  end
end
