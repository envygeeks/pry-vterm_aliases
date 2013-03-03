[![build status](https://travis-ci.org/envygeeks/pry-vterm_aliases.png)](https://travis-ci.org/envygeeks/pry-vterm_aliases/) [![Code Climate](https://codeclimate.com/github/envygeeks/pry-vterm_aliases.png)](https://codeclimate.com/github/envygeeks/pry-vterm_aliases)

Enable your ZSH and Bash aliases inside of Pry.

## Examples:
```ruby
> .ll
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name1
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name2
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name3
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name4
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name5



> .ll |grep 2
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name2



> capture = capture_vterm_alias(".ll")
> out.puts capture
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name1
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name2
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name3
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name4
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name5



> capture = capture_vterm_alias(".ll", "|grep 2")
> out.puts capture
-rw-r-r-- 1 jordon jordon 2197 Dec 17 03:30 file_name2
```
