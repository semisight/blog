require 'nokogiri'

module Jekyll
  module AssetFilter
    def only_first_p(post)
      output = "<p>"
      output << Nokogiri::HTML(post["content"]).at_css("p").inner_html
      output << "</p>"

      output
    end
  end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)