#chapter1_2, this is for transform between different scaling forms.
use strict;
use warnings;

package scale_transform;

#transform
sub scal
 {
 	 my $val=shift;
 	 my $ori=shift;
 	 my $target=shift;
 	 
   #transform to decimal first
   my @tr_val;
   my $resi;
   $resi=oct($val) if($ori==1);
   $resi=oct($val) if($ori==2);
   $resi=$val if($ori==3);
   $resi=hex($val) if($ori==4);
   
   #initial factors.
   my $factor=1;
   $factor=2 if ($target==1);
   $factor=8 if ($target==2);
   $factor=10 if ($target==3);
   $factor=16 if ($target==4);
   
   #transform to the target scale
   my $flag=1;
   while($flag)
    {
    	 #store the last value
      push @tr_val,$resi%$factor;#last site; 	
    	
    	 #store the resi
    	 $resi=int($resi/$factor);
   
      $flag=0 if(!$resi);
    }
   my @rtr_val=reverse @tr_val;
   
   shift @rtr_val if($rtr_val[0]<1);
   my $re_val;
   
   $re_val=join ("","0x",@rtr_val) if($target==4);
   $re_val=join ("",@rtr_val) if($target==3);
   $re_val=join ("","0",@rtr_val) if($target==2);
   $re_val=join ("","0b",@rtr_val) if($target==1);
   
   
   print "original:\t$val\n";
   print "target:\t",$re_val,"\n";
 }

1;