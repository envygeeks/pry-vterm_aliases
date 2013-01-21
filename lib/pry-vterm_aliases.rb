require "pry-vterm_aliases/version"
require "pry"

unless ::RbConfig::CONFIG["host_os"] =~ /mswin|mingw32/
  class Pry
    module VTermAliases
      class << self
        def create_aliases
          aliases.each { |k, v|
            Pry::Commands.create_command(cmd_regexp(k), listing: ".#{k}") {
              description "alias to: #{Pry::Helpers::Text.bold(v)}."
              group "Terminal Aliases"

              def process(cmd, extra)
                Pry::VTermAliases.run_command(cmd, extra, output)
              end
            }
          }
        end

        def aliases
          @aliases ||=
            if shell.nil? || shell.empty?
              {}
            else
              `#{shell} -i -c 'alias'`.split(/\n/).inject({}) { |h, (a)|
                a = a.sub(/^alias\s/, "").split("=")
                unless a.first =~ /\s/
                  strip_wrapping_quotes(a.shift).tap do |key|
                    h.update(key => Shellwords.shellwords(a.join("=")).join)
                  end
                end
              h
              }
          end
        end

        def shell
          @shell ||= ENV["SHELL"].split("/").last
        end

        def run_command(cmd, extra, output)
          raise ArgumentError, "unknown alias" unless (cmd = aliases[cmd])

          unless extra.nil? || extra.empty?
            extra = " " + extra.sub(/^\s+/, "")
          end

          output.puts(`#{cmd}#{extra}`)
          $?.success?
        end

        private
        def strip_wrapping_quotes(str)
          ((str =~ /'(.*)'/) ? ($1) : (str))
        end

        private
        def cmd_regexp(str)
          /^\.(?:(#{Regexp.escape(str)})(?:$|\s+(.*)))/
        end
      end

      # Better way?!?!
      module ObjectExt
        private
        def capture_vterm_alias(alius, extra = nil, out = StringIO.new)
          Pry::VTermAliases.run_command(alius.gsub(/^\./, ""), extra, out)
          StringIO === out ? out.string : out
        end
      end
    end
  end

  ::Pry::VTermAliases.create_aliases
  ::Object.send(:include, Pry::VTermAliases::ObjectExt)
end
