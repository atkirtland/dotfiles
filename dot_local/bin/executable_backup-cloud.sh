#!/usr/bin/env sh

rclone sync --dry-run -P "/home/atkirtland/1/" "atkirtlandgmail:/backups/1/" --exclude="/.stversions/**" --exclude=".Radicale.cache/**" --exclude=".stfolder/"

rclone sync -P "/home/atkirtland/1/" "atkirtlandgmail:/backups/1/" --exclude="/.stversions/**" --exclude=".Radicale.cache/**" --exclude=".stfolder/"
