FROM mozilla/sops:v3-alpine

LABEL version="1.0.0"
LABEL name="empowerly-helm-secrets-action"
LABEL repository="https://github.com/synocate/empowerly-helm-secrets-action"
LABEL homepage="https://github.com/synocate/empowerly-helm-secrets-action"

LABEL maintainer="Denimar de Moraes <denimar@empowerly.com>"
LABEL com.github.actions.name="Kubectl, Helm, Helm Secrets"
LABEL com.github.actions.description="Kubectl + Helm + Helm Secrets"
LABEL com.github.actions.icon="terminal"
LABEL com.github.actions.color="blue"

RUN apk add git curl

RUN wget https://get.helm.sh/helm-v3.6.2-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm 
RUN chmod +x /usr/local/bin/helm

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]