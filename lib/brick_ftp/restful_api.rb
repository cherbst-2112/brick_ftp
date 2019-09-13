# frozen_string_literal: true

module BrickFTP
  module RESTfulAPI
    autoload :Client, 'brick_ftp/restful_api/client'
    autoload :Command, 'brick_ftp/restful_api/command'
    autoload :GetSiteUsage, 'brick_ftp/restful_api/get_site_usage'
    # ref. https://developers.files.com/#sessions
    autoload :CreateSession, 'brick_ftp/restful_api/create_session'
    autoload :DeleteSession, 'brick_ftp/restful_api/delete_session'
    # ref. https://developers.files.com/#users
    autoload :ListUsers, 'brick_ftp/restful_api/list_users'
    autoload :CountUsers, 'brick_ftp/restful_api/count_users'
    autoload :SearchUser, 'brick_ftp/restful_api/search_user'
    autoload :GetUser, 'brick_ftp/restful_api/get_user'
    autoload :CreateUser, 'brick_ftp/restful_api/create_user'
    autoload :UpdateUser, 'brick_ftp/restful_api/update_user'
    autoload :DeleteUser, 'brick_ftp/restful_api/delete_user'
    autoload :UnlockUser, 'brick_ftp/restful_api/unlock_user'
    # ref. https://developers.files.com/#api-keys
    autoload :ListCurrentUserApiKeys, 'brick_ftp/restful_api/list_current_user_api_keys'
    autoload :ListUserApiKeys, 'brick_ftp/restful_api/list_user_api_keys'
    autoload :ListSiteWideApiKeys, 'brick_ftp/restful_api/list_site_wide_api_keys'
    autoload :GetApiKey, 'brick_ftp/restful_api/get_api_key'
    autoload :CreateCurrentUserApiKey, 'brick_ftp/restful_api/create_current_user_api_key'
    autoload :CreateUserApiKey, 'brick_ftp/restful_api/create_user_api_key'
    autoload :CreateSiteWideApiKey, 'brick_ftp/restful_api/create_site_wide_api_key'
    autoload :DeleteApiKey, 'brick_ftp/restful_api/delete_api_key'
    autoload :DeleteCurrentApiKey, 'brick_ftp/restful_api/delete_current_api_key'
    autoload :UpdateCurrentApiKey, 'brick_ftp/restful_api/update_current_api_key'
    autoload :UpdateApiKey, 'brick_ftp/restful_api/update_api_key'
    # ref. https://developers.files.com/#automations
    autoload :ListAutomations, 'brick_ftp/restful_api/list_automations'
    autoload :GetAutomation, 'brick_ftp/restful_api/get_automation'
    autoload :CreateAutomation, 'brick_ftp/restful_api/create_automation'
    autoload :UpdateAutomation, 'brick_ftp/restful_api/update_automation'
    autoload :DeleteAutomation, 'brick_ftp/restful_api/delete_automation'
    # ref. https://developers.files.com/#behaviors
    autoload :ListBehaviors, 'brick_ftp/restful_api/list_behaviors'
    autoload :ListFolderBehaviors, 'brick_ftp/restful_api/list_folder_behaviors'
    autoload :GetBehavior, 'brick_ftp/restful_api/get_behavior'
    autoload :CreateBehavior, 'brick_ftp/restful_api/create_behavior'
    autoload :UpdateBehavior, 'brick_ftp/restful_api/update_behavior'
    autoload :DeleteBehavior, 'brick_ftp/restful_api/delete_behavior'
    # ref. https://developers.files.com/#bundles
    autoload :ListBundles, 'brick_ftp/restful_api/list_bundles'
    autoload :GetBundle, 'brick_ftp/restful_api/get_bundle'
    autoload :CreateBundle, 'brick_ftp/restful_api/create_bundle'
    autoload :ShareBundleByEmail, 'brick_ftp/restful_api/share_bundle_by_email'
    autoload :DeleteBundle, 'brick_ftp/restful_api/delete_bundle'
    autoload :ListBundleContents, 'brick_ftp/restful_api/list_bundle_contents'
    autoload :GetFileInBundle, 'brick_ftp/restful_api/get_file_in_bundle'
    autoload :GetBundleZip, 'brick_ftp/restful_api/get_bundle_zip'
    # ref. https://developers.files.com/#certificates
    autoload :ListCertificates, 'brick_ftp/restful_api/list_certificates'
    autoload :GetCertificate, 'brick_ftp/restful_api/get_certificate'
    autoload :CreateCertificate, 'brick_ftp/restful_api/create_certificate'
    autoload :DeactivateCertificate, 'brick_ftp/restful_api/deactivate_certificate'
    autoload :ActivateCertificate, 'brick_ftp/restful_api/activate_certificate'
    autoload :UpdateCertificate, 'brick_ftp/restful_api/update_certificate'
    autoload :DeleteCertificate, 'brick_ftp/restful_api/delete_certificate'
    # ref. https://developers.files.com/#file-and-folder-operations
    autoload :ListFolders, 'brick_ftp/restful_api/list_folders'
    autoload :CreateFolder, 'brick_ftp/restful_api/create_folder'
    autoload :CountFolderContents, 'brick_ftp/restful_api/count_folder_contents'
    autoload :GetFolderSize, 'brick_ftp/restful_api/get_folder_size'
    autoload :DownloadFile, 'brick_ftp/restful_api/download_file'
    autoload :MoveFolder, 'brick_ftp/restful_api/move_folder'
    autoload :CopyFolder, 'brick_ftp/restful_api/copy_folder'
    autoload :DeleteFolder, 'brick_ftp/restful_api/delete_folder'
    # ref. https://developers.files.com/#groups
    autoload :ListGroups, 'brick_ftp/restful_api/list_groups'
    autoload :GetGroup, 'brick_ftp/restful_api/get_group'
    autoload :CreateGroup, 'brick_ftp/restful_api/create_group'
    autoload :UpdateGroup, 'brick_ftp/restful_api/update_group'
    autoload :DeleteGroup, 'brick_ftp/restful_api/delete_group'
    autoload :CreateUserInGroup, 'brick_ftp/restful_api/create_user_in_group'
    autoload :AddGroupMember, 'brick_ftp/restful_api/add_group_member'
    autoload :UpdateGroupMember, 'brick_ftp/restful_api/update_group_member'
    autoload :RemoveGroupMember, 'brick_ftp/restful_api/remove_group_member'
    # ref. https://developers.files.com/#history
    autoload :RetrieveHistory, 'brick_ftp/restful_api/retrieve_history'
    autoload :RetrieveSiteHistory, 'brick_ftp/restful_api/retrieve_site_history'
    autoload :RetrieveLoginHistory, 'brick_ftp/restful_api/retrieve_login_history'
    autoload :RetrieveUserHistory, 'brick_ftp/restful_api/retrieve_user_history'
    autoload :RetrieveFolderHistory, 'brick_ftp/restful_api/retrieve_folder_history'
    autoload :RetrieveFileHistory, 'brick_ftp/restful_api/retrieve_file_history'
    # ref. https://developers.files.com/#locks
    autoload :ListLocks, 'brick_ftp/restful_api/list_locks'
    autoload :CreateLock, 'brick_ftp/restful_api/create_lock'
    autoload :DeleteLock, 'brick_ftp/restful_api/delete_lock'
    # ref. https://developers.files.com/#notifications
    autoload :ListNotifications, 'brick_ftp/restful_api/list_notifications'
    autoload :CreateNotification, 'brick_ftp/restful_api/create_notification'
    autoload :DeleteNotification, 'brick_ftp/restful_api/delete_notification'
    # ref. https://developers.files.com/#permissions
    autoload :ListPermissions, 'brick_ftp/restful_api/list_permissions'
    autoload :CreatePermission, 'brick_ftp/restful_api/create_permission'
    autoload :DeletePermission, 'brick_ftp/restful_api/delete_permission'
    # ref. https://developers.files.com/#user-public-keys
    autoload :ListPublicKeys, 'brick_ftp/restful_api/list_public_keys'
    autoload :GetPublicKey, 'brick_ftp/restful_api/get_public_key'
    autoload :CreatePublicKey, 'brick_ftp/restful_api/create_public_key'
    autoload :DeletePublicKey, 'brick_ftp/restful_api/delete_public_key'
    # ref. https://developers.files.com/#file-uploading
    autoload :StartUpload, 'brick_ftp/restful_api/start_upload'
    autoload :ContinueUpload, 'brick_ftp/restful_api/continue_upload'
    autoload :CompleteUpload, 'brick_ftp/restful_api/complete_upload'
    autoload :UploadFile, 'brick_ftp/restful_api/upload_file'
  end
end
