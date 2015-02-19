#! /usr/bin/perl
use 5.20.0;
use strict;
use warnings;
use experimental 'signatures';
use utf8;
use open qw( :std :utf8 );
use XML::Tag::html5;

my $pos = {qw( class step data-x 0 data-y 0  )};

sub trans  (%v) { map { $$pos{"data-$_"} += $v{$_} } keys %v; () }
sub set    (%v) { map { $$pos{"data-$_"}  = $v{$_} } keys %v; () }
sub xy     ($v) { x => $v, y => $v }

sub hide { +{%$pos, class => "hide step"} }
sub fa ($i, $size='') { qq(<i class="fa fa-$i$size"></i>) }
sub thumbs ($how, $size='') { fa "thumbs-$how" }

say html { +{lang => "en"},

    head {
        title {"haha"}
    },

    body {
        div { +{qw( id impress )}, 

            div { hide, p{"back to CGI days"}
                , img "slide1.svg"
            },

            div { hide,
                ( list 'parse %ENV'
                , 'read data from *STDIN'
                , 'write in *STDOUT' ),
                (thumbs 'up')
            },    

            div { hide
                , p{"evolve"}
                , img "slide1.svg"
            },

            div { hide
                , p{"different strategies"}
                , img "slide2.svg"
            },

            div { hide,
                ( list 'guess the engine'
                , 'write code for each engine')
                , (thumbs 'up')
                , "choose one"
                , (thumbs 'down')
                , "simplicity lost"
            },  

            div { hide, p{"evolve"}
                , img "slide2.svg"
            },


            div { hide, p{"Plack"}
                , img "slide3.svg"
            },

        },

        , (import_js  'impress.js')
        , (map  import_css, qw(
            impress-demo.css
            theme.css
            //maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css
        ))
        , "<script>impress().init()</script>"
    }
}

