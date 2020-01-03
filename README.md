# A github action for uploading files to google drive

## Inputs

### skicka-tokencache-json
`description` 'Content of `~/.skicka.tokencache.json` created by the `skicka` command'
`required` true

### upload-from
`description` 'The path where the files to upload are located'
`default` './'
`required` false

### upload-to
`description` 'The path where the files to be uploaded is located'
`required` true

### remove-outdated
`description` 'Whether to delete files that do not exist locally'
`default` 'true'
`required` false

### google-client-id
`description` Your Google Drive API client ID
`required` true

### google-client-secret
`description` Your Google Drive API client secret
`required` true

## Example usage

```
- uses: mkrakowitzer/actions-googledrive@master
  with:
    upload-from: ./tmp
    upload-to: IRL-L2-Support/platform-architecture-docs
    skicka-tokencache-json: ${{ secrets.FOO }}
    google-client-id: ${{ secrets.BAR }}
    google-client-secret: ${{ secrets.BAZ }}
```

# Credits
Original code from https://github.com/satackey/action-google-drive
