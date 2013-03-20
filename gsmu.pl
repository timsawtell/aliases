#!/usr/bin/perl
use Cwd qw();
my $pwd = Cwd::cwd();

my $gitmodulesFile= ".gitmodules";

my $init = `git submodule init`;
if ($? != 0) {
	die("couldn't init, quiting.");
}
my $update = `git submodule update`;
if ($? != 0) {
	die("couldn't update, quiting.");
}

# check for gitmodules file
if (!-e "./".$gitmodules) {
	exit(0);
}

open(gitModeulsFP, "./".$gitmodulesFile);
while (<gitModeulsFP>) {
    $line=$_;
    #find the submodule
    my $index = index($line, "path = ");
    my $startIndex = $index + 7;
    if ($index > 0) {
    	my $strLen = length $line;
    	my $path = substr $line, $startIndex, ($strLen - $index);
    	chomp($path);
    	my $fullPath = $pwd."/".$path;

        #find the branch that you were on
        my @branches = `cd \"$fullPath\"; git branch >&1`;
        my $branchName = '';
        foreach my $subLine (@branches) {
            #find the line with a *
            my $astrIndex = -1;
            $astrIndex = index($subLine, "*");
            if (-1 != $astrIndex) {
                $branchName = substr $subLine, 2, (length $branchName) - 1;
                #if the user has the submodule on no branch, switch them to master for their own good
                if ($branchName == "(no branch)") {
                    $branchName = "master";
                }
                last;
            }
        }

        if (length $branchName > 0) {
            my $command = "cd \"$fullPath\"; git checkout $branchName; git pull;";
            my $pullCmd = `$command`;
        } else {
            #update all
        	my $pullCmd = `cd "$fullPath"; git pull;`;
        }
    }
}