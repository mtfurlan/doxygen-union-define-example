.DEFAULT_GOAL := man

.PHONY: help
help:   ## Show this help
	@awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36;1m[target]\033[0m\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36;1m%-10s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)


.PHONY: clean-docs
clean-docs:
	rm -rf docs
.PHONY: docs

docs: clean-docs
	doxygen Doxyfile

.PHONY: man
man: docs
	for file in docs/xml/*8h.xml; do \
		doxy2man -o docs/man/man3 $$file &  \
	done; \
	wait

