#!/usr/bin/perl
#Made better on 7/13/15 by John Coty Embry
#/Applications/Safari.app/Contents/MacOS/Safari
#/tmp/
$i = 0;
$flag = 0;
$firstargument[$i] = shift;
if($firstargument[$i] eq "-c") {
	system"ps -ef | grep /Safari.app/ > /tmp/tmpsafari.txt";
	open TMP, "/tmp/tmpsafari.txt" or die "Cannot open tmpsafari.txt: $!";
	while(<TMP>) { #this is going to check if Safari is already running
		if($_ =~ m$Applications/Safari.app/$g) { 
			$flag = 1;
		}
	}
	close TMP;
	$size = scalar @ARGV;
	for($j=0; $j < $size; $j++) {
		$firstargument[$i] = shift @ARGV;
		$i++;
	}
	#now get the array into the clipboard...
	open TEMP, "> tempsafari.txt" or die "Cannot open tempsafari.txt: $!";
	print(TEMP "@firstargument");
	close TEMP;
	system"cat tempsafari.txt | pbcopy";
	system"/usr/bin/open -a '/Applications/Safari.app'";
	sleep(2); #this is to give the application enough time to become the front application since I have looked up how to search for a particular PSN
	if($flag) { #(PSN means Process Serial Number)
		system"/usr/bin/open -a '/Applications/CustomScripts/Command_T'";
		system"/usr/bin/open -a '/Applications/CustomScripts/Paste'";
		system"/usr/bin/open -a '/Applications/CustomScripts/Return'";
	}
	else {
		system"/usr/bin/open -a '/Applications/CustomScripts/Paste'";
		system"/usr/bin/open -a '/Applications/CustomScripts/Return'";		
	}
}
elsif(defined $firstargument[$i]) {
	if ($firstargument[$i] =~ m/\.com/g) {
		system"/usr/bin/open -a '/Applications/Safari.app' https://$firstargument[$i]";
	}
	elsif($firstargument[$i] =~ m/blackboard/g) {
		system"/usr/bin/open -a '/Applications/Safari.app' https://blackboard.ecok.edu";		
	}
	else {
		system"/usr/bin/open -a '/Applications/Safari.app' https://${firstargument[$i]}.com";
	}
}
else {
		system"/usr/bin/open -a '/Applications/Safari.app'";
}
