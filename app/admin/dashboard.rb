ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end

    columns do
        column do
            panel "Recently modified Actives" do
                table_for Active.order("updated_at desc").limit(8) do
                    column :name do |active|
                        link_to active.name, [:admin, active]
                    end
                    column :email
                    column :pledge_class
                    column :major
                end

                # Add link to view all actives
                strong { link_to "View All Actives", admin_actives_path }
            end

            panel "Recently modified Rushees" do
                table_for Rushee.order("updated_at desc").limit(8) do
                    column :name do |rushee|
                        link_to rushee.name, [:admin, rushee]
                    end
                    column :email
                    column :grade
                    column :major
                end

                # Add link to view all actives
                strong { link_to "View All Rushees", admin_rushees_path }
            end

        end

    end # content
  end
end
