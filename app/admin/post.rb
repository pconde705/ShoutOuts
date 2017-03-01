ActiveAdmin.register Post do
  permit_params :content, :is_shoutout, :is_antishoutout, :school_id, :user_id, :created_at, :updated_at


  index do
    selectable_column
    column :id
    column :content
    column :school_id
    column :user_id
    column :number_of_likes
    column :flagged?
    column :created_at
    actions
  end

  # form do |f|
  #   f.inputs 'Details' do
  #     # f.input :school_id
  #     # f.input :user_id
  #     f.input :content
  #     f.input :is_shoutout
  #     f.input :is_antishoutout
  #     f.input :flagged?
  #     f.actions
  #   end
  # end
end
