function ssm {
    readonly environment=${1:?"The environment must be specified."}
    readonly service=${2:?"The service must be specified."}
    local profile="${environment}-admin"
    aws-sso-login "$profile"
    AWS_PROFILE=$environment-admin gousto env connect $environment $service
}

function container {
    readonly environment=${1:?"The environment must be specified."}
    readonly container=${2:?"The container must be specified"}
    readonly service=${3:?"The service must be specified."}
    AWS_PROFILE=$environment-admin gousto env exec $environment $container $service
}

function tunnel {
    readonly environment=${1:?"The environment must be specified."}
    readonly port=${2:-3310}
    local host_option=()

    local profile="${environment}-admin"
    aws-sso-login "$profile"

    # Check if a host is provided and format it correctly
    if [[ -n $3 ]]; then
        host_option=(--host "$3")
    fi

    AWS_PROFILE=$environment-admin gousto env connect-tunnel "$environment" -l "$port" "${host_option[@]}"
}

function aws-sso-login() {
  local profile="$1"
  if [[ -z "$profile" ]]; then
    echo "aws-sso-login: ERROR — no profile provided" >&2
    return 1
  fi

  if aws sts get-caller-identity --profile "$profile" &> /dev/null; then
    echo "→ AWS SSO session already active for profile '${profile}'."
  else
    echo "→ AWS SSO login for profile '${profile}'..."
    aws sso login --profile "$profile"
  fi
}

alias goustorc="vim ~/.dotfiles/include/gousto.sh && source ~/.profile"

alias npml="aws sso login --profile EngineerCodeArtifact-472493421475 && export CODEARTIFACT_AUTH_TOKEN=`aws codeartifact get-authorization-token --domain gousto --domain-owner 472493421475 --query authorizationToken --output text --profile EngineerCodeArtifact-472493421475` && aws codeartifact login --tool npm --repository proxy-repository --domain gousto --domain-owner 472493421475 --profile EngineerCodeArtifact-472493421475"

alias gousto-colima-start="colima start --memory 8 --mount \$HOME:w --mount /etc/ssl/certs"

export CLOUDFLARE_CA_CERT_ALL=~/.gousto-certs/gousto-cloudflare-cert-all.pem
export NODE_EXTRA_CA_CERTS=~/.gousto-certs/gousto-cloudflare-cert.pem

export AWS_CA_BUNDLE="${CLOUDFLARE_CA_CERT_ALL}"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

alias rds-prod-tunnel="AWS_PROFILE=GoustoProduction-EngineerProd gousto env connect-tunnel production -h rds-production-platform-transactional.gousto.co.uk"
