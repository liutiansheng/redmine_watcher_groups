class WatcherGroupsHookListener < Redmine::Hook::ViewListener
  def view_issues_form_details_bottom(context={})
    if context[:hook_caller].respond_to?(:render) and context[:request].parameters[:id].blank? and (context[:controller].action_name == "new" or context[:controller].action_name == "update_form")
        context[:hook_caller].send(:render, :partial => "watcher_groups/watcher_groups", :locals => context)
    elsif context[:controller].is_a?(ActionController::Base) and context[:request].parameters[:id].blank? and (context[:controller].action_name == "new" or context[:controller].action_name == "update_form")
        context[:controller].send(:render_to_string, :partial => "watcher_groups/watcher_groups", :locals => context)
    else
      ""
    end
  end
end

# vim:set ft=ruby sw=2 ts=2 :
