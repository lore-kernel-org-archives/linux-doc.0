Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E2B5B7E653
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Mar 2018 19:29:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752440AbeCET3k (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Mar 2018 14:29:40 -0500
Received: from smtprelay0217.hostedemail.com ([216.40.44.217]:44833 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751490AbeCET3j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Mar 2018 14:29:39 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 5080D181D341E;
        Mon,  5 Mar 2018 19:29:38 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: fifth01_199b7b6968e3a
X-Filterd-Recvd-Size: 4905
Received: from XPS-9350 (226.25.168.109.dsl.static.ip.kpnqwest.it [109.168.25.226])
        (Authenticated sender: joe@perches.com)
        by omf10.hostedemail.com (Postfix) with ESMTPA;
        Mon,  5 Mar 2018 19:29:35 +0000 (UTC)
Message-ID: <1520278173.25605.16.camel@perches.com>
Subject: Re: [PATCH 1/2] checkpatch: add check for tag Co-Developed-by
From:   Joe Perches <joe@perches.com>
To:     "Tobin C. Harding" <me@tobin.cc>,
        Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Date:   Mon, 05 Mar 2018 11:29:33 -0800
In-Reply-To: <1520222301-11874-2-git-send-email-me@tobin.cc>
References: <1520222301-11874-1-git-send-email-me@tobin.cc>
         <1520222301-11874-2-git-send-email-me@tobin.cc>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2018-03-05 at 14:58 +1100, Tobin C. Harding wrote:
> From: Joe Perches <joe@perches.com>

I still think this "Co-Developed-by" stuff is unnecessary.

> Recently signature tag Co-Developed-by was added to the
> kernel (Documentation/process/5.Posting.rst). checkpatch.pl doesn't know
> about it yet. All prior tags used all lowercase characters except for first
> character. Checks for this format had to be re-worked to allow for the
> new tag.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Tobin C. Harding <me@tobin.cc>
> ---
>  scripts/checkpatch.pl | 58 +++++++++++++++++++++++++++++++--------------------
>  1 file changed, 35 insertions(+), 23 deletions(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 3d4040322ae1..fbe2ae2d035f 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -461,16 +461,18 @@ our $logFunctions = qr{(?x:
>  	seq_vprintf|seq_printf|seq_puts
>  )};
>  
> -our $signature_tags = qr{(?xi:
> -	Signed-off-by:|
> -	Acked-by:|
> -	Tested-by:|
> -	Reviewed-by:|
> -	Reported-by:|
> -	Suggested-by:|
> -	To:|
> -	Cc:
> -)};
> +our @valid_signatures = (
> +	"Signed-off-by:",
> +	"Acked-by:",
> +	"Tested-by:",
> +	"Reviewed-by:",
> +	"Reported-by:",
> +	"Suggested-by:",
> +	"Co-Developed-by:",
> +	"To:",
> +	"Cc:"
> +);
> +my $signature_tags = "(?x:" . join('|', @valid_signatures) . ")";
>  
>  our @typeListMisordered = (
>  	qr{char\s+(?:un)?signed},
> @@ -2193,6 +2195,17 @@ sub pos_last_openparen {
>  	return length(expand_tabs(substr($line, 0, $last_openparen))) + 1;
>  }
>  
> +sub get_preferred_sign_off {
> +	my ($sign_off) = @_;
> +
> +	foreach my $sig (@valid_signatures) {
> +		if (lc($sign_off) eq lc($sig)) {
> +			return $sig;
> +		}
> +	}
> +	return "";
> +}
> +
>  sub process {
>  	my $filename = shift;
>  
> @@ -2499,35 +2512,34 @@ sub process {
>  			my $sign_off = $2;
>  			my $space_after = $3;
>  			my $email = $4;
> -			my $ucfirst_sign_off = ucfirst(lc($sign_off));
> +			my $preferred_sign_off = ucfirst(lc($sign_off));
>  
> -			if ($sign_off !~ /$signature_tags/) {
> +			if ($sign_off !~ /$signature_tags/i) {
>  				WARN("BAD_SIGN_OFF",
>  				     "Non-standard signature: $sign_off\n" . $herecurr);
> -			}
> -			if (defined $space_before && $space_before ne "") {
> +			} elsif ($sign_off !~ /$signature_tags/) {
> +				$preferred_sign_off = get_preferred_sign_off($sign_off);
>  				if (WARN("BAD_SIGN_OFF",
> -					 "Do not use whitespace before $ucfirst_sign_off\n" . $herecurr) &&
> +					 "'$preferred_sign_off' is the preferred signature form\n" . $herecurr) &&
>  				    $fix) {
> -					$fixed[$fixlinenr] =
> -					    "$ucfirst_sign_off $email";
> +					$fixed[$fixlinenr] = "$preferred_sign_off $email";
>  				}
>  			}
> -			if ($sign_off =~ /-by:$/i && $sign_off ne $ucfirst_sign_off) {
> +			if (defined $space_before && $space_before ne "") {
>  				if (WARN("BAD_SIGN_OFF",
> -					 "'$ucfirst_sign_off' is the preferred signature form\n" . $herecurr) &&
> +					 "Do not use whitespace before $preferred_sign_off\n" . $herecurr) &&
>  				    $fix) {
>  					$fixed[$fixlinenr] =
> -					    "$ucfirst_sign_off $email";
> +					    "$preferred_sign_off $email";
>  				}
> -
>  			}
> +
>  			if (!defined $space_after || $space_after ne " ") {
>  				if (WARN("BAD_SIGN_OFF",
> -					 "Use a single space after $ucfirst_sign_off\n" . $herecurr) &&
> +					 "Use a single space after $preferred_sign_off\n" . $herecurr) &&
>  				    $fix) {
>  					$fixed[$fixlinenr] =
> -					    "$ucfirst_sign_off $email";
> +					    "$preferred_sign_off $email";
>  				}
>  			}
>  
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
