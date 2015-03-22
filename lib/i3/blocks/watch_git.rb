require_relative 'base'
require 'git'
module I3
  module Blocks
    class WatchGit < I3::Blocks::Base

      attribute :clean_format, String, default: '<span color="green">%{name}: </span>'
      attribute :dirty_format, String, default: '%{name}: <span color="cyan">𝛥%{modified}</span> <span color="lime">+%{added}</span> <span color="red">-%{deleted}</span> <span color="yellow">?%{untracked}</span>'
      attribute :filthy_format, String, default: '<span color="red">%{name}: </span>'
      attribute :filthy_threshold, Integer, default: 8

      def status(repo_dir)
        repo           = Git.open(repo_dir)
        results        = {}
        results[:name] = repo_dir.split(/\//).last

        status = Git::Status.new(repo)
        status.each {}

        results[:added]       = status.added.length
        results[:deleted]     = status.deleted.length
        results[:modified]    = status.changed.length
        results[:untracked]   = status.untracked.length
        results[:cleanliness] = results[:added] + results[:deleted] + results[:modified] + results[:untracked]

        results
      end

      def call(repo_dir)
        build_message(full_text: format_results(status(repo_dir)))
      end

      def format_results(status)
        if status[:cleanliness] == 0
          return clean_format % status
        elsif status[:cleanliness] >= filthy_threshold
          return filthy_format % status
        else
          return dirty_format % status
        end
      end
    end
  end
end
