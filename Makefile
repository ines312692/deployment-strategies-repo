# Simple Makefile to work with Kustomize overlays and basic project tasks

# Tools (override if needed)
KUSTOMIZE ?= kustomize
KUBECTL ?= kubectl

# Directories
K8S_DIR := k8s
OVERLAYS := $(K8S_DIR)/overlays

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  test                 - Run Node.js tests"
	@echo "  render-all           - Render all manifests via root kustomization"
	@echo "  kustomize-dev        - Render dev overlay"
	@echo "  kustomize-staging    - Render staging overlay"
	@echo "  kustomize-prod       - Render prod overlay"
	@echo "  deploy-dev           - Apply dev overlay to current kube-context"
	@echo "  deploy-staging       - Apply staging overlay to current kube-context"
	@echo "  deploy-prod          - Apply prod overlay to current kube-context"

.PHONY: test
test:
	cd app && npm ci && npm test

.PHONY: render-all
render-all:
	$(KUSTOMIZE) build .

.PHONY: kustomize-dev kustomize-staging kustomize-prod
kustomize-dev:
	$(KUSTOMIZE) build $(OVERLAYS)/dev

kustomize-staging:
	$(KUSTOMIZE) build $(OVERLAYS)/staging

kustomize-prod:
	$(KUSTOMIZE) build $(OVERLAYS)/prod

.PHONY: deploy-dev deploy-staging deploy-prod
deploy-dev:
	$(KUBECTL) apply -k $(OVERLAYS)/dev

deploy-staging:
	$(KUBECTL) apply -k $(OVERLAYS)/staging

deploy-prod:
	$(KUBECTL) apply -k $(OVERLAYS)/prod
