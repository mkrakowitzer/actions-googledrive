#!/bin/sh

set -eu

cat <<EOF >> $HOME/.skicka.config
[google]
    ;Override the default application client id used by skicka.
        clientid=$GOOGLE_CLIENT_ID
        clientsecret=$GOOGLE_CLIENT_SECRET
EOF

echo $SKICKA_TOKENCACHE_JSON > $HOME/.skicka.tokencache.json

skicka -no-browser-auth upload -ignore-times "$UPLOAD_FROM" "$UPLOAD_TO"
if [ $? -ne 0 ]; then
  echo skicka failed
  exit 1
fi

# Remove outdated
if [ $REMOVE_OUTDATED == "true" ]; then
    skicka -verbose download -ignore-times "$UPLOAD_TO" "$UPLOAD_FROM" 2>&1 | \
        sed "/Downloaded and wrote/!d" | \
        sed -E "s/.*bytes to //" | \
        xargs -I{} skicka rm "$UPLOAD_FROM{}" || true
elif [ $REMOVE_OUTDATED != "false" ]; then
    echo '$REMOVE_OUTDATED must be "true" or "false".'
    exit 1
fi
