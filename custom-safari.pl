#!/usr/bin/perl
#Author: John Coty Embry 6/21/15 This will work with sbt to create a new file after giving the filename as an argument
$firstargument = shift;
$match = 0;
system"ls > /Applications/CustomScripts/customsbt.txt";
open TEMP, "/Applications/CustomScripts/customsbt.txt" or die "Cannot open customsbt.txt: $!";
if(defined $firstargument) {
	while(<TEMP>) {
		if($_ =~ m/$firstargument/g) {
			$match = 1;
		}
	}
}
close TEMP;
system"rm /Applications/CustomScripts/customsbt.txt";	
if($match) {
	system"/usr/bin/open -a '/Applications/Sublime Text.app/' $firstargument";
}
else { #create the file
	if(defined $firstargument) {
		open NEWFILE, ">> $firstargument";
		close NEWFILE;
		system"/usr/bin/open -a '/Applications/Sublime Text.app/' $firstargument";
	}
	else {
		system"/usr/bin/open -a '/Applications/Sublime Text.app/'";	
	}
}
