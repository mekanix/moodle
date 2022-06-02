REGGAE_PATH = /usr/local/share/reggae
SERVICES = letsencrypt https://github.com/mekanix/jail-letsencrypt \
	   postgresql https://github.com/mekanix/jail-postgresql \
	   moodle https://github.com/mekanix/jail-moodle \
	   nginx https://github.com/mekanix/jail-nginx

post_setup:
.for service url in ${SERVICES}
	@echo "FQDN = ${FQDN}" >>services/${service}/project.mk
.endfor
	@echo "/usr/cbsd/jails-data/letsencrypt-data/usr/local/etc/dehydrated/certs /etc/certs nullfs rw 0 0" >services/nginx/templates/fstab
	@echo "/usr/cbsd/jails-data/moodle-data/usr/local/www/moodle /usr/local/www/moodle nullfs rw 0 0" >>services/nginx/templates/fstab

.include <${REGGAE_PATH}/mk/project.mk>
