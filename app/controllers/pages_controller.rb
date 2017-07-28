class PagesController < ApplicationController
  
  def show
   if private_page?
    logged_in_user
    @page = Page.find_by_slug(params[:id])
    puts "private page!"
    redirect_to root_path unless @page
   end

   @upload = Upload.new
   @uploads = Upload.where("directory like ?", "%#{Page.find_by_slug(params[:id]).fileFolder}%")
   
       u = Upload.all
    @upload_paths = u.map { 
      |upload| encoded_url = URI.encode(upload.name.path) 
      url = URI(encoded_url).path.split('/').fourth
      URI(encoded_url).path.split('/')[4..-1].each do |i|
        if i != URI(encoded_url).path.split('/').last 
          if has_number?(i) == false
          end
        end
      end
      URI(url)
    }.uniq


  end
  
  def index
   @page = Page.find_by_slug('home')
  end
  
  def private_page?
   @page = Page.find_by_slug(params[:id])
   if @page.private == true
    return true
   end
  end
  
  #confirms a logged-in user.
      def logged_in_user
        unless logged_in?
          store_location
          flash[:danger]= "Please log in."
          redirect_to login_path
          
        end
      end
      
      #check if a string only contains number, if yes return true or else false
    def has_number?(i)
      if /^(?<num>\d+)$/ =~ i
        true
      else
        false
      end
    end    
  
end
