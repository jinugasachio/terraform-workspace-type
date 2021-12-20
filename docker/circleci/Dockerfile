ARG TF_VER=1.1.2
FROM hashicorp/terraform:${TF_VER}

ARG GLIBC_VER=2.34-r0
ARG TFCMT_VER=2.1.0
ARG TFLINT_VER=0.34.0
RUN apk update \
  && apk --no-cache add curl \
  && curl -sL https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub -o /etc/apk/keys/sgerrand.rsa.pub \
  && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-${GLIBC_VER}.apk \
  && curl -sLO https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VER}/glibc-bin-${GLIBC_VER}.apk \
  && apk add --no-cache glibc-${GLIBC_VER}.apk glibc-bin-${GLIBC_VER}.apk \
  && curl -sL https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip -o awscliv2.zip \
  && unzip awscliv2.zip \
  && aws/install \
  && curl -sL https://github.com/suzuki-shunsuke/tfcmt/releases/download/v${TFCMT_VER}/tfcmt_linux_amd64.tar.gz -o tfcmt.tar.gz \
  && tar -C /usr/local/bin -xzf ./tfcmt.tar.gz \
  && curl -sL https://github.com/terraform-linters/tflint/releases/download/v${TFLINT_VER}/tflint_linux_amd64.zip -o tflint.zip \
  && unzip tflint.zip \
  && mv tflint /usr/local/bin/tflint \
  && rm -rf \
      awscliv2.zip \
      aws \ 
      /usr/local/aws-cli/v2/current/dist/aws_completer \
      /usr/local/aws-cli/v2/current/dist/awscli/data/ac.index \
      /usr/local/aws-cli/v2/current/dist/awscli/examples \
      glibc-*.apk \
      tfcmt.tar.gz \
      /usr/local/bin/LICENSE \
      /usr/local/bin/README.md \
      tflint.zip \
  && find /usr/local/aws-cli/v2/current/dist/awscli/botocore/data -name examples-1.json -delete \
  && apk --no-cache del curl \
  && rm -rf /var/cache/apk/*

CMD ["/bin/sh"]
# ENTRYPOINT [""] 元のイメージを上書きしちゃってるので最終的には消さないといけない
