# app/views/posts/index.rss.builder

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Child Welfare Digital Services Blog"
    xml.description "This is a blog by Child Welfare Digital Services"
    xml.link root_url

    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.author post.author
        xml.description truncate(strip_tags(post.body), :length => 160)
        
        xml.pubDate post.publish_time.to_s(:rfc822)
        xml.link post_url(post)
        xml.guid post_url(post)
      end
    end
  end
end