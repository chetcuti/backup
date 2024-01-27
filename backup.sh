#!/bin/bash

BACKUP_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# include config file or exit and give an error if it doesn't exist
if [[ -f "$BACKUP_SCRIPT_DIR/backup.config" ]]
then
    . $BACKUP_SCRIPT_DIR/backup.config
else
    echo 'backup.config is missing';
    exit;
fi

# include backup.pre if it exists
if [[ -f "$MAIN_BACKUP_FOLDER/backup.pre" ]]
then
    . $MAIN_BACKUP_FOLDER/backup.pre
fi

$RESTIC_FULL_COMMAND

# include backup.post if it exists
if [[ -f "$MAIN_BACKUP_FOLDER/backup.post" ]]
then
    . $MAIN_BACKUP_FOLDER/backup.post
fi
