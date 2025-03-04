#!/bin/sh
set -e

echo "Activating feature 'pulumi'"

echo "The provided Pulumi Version is: $PULUMIVERSION"

PULUMI_HOME=$_REMOTE_USER_HOME

echo "The effective dev container remoteUser is '$_REMOTE_USER'"
echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

echo "The effective dev container containerUser is '$_CONTAINER_USER'"
echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

echo "PULUMI_HOME is '$PULUMI_HOME'"

echo "Installing dependencies..."
apt-get update -y --no-install-recommends
apt-get install curl -y

echo "Installing Pulumi..."

if [[ -z "${PULUMIVERSION}"]]; then
    curl -fsSL https://get.pulumi.com | sh -s -- --install-root $_REMOTE_USER_HOME

else
    curl -fsSL https://get.pulumi.com | sh -s -- --install-root $_REMOTE_USER_HOME --version $PULUMIVERSION 
fi

echo "Pulumi Installed..."