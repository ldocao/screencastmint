module GithubersHelper

  # Display the content of commit message
  #
  # @param [String] commits messages
  # @return [String] improved commits messages
  def render_commit_content(content)

    if /Merge/.match(content)
      "<span class='merge'>#{content}</span>"
    else
      words = content.to_s.split(" ")
      type = "<span class='type'>#{words.first}</span>"
      ary_subjects = words[1..words.length]
      subject = ""

      ary_subjects.each do |word|
        subject << if word.first == "#"
          "<span class='footer-id'>#{word}</span> "
        else
          "#{word} "
        end
      end

      return "#{type} #{subject}"
    end
  end
end
