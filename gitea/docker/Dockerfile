FROM gitea/gitea:1.22.2

RUN mkdir -p /app && \
  curl -s https://raw.githubusercontent.com/danielaauriema/bash-tools/master/lib/bash-wait.sh > /app/bash-wait.sh

# Set Gitea admin user
ENV GITEA__ADMIN_USERNAME="gitea"
ENV GITEA__ADMIN_PASSWORD="password"
ENV GITEA__ADMIN_EMAIL="gitea@gitea.local"

# Set LDAP connection
ENV LDAP__PROTOCOL="unencrypted"
ENV LDAP__HOST="openldap"
ENV LDAP__PORT="389"
ENV LDAP__BASE_DN="dc=gitea,dc=local"
ENV LDAP__SEARCH_BASE="ou=users,${LDAP__BASE_DN}"
ENV LDAP__BIND_DN="cn=bind,${LDAP__BASE_DN}"
ENV LDAP__BIND_PASSWORD="password"

# Set Gitea variables
ENV GITEA__security__INSTALL_LOCK="true"
ENV GITEA__service__DISABLE_REGISTRATION="true"

COPY ./config.sh /app/config.sh
COPY ./entrypoint.sh /app/entrypoint
RUN chmod -R +rx /app
WORKDIR /app

ENTRYPOINT [ ]
CMD [ "/app/entrypoint" ]
