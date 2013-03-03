require "pry-vterm_aliases/version"
require "pry"

unless ::RbConfig::CONFIG["host_os"] =~ /mswin|mingw32/
  class Pry
    module VTermAliases
      class << self
        def create_aliases
          aliases.each { |als, cmd| create_alias(als, cmd) }
        end

        def create_alias(als, desc = nil)
          Pry::Commands.create_command(cmd_regexp(als), listing: ".#{als}") do
            description("alias to: #{Pry::Helpers::Text.bold(desc)}.") if desc
            group("Terminal Aliases")

            def process(cmd, extra)
              Pry::VTermAliases.run_command(cmd, extra, output)
            end
          end
        end

        def aliases
          @aliases ||=
            if shell.nil? || shell.empty?
              {}
            else
              `#{shell} -ic 'alias'`.split(/\n/).inject({}) do |hash, (als)|
                als = als.sub(/^alias\s/, "").split("=")
                unless als.first =~ /\s/
                  strip_wrapping_quotes(als.shift).tap do |key|
                    hash.update(
                      key => Shellwords.shellwords(als.join("=")).join)
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
          output.puts(`#{cmd}#{" " + extra if extra}`)
          $?.success?
        end

        private
        def strip_wrapping_quotes(str)
          ((str =~ /^'(.*)'$/) ? ($1) : (str))
        end

        private
        def cmd_regexp(str)
          /^\.(?:(#{Regexp.escape(str)})(?:$|\s+(.*)))/
        end
      end

      # Better way?!?!
      module ObjectExt
        private
        def capture_vterm_alias(als, extra = nil, out = StringIO.new)
          Pry::VTermAliases.run_command(als.gsub(/^\./, ""), extra, out)
          StringIO === out ? out.string : out
        end
      end
    end
  end

  Pry::VTermAliases.create_aliases
  Object.send(:include, Pry::VTermAliases::ObjectExt)
end
