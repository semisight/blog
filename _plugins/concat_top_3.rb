require 'nokogiri'

module Jekyll
  module ConcatTopFilter
    def concat_top_3(post_ary, ul_class, li_class)
      output = "<ul class=\"#{ul_class}\">\n"

      detail = post_ary.take 3
      mass = post_ary.drop 3

      detail.each {|post|
        output << "<h3><a href=\"#{post.url}\">#{post.data['title']}</a></h3>"
        output << "<p>"
        output << Nokogiri::HTML(post.content).at_css("p").inner_html
        output << "</p>\n"
        output << "<h4><a href=\"#{post.url}\" class=\"more\">read more &raquo;</a></h4><br />"
      }

      mass.each {|post|
        output << "<li class=\"#{li_class}\"><a href=\"#{post.url}\">#{post.data['title']}</a></li>\n"
      }

      output << "</ul>\n"
      output
    end
  end
end

Liquid::Template.register_filter(Jekyll::ConcatTopFilter) 