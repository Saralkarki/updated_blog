module ApplicationHelper
    # Setting up markdown
    def markdown(content)
        renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
        options= {autolink: true,no_intra_emphasis: true,fenced_code_block: true, 
        lax_html_block: true, strikethrough: true, superscript: true, underline: true, quote:true,footnotes:true}
        # go to ruby gems of redcarpet to understand how all of it works
        Redcarpet::Markdown.new(renderer, options).render(content).html_safe 
    end
end
