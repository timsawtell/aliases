#!/bin/bash
REMOTE="origin"
if [ $# -gt 0 ]
then
	REMOTE="$1"
fi

BRANCH=$(git symbolic-ref -q HEAD)
BRANCH=${BRANCH##refs/heads/}
BRANCH=${BRANCH:-HEAD}

git status > /dev/null
if [ $? -ne 0 ]
then
	echo "fatal: not a git repository"
	exit 1
fi

SKYPECHATID=`git config skype.chatid`
if [ $? -ne 0 ]
then
	echo "fatal: please add skype.chatid to your git config"
	exit 1
fi

THISDIR=${PWD##*/}

GIT=`git log --branches="*$BRANCH" --not --remotes --oneline`
if [ -n "$GIT" ]; then
   MSG="[$THISDIR] git push to $REMOTE from $BRANCH with commits:\n$GIT"
else
   MSG="[$THISDIR] git push to $REMOTE from $BRANCH with no code-changing commits."
fi
git diff --stat $REMOTE | grep pbxproj
if [ $? -eq 0 ]; then
   MSG="PROJECT CHANGING $MSG"
fi
git diff --stat $REMOTE | grep storyboard
if [ $? -eq 0 ]; then
   MSG="STORYBOARD CHANGING $MSG"
fi
git push $REMOTE $BRANCH || exit 0
COMMANDSTRING="CHATMESSAGE $SKYPECHATID $MSG"
osascript -e "tell application \"Skype\"" \
-e "send command \"$COMMANDSTRING\" script name \"Commit Script\"" \
-e "end tell"
