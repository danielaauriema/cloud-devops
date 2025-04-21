.ONESHELL:
MAKEFLAGS += --no-print-directory

.PHONI: test gitea-test jenkins-test

gitea-test:
	@cd gitea/test && ./test.sh

jenkins-test:
	@cd jenkins/test && ./test.sh

test: gitea-test jenkins-test
