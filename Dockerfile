FROM httpd:alpine

RUN sed -ri \
    -e 's/Options Indexes FollowSymLinks/Options FollowSymLinks/' \
    -e 's/ServerTokens OS/ServerTokens Prod/' \
    -e 's/ServerSignature On/ServerSignature Off/' \
    -e '/^Alias\s\/icons/s/^/#/' \
    -e '/^Alias\s\/error/s/^/#/' \
    -e '/^ScriptAlias\s\/cgi-bin/s/^/#/' \
    -e '/<Directory "\/var\/www\/icons">/,/<\/Directory>/s/^/#/' \
    -e '/<Directory "\/var\/www\/cgi-bin">/,/<\/Directory>/s/^/#/' \
    -e '/<Directory "\/var\/www\/error">/,/<\/Directory>/s/^/#/' \
    "/usr/local/apache2/conf/httpd.conf"

