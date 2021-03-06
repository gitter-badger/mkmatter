require 'thor'
require 'highline'
require 'mkmatter/cli/methods'
require 'mkmatter/cli/tags'
module Mkmatter
  module App
    module Classes
      class Tags < Thor
        include Thor::Actions
        HILINE = HighLine.new($stdin, $stderr, 80)
    
        desc 'find [options] TYPE', 'find content of type TYPE'
        # @param [String] type Type of content
        def find(type)
          if Mkmatter::Methods.check_if_jekyll
            table                      = Terminal::Table.new
            table.title                = 'Tags'
            table.style.all_separators = true
            table.headings             = ["#{HILINE.color('Path from Jekyll Root', :bold)}", "#{HILINE.color('Tags', :bold)}"]
        
            front_matter = Mkmatter::Methods.find_front_matter(type, 'tags')
            front_matter.each do |path, tags|
              path = path.gsub(/#{Mkmatter::Methods.get_jekyll_root}(\/.*)/, '\1')
              table.add_row([path, "#{tags.join("\n")}"])
            end
            table.align_column(1, :right)
            puts table
          else
            $stderr.puts "#{HILINE.color('Error', :red, :bold)}: Not a Jekyll source directory (no '_config.yml' found in any parent directory)"
          end
        end
        desc 'new [options] TAG', 'create a new tag'
        # @param [String] tag Tag Name
        def new_tag(tag)
          if Mkmatter::Methods.check_if_jekyll
      
          else
            $stderr.puts "#{HILINE.color('Error', :red, :bold)}: Not a Jekyll source directory (no '_config.yml' found in any parent directory)"
          end
        end
        desc 'gen [options]', 'generate tag files'
        option(:'tag-index', type: :string, default: nil, desc: "configures whether generation of tag files will give them a layout file for a tag index, if you don't want generation to give layouts, omit --tag-index", aliases: %w(-i))
        def gen # only used for posts
          if Mkmatter::Tags.has_tag_folder?
            front_matter = Mkmatter::Methods.find_front_matter('post', 'tags')
            tags         = []
            front_matter.each do |key, value|
              tags << value
            end
            all_tags = tags.flatten.sort.uniq
            all_tags
          else
            $stderr.puts "#{HILINE.color('Error', :red, :bold)}: Not a Jekyll source directory (no '_config.yml' found in any parent directory)"
          end
        end
      end
    end
  end
end