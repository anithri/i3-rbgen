module I3
  module Blocks
    class WatchGit
    end
  end
end
#!/usr/bin/env ruby
require 'pathname'
# M => + is actually delta from greek alphabet
WATCH_PATH = Pathname(ENV["WATCH_GIT_REPO_FILE"] || "#{ENV['HOME']}/.watch_git_repo")
trans      = {'M' => :modified, 'D' => :deleted, 'A' => :added, '?' => :untracked,
              '??' => :untracked, 'AM' => :added}

summary =  trans.values.reduce(Hash.new(0)){|hash,val| hash[val] = 0; hash}
repo_name, repo_path = File.read(WATCH_PATH).split
summary[:name] = repo_name

    base_cmd = "git status --porcelain"
raw      = ''

Dir.chdir(repo_path) do
  raw = `#{base_cmd}`
end

raw.split(/\n/).group_by { |e| e.split.first }.each_pair do |char, arr|
  next unless trans.has_key?(char) # we don't care about any status we don't track
  summary[trans[char]] += arr.count
end
default_format = '%{name} +%{added} ~%{modified} ?%{untracked} -%{deleted}'

format_param = ''

maybe_arg = ARGV[0] && ARGV[0].downcase.intern
if summary.has_key? maybe_arg
  format_param = "%{#{maybe_arg}}"
else
  format_param = ARGV[0]
end

format = format_param || default_format

puts format % summary
# vim:filetype=ruby
