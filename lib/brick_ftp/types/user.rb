# frozen_string_literal: true

module BrickFTP
  module Types
    # rubocop:disable Metrics/LineLength, Layout/CommentIndentation
    User = Struct.new(
      'User',
      :id,                      # integer                  | Globally unique identifier of each user. Each user is given an ID automatically upon creation.
      :username,                # string                   | Username for the user. This is how the user will be displayed on the site. Maximum of 50 characters.
      :authentication_method,   # enum                     | Authentication method for this user. Can be one of the following: password, ldap, or oauth_google. Default is password.
      :last_login_at,           # datetime                 | The date and time of the most recent login for this user. This property is read-only.
      :authenticate_until,      # datetime                 | If set, the user will be blocked from logging in after this date.
      :name,                    # string                   | Real name of the user. For your reference. Maximum of 50 characters.
      :email,                   # string                   | E-Mail address of the user. Maximum of 50 characters.
      :notes,                   # text                     | You may use this property to store any additional information you require. There are no restrictions on its formatting.
      :group_ids,               # comma-separated integers | IDs of the Groups that this user is in.
      :ftp_permission,          # boolean                  | Allow user access via FTP/FTPS (port 21 or 990) interface. Default is true.
      :sftp_permission,         # boolean                  | Allow user access via SFTP (port 22) interface. Default is true.
      :dav_permission,          # boolean                  | Allow user access via WebDAV (port 443) interface. Default is true.
      :restapi_permission,      # boolean                  | Allow user access the REST API, via HTTP/HTTPS (port 80 or 443), and the desktop application. Default is true.
      :attachments_permission,  # boolean                  | Allow user to use Sharing tab in web interface to share files with anonymous users via a unique URL. Default is false.
      :self_managed,            # boolean                  | Allow user to change their password and user information via the web interface. Default is true.
      :require_password_change, # boolean                  | Require user to change their password at their next login.
                                #                          | Note: requires restapi_permission to be true, as password changes can only occur via the web interface. Default is false.
      :require_2fa,             # boolean                  | <undocumented>
      :allowed_ips,             # text                     | List allowed IPs, one per line. You may specify a range in CIDR format, such as 192.168.1.0/27.
                                #                          | Leave blank to allow all IPs. If you are also restricting IP addresses on the Site tab, users matching in either place will be allowed to log in.
      :user_root,               # string                   | Folder to show as the root when this user logs in via the FTP interface. Make sure this folder exists, as it will not be automatically created.
                                #                          | Does not apply to the web interface! This should not contain a leading slash, but must contain a trailing slash. Example: Users/jenny/. Limit of 250 characters.
      :time_zone,               # string                   | File modification times will be displayed in this time zone. Default is Eastern Time (US & Canada).
      :language,                # string                   | The language that BrickFTP will be displayed in, if the translation is available. Leave as default (null) to auto-detect or use the site setting.
      :ssl_required,            # enum                     | Whether or not SSL encryption is required on all connections for this user.
                                #                          | Can be one of the following: use_system_setting, always_require, or never_require. Default is use_system_setting.
      :site_admin,              # boolean                  | If set to true, this user will be treated as a site-wide administrator. Default is false.
      :password_set_at,         # datetime                 | <undocumented>
      :receive_admin_alerts,    # boolean                  | Enable this user to receive alerts sent to site administrators. This property will only be accepted/returned if site_admin is true. Default is false.
      :subscribe_to_newsletter, # boolean                  | Add this user to the BrickFTP newsletter and our mailing list for notices about product updates.
                                #                          | This property will only be accepted/returned if site_admin is true. Default is false.
      :last_protocol_cipher,    # string                   | The encryption protocol (for HTTPS or FTPS) or ciphers (for SFTP) that this user last connected with. This property is read-only.
      :lockout_expires,         # datetime                 | If the user has been locked out by Brute Force Login Protection, this will indicate when the lock expires.
                                #                          | Otherwise this will be null. This property is read-only.
      :admin_group_ids,         # comma-separated integers | IDs of the Groups that this user is an administrator of.
      keyword_init: true
    )
    # rubocop:enable Metrics/LineLength, Layout/CommentIndentation
  end
end
