require 'rouge'

# Get some CSS
Rouge::Themes::Base16.mode(:light).render(scope: '.highlight')
# Or use Theme#find with string input
Rouge::Theme.find('base16.light').render(scope: '.highlight')
