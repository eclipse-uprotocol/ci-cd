#!/bin/bash
# ********************************************************************************
#  Copyright (c) 2025 Contributors to the Eclipse Foundation
#
#  See the NOTICE file(s) distributed with this work for additional
#  information regarding copyright ownership.
#
#  This program and the accompanying materials are made available under the
#  terms of the Apache License Version 2.0 which is available at
#  https://www.apache.org/licenses/LICENSE-2.0
#
#  SPDX-License-Identifier: Apache-2.0
# *******************************************************************************/

deps_file=${DEPS_FILE:-"DEPS.txt"}
dash_jar=${DASH_JAR:-"${HOME}/dash.jar"}
dash_summary=${DASH_SUMMARY:-"DASH_SUMMARY.txt"}
project=${PROJECT:-"automotive.uprotocol"}
token=${DASH_TOKEN:-""}

if [[ ! -r "$dash_jar" ]]; then
  echo "Eclipse Dash JAR file [${dash_jar}] not found, downloading latest version from GitHub..."
  wget_bin=$(which wget)
  if [[ -z "$wget_bin" ]]; then
    echo "wget command not available on path"
    exit 127
  else
    wget --quiet -O "$dash_jar" "https://repo.eclipse.org/service/local/artifact/maven/redirect?r=dash-licenses&g=org.eclipse.dash&a=org.eclipse.dash.licenses&v=LATEST"
  echo "successfully downloaded Eclipse Dash JAR to ${dash_jar}"
  fi
fi

args=(-jar "$dash_jar" -timeout 60 -batch 90 -summary "$dash_summary")
if [[ -n "$token" ]]; then
  args=("${args[@]}" -review -token "$token" -project "$project")
fi
args=("${args[@]}" "$deps_file")

echo "checking 3rd party licenses..."
java "${args[@]}"
