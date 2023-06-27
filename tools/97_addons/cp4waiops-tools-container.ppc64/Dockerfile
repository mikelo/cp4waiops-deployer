FROM ppc64le/ubuntu:22.10

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
  openssh-server \
  ansible \
  kafkacat \
  python3-pip \
  npm \
  jq \
  curl \
  nano \
  unzip \
  && rm -rf /var/lib/apt/lists/*

# Install Openshift Client
RUN wget https://mirror.openshift.com/pub/openshift-v4/ppc64le/clients/ocp/4.11.0/openshift-client-linux.tar.gz && tar xfvz openshift-client-linux.tar.gz && mv oc /usr/local/bin && mv kubectl /usr/local/bin/ && rm openshift-client-linux.tar.gz


# Init SSH
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh/ && echo $SSH_KEY > /root/.ssh/authorized_keys && touch /root/.ssh/authorized_keys && chmod 600 /root/.ssh/authorized_keys

# Install cloudctl
RUN curl -L https://github.com/IBM/cloud-pak-cli/releases/download/v3.23.4/cloudctl-linux-ppc64le.tar.gz -o cloudctl-linux-ppc64le.tar.gz && tar xfvz cloudctl-linux-ppc64le.tar.gz && mv cloudctl-linux-ppc64le /usr/local/bin/cloudctl && rm cloudctl-linux-ppc64le.tar.gz


# Install stuff
# RUN ansible-galaxy collection install community.kubernetes:2.0.1
#ansible-galaxy collection install community.kubernetes
RUN npm install elasticdump -g
RUN pip install slack-cleaner2


# Install k9s
RUN wget https://github.com/derailed/k9s/releases/download/v0.27.4/k9s_Linux_ppc64le.tar.gz && tar xfzv k9s_Linux_ppc64le.tar.gz k9s && mv k9s /usr/local/bin && rm k9s_Linux_ppc64le.tar.gz



COPY startup.sh /cp4waiops/startup.sh
RUN chmod +x /cp4waiops/startup.sh

ENTRYPOINT /cp4waiops/startup.sh
