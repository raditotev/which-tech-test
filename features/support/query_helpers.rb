module QueryHelpers
  def wait_for selector
    find(:css, selector, match: :first)
  end

  def get_elements selector, collection
    page.all(:css, selector).each {|p| collection << p.text.gsub(/(£|\,|\s|\.|\")/, '').to_i}
  end

  def get_recently_reviewed recently_reviewed
    page.all(:css, 'p._32MSL').each_with_index do |d, i|
      if i.odd?
        date = d.text.gsub(/Reviewed:\s(-)?/, '').strip
        recently_reviewed << Date.parse(date) unless date.empty?
      end
    end
  end

  def get_recently_launched recently_launched
    page.all(:css, 'p._32MSL').each_with_index.select do |d, i|
      if i.even?
        date = d.text.gsub(/Launched:\s/, '')
        recently_launched << Date.parse(date)
      end
    end
  end
end
