module SuggestionsHelper

  def short_text(text)
    if text.length > 140
      return text[0..140] + "..."
    else
      return text
    end
  end

end
