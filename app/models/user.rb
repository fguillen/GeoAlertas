#
# author: fernandoguillen.info
# date: 2008.05.12
#


# t.column :phone,               :string,   :null => false, :limit => 9
# t.column :password_localizame, :string,   :null => false, :limit => 40
# t.column :password_sms,        :string,   :null => false, :limit => 40
# t.column :email,               :string,   :null => false, :limit => 128
# t.column :password,            :string,   :null => false, :limit => 40
# t.column :created_at,          :datetime, :null => false
# t.column :updated_at,          :datetime, :null => false
# t.column :role,                :string,   :null => false, :limit => 20

class User < ActiveRecord::Base
  #
  # constants
  #
  ROLE_USER             = 'user'
  ROLE_ADMIN            = 'admin'
  
  
  #
  # relations
  #
  has_many    :alerts,
              :order => 'alerts.updated_at DESC'

  # belongs_to  :user
  
  
  #
  # validations
  #
  # validates_presence_of :title,                 :message => _('falta el título')
  
  
  #
  # attr_protections
  #
  # attr_protected :user_id, :nicetitle, :created_at, :updated_at
  
  
  #
  # call_backs
  #
  # before_save   :initialize_nicetitle
  # after_save    :update_parent_counters
  
  
end
