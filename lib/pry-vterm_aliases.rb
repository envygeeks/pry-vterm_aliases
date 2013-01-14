require "pry-vterm_aliases/version"
require "pry"

unless ::RbConfig::CONFIG["host_os"] =~ /mswin|mingw32/
  class Pry
    module VTermAliases
      class << self
        def create_aliases
          aliases.each { |k, v|
            Pry::Commands.create_command(/^\.(#{k})(.*)/, listing: ".#{k}") {
              description "alias to: #{Pry::Helpers::Text.bold(v)}."
              group "Terminal Aliases"

              def process(cmd, extra)
                Pry::VTermAliases.run_command(cmd, extra, output)
              end
            }
          }
        end

        def aliases
          @aliases ||= if term.nil? || term.empty?
            {}
          else
            `#{term} -i -c 'alias'`.split(/\n/).inject({}) { |h, (a)|
              a = a.sub(/^alias\s/, "").split("=")
              unless a.first =~ /\s/
                h.update(a.shift => Shellwords.shellwords(a.join("=")).join)
              end
            h
            }
          end
        end

        def term
          @terminal ||= ENV["SHELL"].split("/").last
        end

        def run_command(cmd, extra, output)
          raise ArgumentError, "unknown alias" unless (cmd = aliases[cmd])
          extra = " " + extra.sub(/^\s+/, "") unless extra.empty?
          output.puts(`#{cmd}#{extra}`)
          $?.success?
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
