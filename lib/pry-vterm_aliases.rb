require "pry-vterm_aliases/version"
require "pry"

unless ::RbConfig::CONFIG["host_os"] =~ /mswin|mingw32/
  class Pry
    module VTermAliases
      class << self
        def create_aliases
          aliases.each do |a, c|
            create_alias(
              a, c
            )
          end
        end

        def create_alias(als, desc = nil)
          Pry::Commands.create_command(cmd_regexp(als), listing: ".#{als}") do
            description "alias to: #{Pry::Helpers::Text.bold(desc)}." if desc
            group "Terminal Aliases"

            def process(cmd, extra)
              Pry::VTermAliases.run_alias(
                cmd, extra, output
              )
            end
          end
        end

        def aliases
          @aliases ||= if shell.nil? || shell.empty?
            then {}
            else find_aliases
          end
        end

        def shell
          @shell ||= ENV["SHELL"].split("/").last
        end

        def run_alias(cmd, extra, output)
          raise ArgumentError, "unknown alias" unless (cmd = aliases[cmd])
          output.puts(`#{cmd}#{" " + extra if extra}`)
          $?.success?
        end

        private
        def strip_wrapping_quotes(str)
          str =~ /\A'(.*)'\Z/ ? $1 : str
        end

        private
        def cmd_regexp(str)
          /\A\.(?:(#{Regexp.escape(str)})(?:\Z|\s+(.*)))/
        end

        private
        def find_aliases
          `#{shell} -ic 'alias'`.split(/\n/).inject({}) do |h, a|
            if a =~ /\Aalias\s+/
              a = a.sub(/\Aalias\s/, "").split("=")
              unless a.first =~ /\s/
                strip_wrapping_quotes(a.shift).tap do |k|
                  h.update(
                    k => Shellwords.shellwords(a.join("=")).join
                  )
                end
              end
            end

            h
          end
        end
      end

      # Better way?!?!
      module ObjectExt
        def capture_vterm_alias(als, extra = nil, out = StringIO.new)
          Pry::VTermAliases.run_alias(als.gsub(/\A\./, ""), extra, out)
          if !out.is_a?(StringIO)
            then out else out.string
          end
        end
      end
    end
  end

  Pry::VTermAliases.create_aliases
  Object.send(:include, Pry::VTermAliases::ObjectExt)
end
