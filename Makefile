REGGAE_PATH = /usr/local/share/reggae
USE = letsencrypt postgresql nginx
SERVICES = moodle https://github.com/mekanix/jail-moodle

.include <${REGGAE_PATH}/mk/use.mk>

post_setup:
.for service url in ${ALL_SERVICES}
	@echo "FQDN = ${FQDN}" >>services/${service}/project.mk
.endfor
	@echo "/usr/cbsd/jails-data/letsencrypt-data/usr/local/etc/dehydrated/certs /etc/certs nullfs rw 0 0" >services/nginx/templates/fstab
	@echo "/usr/cbsd/jails-data/moodle-data/usr/local/www/moodle /usr/local/www/moodle nullfs rw 0 0" >>services/nginx/templates/fstab

.include <${REGGAE_PATH}/mk/project.mk>
