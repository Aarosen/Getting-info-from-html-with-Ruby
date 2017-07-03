require 'Nokogiri'
require 'open-uri'
class Page
  def initialize(url)
    html_file = open(url)
    @doc = Nokogiri::HTML(File.open(html_file))
  end

  	def fetch!
      sleep 2
      a = "Ready!!!"
  	end

  	def links
      a = []
      b = []
      (0..5).each do |x|
        home = @doc.search(".nav-item > a")[x]
        a << home.inner_text
      end
      a[0] = "Facebook"
      a[1] = "Twitter"
      a

      (0..5).each do |x|
        home = @doc.search(".nav-item > a")[x]
        b << home.xpath('//nav/div/ul/li/a/@href')[x].value
      end
      b

      (0..5).each do |x|
        p a[x]
        p b[x]
        puts 
      end
  	end

  	def title
  	 profile_name = @doc.search(".lplh-115 > span")
     profile_name.inner_text.strip
   end
end

class Browser
  def run!
    page = Page.new("http://www.codealab.mx/")
    p page.fetch!
    puts
    puts
    p page.title
    puts
    puts
    page.links
  end
end

Browser.new.run!

