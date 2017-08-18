module PostsHelper
  
  def tag_links(tags)
  tags.split(",").map{|tag| link_to tag.strip, tag_path(tag.strip) }.join(", ") 
  end
  
  def category_links(categories)
  categories.split(",").map{|category| link_to category.strip, category_path(category.strip) }.join(", ") 
  end
  
  def tag_cloud(tags, classes)
    max = tags.sort_by(&:count).last
    tags.each do |tag|
      index = tag.count.to_f / max.count * (classes.size-1)
      yield(tag, classes[index.round])
    end
  end
  
  def options_for_author
  
  User.joins(:roles).where('roles.name = "News Editor"').map(&:name)
  end
  
end
