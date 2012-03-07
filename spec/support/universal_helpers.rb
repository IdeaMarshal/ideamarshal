module UniversalHelperMethods
  def lorem(word_count = 50)
    words = [
      'sunt', 'iure', 'nam', 'nobis', 'eum', 'cum', 'officiis', 'excepturi',
      'odio', 'consectetur', 'quasi', 'aut', 'quisquam', 'vel', 'eligendi',
      'itaque', 'non', 'odit', 'tempore', 'quaerat', 'dignissimos',
      'facilis', 'neque', 'nihil', 'expedita', 'vitae', 'vero', 'ipsum',
      'nisi', 'animi', 'cumque', 'pariatur', 'velit', 'modi', 'natus'
    ]
    paragraph = []
    word_count.times do |i|
      paragraph << words[rand(words.length-1)]
    end
    paragraph.join(' ')
  end
end
RSpec.configuration.include UniversalHelperMethods