ActiveAdmin.register Post do
  permit_params :content, :is_shoutout, :is_antishoutout, :school_id, :user_id, :created_at, :updated_at, :approved


  index do
    selectable_column
    column :id
    column :content
    column :school_id
    column :user_id
    column :number_of_likes
    column :flagged?
    column :created_at
    column :approved
    actions
  end

  form do |f|
    f.input :school
    f.input :user
    f.input :content
    f.input :is_shoutout
    f.input :is_antishoutout
    f.input :approved
    f.actions
  end
end
