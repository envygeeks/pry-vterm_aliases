require "pry-vterm_aliases/version"
require "pry"

unless ::RbConfig::CONFIG["host_os"] =~ /mswin|mingw32/
  class Pry
    module VTermAliases
      class << self
        def create_aliases
          aliases.each { |k, v|
            ::Pry::Commands.create_command(/^\.(#{k})(.*)/) {
              description "AKA: .#{Pry::Helpers::Text.bold(k)} - an alias for: #{Pry::Helpers::Text.bold(v)}."
              group "Terminal Aliases [pry-vterm_aliases] (#{Pry::VTermAliases::VERSION})"

              def process(cmd, extra)
                ::Pry::VTermAliases.run_command(cmd, extra, output)
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
                h.update(a.shift => ::Shellwords.shellwords(a.join("=")).join)
              end
            h
            }
          end
        end

        def term
          @terminal ||= ENV["SHELL"].split("/").last
        end

        def run_command(cmd, extra, output)
          output.puts(`#{aliases[cmd]}#{" " +
            ::Shellwords.escape(extra.sub(/^\s+/, "")) unless extra.empty?}`)
          $?.success?
        end
      end
    end
  end

  ::Pry::VTermAliases.create_aliases
end
