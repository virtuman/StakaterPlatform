.ONESHELL:
SHELL= /bin/bash

CLOUD_PROVIDER ?= aws
STAKATER_PLATFORM_SSH_GIT_URL =? STAKATER_PLATFORM_SSH_GIT_URL
STAKATER_PLATFORM_BRANCH =? STAKATER_PLATFORM_BRANCH
DOMAIN =? DOMAIN
BASE64_ENCODED_AWS_ACCESS_KEY_ID =? BASE64_ENCODED_AWS_ACCESS_KEY_ID
BASE64_ENCODED_AWS_SECRET_ACCESS_KEY =? BASE64_ENCODED_AWS_SECRET_ACCESS_KEY
BASE64_ENCODED_IMC_CONFIG =? BASE64_ENCODED_IMC_CONFIG
BASE64_ENCODED_JENKINS_CFG =? BASE64_ENCODED_JENKINS_CFG
KEYCLOAK_CLIENT_ID =? KEYCLOAK_CLIENT_ID
KEYCLOAK_CLIENT_SECRET =? KEYCLOAK_CLIENT_SECRET
BASE64_ENCODED_HUB_TOKEN =? BASE64_ENCODED_HUB_TOKEN
BASE64_ENCODED_GITLAB_TOKEN =? BASE64_ENCODED_GITLAB_TOKEN
BASE64_ENCODED_BITBUCKET_TOKEN =? BASE64_ENCODED_BITBUCKET_TOKEN
BASE64_ENCODED_NEXUS_ADMIN_ACCOUNT_JSON ?=  eyJuYW1lIjogInVzZXItYWRtaW4iLCJ0eXBlIjogImdyb292eSIsImNvbnRlbnQiOiAic2VjdXJpdHkuYWRkVXNlcigndXNlci1hZG1pbicsICdTdGFja2F0b3InLCAnQWRtaW4nLCAndXNlckBnbWFpbC5jb20nLCB0cnVlLCAnc3Rha2F0ZXJAcXdlcnR5Nzg2JywgWydueC1hZG1pbiddKSJ9
BASE64_ENCODED_NEXUS_CLUSTER_ACCOUNT_JSON ?= eyJuYW1lIjogImNsdXN0ZXItYWRtaW4iLCJ0eXBlIjogImdyb292eSIsImNvbnRlbnQiOiAic2VjdXJpdHkuYWRkUm9sZSgnY2x1c3RlcicsICdjbHVzdGVyJywgJ1VzZXIgd2l0aCBwcml2aWxlZ2VzIHRvIGFsbG93IHJlYWQgYWNjZXNzIHRvIHJlcG8gY29udGVudCBhbmQgaGVhbHRjaGVjaycsIFsnbngtaGVhbHRoY2hlY2stcmVhZCcsJ254LXJlcG9zaXRvcnktdmlldy1kb2NrZXItc3RhY2thdG9yLWRvY2tlci1icm93c2UnLCdueC1yZXBvc2l0b3J5LXZpZXctZG9ja2VyLXN0YWNrYXRvci1kb2NrZXItcmVhZCcsJ254LXNlYXJjaC1yZWFkJ10sICBbJ254LWFub255bW91cyddKTsgc2VjdXJpdHkuYWRkVXNlcignY2x1c3Rlci1hZG1pbicsICdDbHVzdGVyJywgJ0NsdXN0ZXInLCAndXNlckBnbWFpbC5jb20nLCB0cnVlLCAnc3Rha2F0ZXJAcXdlcnR5Nzg2JywgWydjbHVzdGVyJ10pIn0=
NEXUS_ADMIN_ACCOUNT_USERNAME ?= user-admin
NEXUS_CLUSTER_ACCOUNT_USERNAME ?=  cluster-admin
BASE64_ENCODED_ALERTMANAGER_CONFIG =? BASE64_ENCODED_ALERTMANAGER_CONFIG
BASE64_ENCODED_KEYCLOAK_CONFIG =? BASE64_ENCODED_KEYCLOAK_CONFIG
BASE64_ENCODED_PROXYINJECTOR_CONFIG =? BASE64_ENCODED_PROXYINJECTOR_CONFIG
BASE64_ENCODED_SLACK_CHANNEL =? BASE64_ENCODED_SLACK_CHANNEL
BASE64_ENCODED_SLACK_WEBHOOK_URL =? BASE64_ENCODED_SLACK_WEBHOOK_URL

ARGS := $(STAKATER_PLATFORM_SSH_GIT_URL) $(STAKATER_PLATFORM_BRANCH) $(DOMAIN) $(BASE64_ENCODED_AWS_ACCESS_KEY_ID) $(BASE64_ENCODED_AWS_SECRET_ACCESS_KEY) $(BASE64_ENCODED_IMC_CONFIG) $(BASE64_ENCODED_JENKINS_CFG) $(KEYCLOAK_CLIENT_ID) $(KEYCLOAK_CLIENT_SECRET) $(BASE64_ENCODED_HUB_TOKEN) $(BASE64_ENCODED_GITLAB_TOKEN) $(BASE64_ENCODED_BITBUCKET_TOKEN) $(BASE64_ENCODED_ADMIN_ACCOUNT_JSON) $(BASE64_ENCODED_CLUSTER_ACCOUNT_JSON) $(NEXUS_ADMIN_ACCOUNT_USERNAME) $(NEXUS_CLUSTER_ACCOUNT_USERNAME) $(BASE64_ENCODED_ALERTMANAGER_CONFIG) $(BASE64_ENCODED_KEYCLOAK_CONFIG) $(BASE64_ENCODED_PROXYINJECTOR_CONFIG) $(BASE64_ENCODED_SLACK_CHANNEL) $(BASE64_ENCODED_SLACK_WEBHOOK_URL)

setupvars:
	bash setupvars.sh $(ARGS)
	kubectl apply -f storageclass/$(CLOUD_PROVIDER).yaml

deploy:
	bash install.sh

destroy:
	bash destroy.sh

.PHONY: setupvars deploy destroy