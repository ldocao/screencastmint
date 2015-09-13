module TweetsHelper

  # Change input date to french tweet date
  #
  # @param [Date] date of tweet
  # @return [String] date of tweet
  def render_tweet_date(input_date)
    current_date = input_date.strftime('%d/%m/%Y')

    "Posté le #{current_date}"
  end

  # Make content links clickable
  #
  # @param [String] tweet content
  # @return [String] tweet with links
  def render_tweet_content(content)
    words = content.to_s.split(/[\s,-]/)

    content = ""

    #
    # Verify each words and apply link or span
    # before including to content
    words.each do |word|
      name = word[1..word.length]

      content << if word[0..3] == "http"
        (link_to "#{word} ", "#{word}", target: "_blank")
      elsif word.first == "#"
        (link_to "#{word} ", "https://twitter.com/hashtag/#{name}", target: "_blank")
      elsif word.first == "@"
        (link_to "#{word} ", "https://twitter.com/#{name}", target: "_blank")
      elsif word.first == "["
        "<span>#{word}</span> "
      else
        "#{word} "
      end
    end

    return content
  end

  private

  # Convert month number to french name
  #
  # @param [Integer] month number
  # @return [String] french month
  def french_months(month_number)

    case month_number
    when "01"
      "Janvier"
    when "02"
      "Février"
    when "03"
      "Mars"
    when "04"
      "Avril"
    when "05"
      "Mai"
    when "06"
      "Juin"
    when "07"
      "Juillet"
    when "08"
      "Août"
    when "09"
      "Septembre"
    when "10"
      "Octobre"
    when "11"
      "Novembre"
    when "12"
      "Décembre"
    else
      "Mars"
    end
  end
end
