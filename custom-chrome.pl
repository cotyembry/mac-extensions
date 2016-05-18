#!/usr/bin/perl
$firstargument = shift;
if($firstargument eq "-c") {
	$firstargument = shift;
	system"/usr/bin/open -a '/Applications/Google Chrome.app' $firstargument";
}
elsif(defined $firstargument) {
	if ($firstargument =~ m/\.com/g) {
		system"/usr/bin/open -a '/Applications/Google Chrome.app' https://$firstargument";
	}
	elsif($firstargument =~ m/blackboard/g) {
		system"/usr/bin/open -a '/Applications/Google Chrome.app' https://blackboard.ecok.edu";		
	}
	else {
		system"/usr/bin/open -a '/Applications/Google Chrome.app' https://${firstargument}.com";
	}
}
else {
		system"/usr/bin/open -a '/Applications/Google Chrome.app'";
}
