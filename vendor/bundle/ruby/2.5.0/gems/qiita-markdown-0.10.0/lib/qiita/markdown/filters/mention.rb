module Qiita
  module Markdown
    module Filters
      # 1. Adds :mentioned_usernames into result Hash as Array of String.
      # 2. Replaces @mention with link.
      #
      # You can pass :allowed_usernames context to limit mentioned usernames.
      class Mention < HTML::Pipeline::MentionFilter
        MentionPattern = /
          (?:^|\W)
          @((?>[\w][\w-]{0,30}\w(?:@github)?))
          (?!\/)
          (?=
            \.+[ \t\W]|
            \.+$|
            [^0-9a-zA-Z_.]|
            $
          )
        /ix

        # @note Override to use customized MentionPattern and allowed_usernames logic.
        def mention_link_filter(text, _, _, _)
          text.gsub(MentionPattern) do |match|
            name = $1
            case
            when allowed_usernames && name == "all"
              result[:mentioned_usernames] |= allowed_usernames
              match.sub(
                "@#{name}",
                %[<a href="/" class="user-mention" title="#{name}">@#{name}</a>]
              )
            when allowed_usernames && !allowed_usernames.include?(name) || name == "all"
              match
            else
              result[:mentioned_usernames] |= [name]
              url = File.join(base_url, name)
              match.sub(
                "@#{name}",
                %[<a href="#{url}" class="user-mention" title="#{name}">@#{name}</a>]
              )
            end
          end
        end

        private

        def allowed_usernames
          context[:allowed_usernames]
        end

        def has_ancestor?(node, tags)
          super || node.parent.parent && node.parent.parent["class"] == "code-lang"
        end
      end
    end
  end
end
