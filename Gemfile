source 'http://mirror.sysu.edu.cn/rubygems/'

require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)
gem 'github-pages', versions['github-pages']

gem 'octopress', '~> 3.0.0.rc.12'
gem 'kramdown'
gem 'rouge'
gem 'wdm', '>= 0.1.0' if Gem.win_platform?
