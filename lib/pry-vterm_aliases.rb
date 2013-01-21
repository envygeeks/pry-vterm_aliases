require "pry-vterm_aliases/version"
require "pry"

unless ::RbConfig::CONFIG["host_os"] =~ /mswin|mingw32/
  class Pry
    module VTermAliases
      class << self
        def create_aliases
          aliases.each do |k, v|
            Pry::Commands.create_command(cmd_regexp(k), listing: ".#{k}") do
              description("alias to: #{Pry::Helpers::Text.bold(v)}.")
              group("Terminal Aliases")

              def process(cmd, extra)
                Pry::VTermAliases.run_command(cmd, extra, output)
              end
            end
          end
        end

        def aliases
          @aliases ||=
            if shell.nil? || shell.empty?
              {}
            else
              `#{shell} -ic 'alias'`.split(/\n/).inject({}) do |hash, (alius)|
                alius = alius.sub(/^alias\s/, "").split("=")
                unless alius.first =~ /\s/
                  strip_wrapping_quotes(alius.shift).tap do |key|
                    hash.update(
                      key => Shellwords.shellwords(alius.join("=")).join
                    )
                  end
                end
              hash
              end
          end
        end

        def shell
          @shell ||= ENV["SHELL"].split("/").last
        end

        def run_command(cmd, extra, output)
          raise ArgumentError, "unknown alias" unless (cmd = aliases[cmd])
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
          ((StringIO === out) ? (out.string) : (out))
        end
      end
    end
  end

  Pry::VTermAliases.create_aliases
  Object.send(:include, Pry::VTermAliases::ObjectExt)
end
