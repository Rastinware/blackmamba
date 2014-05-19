ActiveAdmin.register Personnel do
  permit_params :email, :code, :first_name, :last_name, :national_code, :father_name, :acc_no, :insurance_no, :birth_date, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :email
    column :code
    column :first_name
    column :last_name
    column :created_at
    actions
  end

  filter :email
  filter :code
  filter :first_name
  filter :last_name
  filter :national_code
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :code
      f.input :first_name
      f.input :last_name
      f.input :national_code
      f.input :father_name
      f.input :acc_no
      f.input :insurance_no
      f.input :birth_date
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  controller do
    def update_resource(object, attributes)
      update_method = attributes.first[:password].present? ? :update_attributes : :update_without_password
      object.send(update_method, *attributes)
    end
  end
    
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
