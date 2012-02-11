class Pry::Plugins::VTerm
  class << self
  	command = 'bash'
  	if ENV['SHELL'] =~ %r!/zsh\Z!
  		command = 'zsh'
  	end

    @@aliases = `#{command} -i -c 'alias'`.gsub(/\Aalias\s{1}/, '').split(/\salias/).inject({}) do |hash, cmd|
      cmd = cmd.split('=\'')
      hash.update({cmd.first.strip => cmd.last.gsub(/'\Z/, '')})
    end
  end
end