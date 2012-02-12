if defined? Pry::Plugins::VTerm
  class Pry::Plugins::VTerm
    class << self
      command = 'bash'
      if ENV['SHELL'] =~ %r!/zsh\Z!
        command = 'zsh'
      end

      @@aliases = `#{command} -i -c 'alias'`.each_line.to_a.map(&:chomp).delete_if { |line| line !~ /=/ }.inject({}) do |hash, cmd|
        cmd = Shellwords.shellwords(cmd.gsub(/\Aalias\s{1}/, '')).join
        cmd = cmd.split('=')
        cmd[1] = cmd[1..-1].join('=')

        # Just double check...
        unless cmd[0] =~ /\s/
          hash.update({cmd[0] => cmd[1]})
        end
      end
    end
  end
end