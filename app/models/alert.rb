#
# author: fernandoguillen.info
# date: 04/05/2008
#

#  t.column :address,    :string,   :null => false, :limit => 255
#  t.column :radius,     :integer,  :null => false
#  t.column :text,       :text,     :null => false
#  t.column :status,     :sting,    :null => false, :limit => 20
#  t.column :created_at, :datetime, :null => false
#  t.column :updated_at, :datetime, :null => false
#  t.column :user_id,    :integer,  :null => false

class Alert < ActiveRecord::Base
  #
  # constants
  #
  STATUS_ACTIVE             = 'active'
  STATUS_NOT_ACTIVE         = 'not active'
  
  
  #
  # relations
  #
  has_many    :deliveries,
              :order => 'deliveries.date DESC'
  
  belongs_to  :user
  
  
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
