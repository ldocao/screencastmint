module TweetsHelper

  def render_tweet_date(input_date)
    input_date = input_date.to_s.split(" ")
    entire_date = input_date[0]
    current_date = entire_date.split("-")

    day   = current_date[2]
    month = french_months(current_date[1])
    year  = current_date[0]

    "Posté le #{day} #{month} #{year}"
  end

  def render_tweet_link(content)
    words = content.to_s.split(' ')
    w = ""

    words.each do |word|
      w << if word[0..3] == "http"
        (link_to "#{word} ", "#{word}", target: "_blank")
      else
        "#{word} "
      end
    end

    return w
  end

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
