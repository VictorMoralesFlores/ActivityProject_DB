CREATE USER 'activity_user'@'%' IDENTIFIED BY 'Password';
GRANT CREATE, SELECT, INSERT, DELETE ON  naat_users. * TO 'activity_user'@'%';
FLUSH PRIVILEGES;