class Pry::Plugins::VTerm
  class << self
    @@aliases = `bash -i -c 'alias'`.gsub(/\Aalias\s{1}/, '').split(/\salias/).inject({}) do |bash_hash, bash_alias|
      bash_alias = bash_alias.split('=\'')
      bash_hash.update({bash_alias.first.strip => bash_alias.last.gsub(/'\Z/, '')})
    end
  end
end