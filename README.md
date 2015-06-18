# Pry-Vterm_Aliases

[![Build Status](https://travis-ci.org/envygeeks/ruby-pry-vterm_aliases.png?branch=master)](https://travis-ci.org/envygeeks/ruby-pry-vterm_aliases) [![Coverage Status](https://coveralls.io/repos/envygeeks/ruby-pry-vterm_aliases/badge.png?branch=master)](https://coveralls.io/r/envygeeks/ruby-pry-vterm_aliases) [![Code Climate](https://codeclimate.com/github/envygeeks/ruby-pry-vterm_aliases.png)](https://codeclimate.com/github/envygeeks/ruby-pry-vterm_aliases) [![Dependency Status](https://gemnasium.com/envygeeks/ruby-pry-vterm_aliases.png)](https://gemnasium.com/envygeeks/ruby-pry-vterm_aliases)

Enable your ZSH and Bash aliases inside of Pry.

## Examples:
```ruby
> .ll
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name1
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name2
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name3
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name4
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name5



> .ll |grep 4
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name4



> capture = capture_vterm_alias(".ll")
> out.puts capture
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name1
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name2
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name3
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name4
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name5



> capture = capture_vterm_alias(".ll", "|grep 4")
> out.puts capture
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name4
```
