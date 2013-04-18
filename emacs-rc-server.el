(unless (string-equal "root" (getenv "USER"))
  (require 'server)
  (server-start))
