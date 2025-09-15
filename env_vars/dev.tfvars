force_password_change = true
groups = [
  {
    group_name   = "Security Admins"
    description  = "Security Administrators Group"
  }
]
security_enabled = true
group_membership = [ 
  {
    group_name   = "Security Admins"
    member_names = ["alicebob@adilnehal65gmail.onmicrosoft.com"]
  }
]