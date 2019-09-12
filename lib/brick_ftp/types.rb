# frozen_string_literal: true

module BrickFTP
  module Types
    autoload :APIKey, 'brick_ftp/types/api_key'
    autoload :Automation, 'brick_ftp/types/automation'
    autoload :Behavior, 'brick_ftp/types/behavior'
    autoload :Bundle, 'brick_ftp/types/bundle'
    autoload :BundleContent, 'brick_ftp/types/bundle_content'
    autoload :BundleZip, 'brick_ftp/types/bundle_zip'
    autoload :Certificate, 'brick_ftp/types/certificate'
    autoload :File, 'brick_ftp/types/file'
    autoload :FileInBundle, 'brick_ftp/types/file_in_bundle'
    autoload :Folder, 'brick_ftp/types/folder'
    autoload :FolderContentsCount, 'brick_ftp/types/folder_contents_count'
    autoload :Group, 'brick_ftp/types/group'
    autoload :GroupMembership, 'brick_ftp/types/group_membership'
    autoload :History, 'brick_ftp/types/history'
    autoload :Lock, 'brick_ftp/types/lock'
    autoload :Notification, 'brick_ftp/types/notification'
    autoload :Permission, 'brick_ftp/types/permission'
    autoload :PublicKey, 'brick_ftp/types/public_key'
    autoload :RemoteServer, 'brick_ftp/types/remote_server'
    autoload :Session, 'brick_ftp/types/session'
    autoload :Site, 'brick_ftp/types/site'
    autoload :SiteUsage, 'brick_ftp/types/site_usage'
    autoload :SsoStrategy, 'brick_ftp/types/sso_strategy'
    autoload :Style, 'brick_ftp/types/style'
    autoload :TwoFactorAuthenticationMethod, 'brick_ftp/types/two_factor_authentication_method'
    autoload :Upload, 'brick_ftp/types/upload'
    autoload :User, 'brick_ftp/types/user'
    autoload :UserPublicKey, 'brick_ftp/types/user_public_key'
  end
end
