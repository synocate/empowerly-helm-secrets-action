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

# RUN apk add py-pip curl wget ca-certificates git bash jq gcc alpine-sdk
# RUN pip install 'awscli==1.19.112'

# RUN curl -o /usr/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
# RUN chmod +x /usr/bin/aws-iam-authenticator

RUN wget https://get.helm.sh/helm-v3.6.2-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm 
RUN chmod +x /usr/local/bin/helm

COPY LICENSE README.md /
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]