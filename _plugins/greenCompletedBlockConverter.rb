module Jekyll
  class GreenCompletedBlockConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /^\.md$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      content.gsub(/\\(.*)\\/, '<code class="highlighter-rouge-green">\1</code>')
    end
  end
end