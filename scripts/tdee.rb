#!/usr/bin/env ruby

# require 'rubygems'
require 'mechanize'

a = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari' }
pp a.class

s = DATA.to_a
p s.map(&:to_i).sum / s.size unless s.empty?

__END__
1982
2374
2303
2372
2411
2160
2156
2059
3250
2066
2270
1941
2027
1458
1893
2117
3235
2348
2400
2175
2796
2429
2305
4009
2034
2707
2149
2114
2487
