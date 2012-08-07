module Jekyll
  module DraftFilter
    def filter_drafts(post_ary)
      post_ary.reject{|post| post.data['draft']}
    end
  end
end

Liquid::Template.register_filter(Jekyll::DraftFilter) 