ActiveAdmin.register Blog do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	permit_params :title, :description, :image, :admin_user_id, :meta_keywords, :meta_title, :meta_description
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

	index do
    selectable_column
    id_column
    column :title
    column :updated_at
    actions
  end
 
	form html: { multipart: true } do |f|
	  f.inputs "Blog Details" do
	    f.input :title
	    f.input :description
	    f.input :image, as: :file
	    f.input :meta_keywords
	    f.input :meta_title
	    f.input :meta_description
	    f.input :admin_user_id, :as => :hidden, :value => current_admin_user
	  end
	  f.actions
	end

	filter :title
	filter :description
	filter :created_at
	filter :updated_at

end
