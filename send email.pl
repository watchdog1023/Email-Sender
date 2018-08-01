use MIME::Lite;

if($ARGV[0] == "SendEmail")
{
    $to = $ARGV[1];
    $cc = " ";
    $from = $ARGV[2];
    $subject = $ARGV[3];
    $message = $ARGV[4];
    $msg = MIME::Lite->new(From => $from,To => $to,Cc => $cc,Subject => $subject,Data => $message);
    $msg->send;
    print "Email Sent Successfully\n";
}
if($ARGV[0] == "SendEmailAtt")
{
    $to = $ARGV[1];
    $cc = " ";
    $from = $ARGV[2];
    $subject = $ARGV[3];
    $message = $ARGV[4];
    $msg = MIME::Lite->new(From => $from,To => $to,Cc => $cc,Subject => $subject,Type => 'multipart/mixed');
    # Add your text message.
    $msg->attach(Type => 'text',Data => $message);
    # Specify your file as attachement.
    $msg->attach(Type => 'image/gif',Path => '/tmp/logo.gif',Filename => 'logo.gif',Disposition => 'attachment');
    $msg->send;
    print "Email Sent Successfully\n";
}
else
{
    print "No Email Type found";
}