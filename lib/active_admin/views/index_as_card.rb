module ActiveAdmin
    module Views
      class IndexAsCard < ActiveAdmin::Component
        
        def build(page_presenter, collection)
          @page_presenter = page_presenter
          @collection = collection
          add_class "index"
          build_content
        end

  
        def self.index_name
          "照片"
        end

        protected 

        def build_content 
          resource_selection_toggle_panel if active_admin_config.batch_actions.any?
          @collection.each do |group|
            build_card(group)
          end
        end

        def build_card(group)
          div class: "card" do
            div class: "card-img", style: "background-image:url(#{group.image.url})" do
              div class: "supplier" do 
                group.supplier.name 
              end
              div class: "name" do 
                group.name 
              end
              div class: "overlay" do
                div class: "overlay-content" do
                  # link_to number_to_currency(group.price*3.14, precision: 0), resource_path(group)
                  link_to number_to_currency(group.price, precision: 0), resource_path(group)
                end
              end
            end
            # div class: "card-content" do
            #   h2 group.supplier.name
            #   h3 group.name
            # end
          end
        end
      end
    end
  end