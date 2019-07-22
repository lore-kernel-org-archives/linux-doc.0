Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9BE5E7D90F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Jul 2019 17:30:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbfGVRac (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Jul 2019 13:30:32 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44036 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbfGVRab (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jul 2019 13:30:31 -0400
Received: by mail-pg1-f195.google.com with SMTP id i18so17988536pgl.11
        for <linux-doc@vger.kernel.org>; Mon, 22 Jul 2019 10:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wXvZqJm4NRH55ymNoRmcH6T+rFOJHy1EWdglu59DZzY=;
        b=LCaK/ME6Pd4ZhYx+ssvjkI9LB4O8oKSTekE0qoXW/GXXeDZdeImiGm1G894m1tuQ5d
         j4jm59UYARqR7BwdBJeMNi+wW6IACeBrIAZyYnIzB+Bf2TP6zdV6+XmQUQGC2cqW1qfz
         jp0pdd7QqJVQsL6Ga8AetHkGJfJcF/qfZrMBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wXvZqJm4NRH55ymNoRmcH6T+rFOJHy1EWdglu59DZzY=;
        b=IBm+zlizX5EGR2sQHRuREJhCXDd0g8U49faLzHsiJwiayDAk0oAqRo1Zota3ZtjY7+
         CSrKLQCMQRQoJ+m0lUT7+hD7szydb9wchcEMpisjEOeOKD1pSIPXSFNv5K2wEO1wlQqU
         cUoINypX4tJza0biEb5ACcip+BKVlxs3Sjn9ixVWEl//FTCoI8HgnQpBdJAvHGdaBcl/
         yTXNq2Lt5RZaqxCChx/aL8u6iR1O1z2Y78TNm2MfKCFRz17PKhaXPqR5lxc5lqMaKHyV
         VzMJpsPup8xOSQlpESItb0Pfj9PeHBFpNTZB7ibugBNcU2fuG9IG8hzcJhAyZ3bhIytm
         rK/w==
X-Gm-Message-State: APjAAAWw7K0OABiylZbJsu9YFaN75hG9EljLZ8q/I7uSoQ81ldqxKFOB
        lsgWleOrXE0A9JC99VLFiSwAWT+R2tQ=
X-Google-Smtp-Source: APXvYqwvLDHbYqo3arQbkK9RgZ93pgCYAX5DtW/EanFgFv84dn/XaNI+Z5j0/Jy0lEh1/UjJkqM4/w==
X-Received: by 2002:a63:e807:: with SMTP id s7mr70363111pgh.194.1563816630836;
        Mon, 22 Jul 2019 10:30:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a3sm42773143pfi.63.2019.07.22.10.30.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 10:30:30 -0700 (PDT)
Date:   Mon, 22 Jul 2019 10:30:29 -0700
From:   Kees Cook <keescook@chromium.org>
To:     NitinGote <nitin.r.gote@intel.com>
Cc:     joe@perches.com, corbet@lwn.net, akpm@linux-foundation.org,
        apw@canonical.com, linux-doc@vger.kernel.org,
        kernel-hardening@lists.openwall.com
Subject: Re: [PATCH v5] Documentation/checkpatch: Prefer strscpy/strscpy_pad
 over strcpy/strlcpy/strncpy
Message-ID: <201907221029.B0CBED4F@keescook>
References: <20190717043005.19627-1-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190717043005.19627-1-nitin.r.gote@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 17, 2019 at 10:00:05AM +0530, NitinGote wrote:
> From: Nitin Gote <nitin.r.gote@intel.com>
> 
> Added check in checkpatch.pl to
> 1. Deprecate strcpy() in favor of strscpy().
> 2. Deprecate strlcpy() in favor of strscpy().
> 3. Deprecate strncpy() in favor of strscpy() or strscpy_pad().
> 
> Updated strncpy() section in Documentation/process/deprecated.rst
> to cover strscpy_pad() case.
> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

Joe, does this address your checkpatch concerns?

-Kees

> ---
>  Documentation/process/deprecated.rst |  6 +++---
>  scripts/checkpatch.pl                | 24 ++++++++++++++++++++++++
>  2 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index 49e0f64a3427..c348ef9d44f5 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -93,9 +93,9 @@ will be NUL terminated. This can lead to various linear read overflows
>  and other misbehavior due to the missing termination. It also NUL-pads the
>  destination buffer if the source contents are shorter than the destination
>  buffer size, which may be a needless performance penalty for callers using
> -only NUL-terminated strings. The safe replacement is :c:func:`strscpy`.
> -(Users of :c:func:`strscpy` still needing NUL-padding will need an
> -explicit :c:func:`memset` added.)
> +only NUL-terminated strings. In this case, the safe replacement is
> +strscpy(). If, however, the destination buffer still needs NUL-padding,
> +the safe replacement is strscpy_pad().
> 
>  If a caller is using non-NUL-terminated strings, :c:func:`strncpy()` can
>  still be used, but destinations should be marked with the `__nonstring
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index bb28b178d929..1bb12127115d 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -605,6 +605,20 @@ foreach my $entry (keys %deprecated_apis) {
>  }
>  $deprecated_apis_search = "(?:${deprecated_apis_search})";
> 
> +our %deprecated_string_apis = (
> +        "strcpy"				=> "strscpy",
> +        "strlcpy"				=> "strscpy",
> +        "strncpy"				=> "strscpy, strscpy_pad or for non-NUL-terminated strings, strncpy() can still be used, but destinations should be marked with __nonstring",
> +);
> +
> +#Create a search pattern for all these strings apis to speed up a loop below
> +our $deprecated_string_apis_search = "";
> +foreach my $entry (keys %deprecated_string_apis) {
> +        $deprecated_string_apis_search .= '|' if ($deprecated_string_apis_search ne "");
> +        $deprecated_string_apis_search .= $entry;
> +}
> +$deprecated_string_apis_search = "(?:${deprecated_string_apis_search})";
> +
>  our $mode_perms_world_writable = qr{
>  	S_IWUGO		|
>  	S_IWOTH		|
> @@ -6446,6 +6460,16 @@ sub process {
>  			     "Deprecated use of '$deprecated_api', prefer '$new_api' instead\n" . $herecurr);
>  		}
> 
> +# check for string deprecated apis
> +		if ($line =~ /\b($deprecated_string_apis_search)\b\s*\(/) {
> +			my $deprecated_string_api = $1;
> +			my $new_api = $deprecated_string_apis{$deprecated_string_api};
> +			my $msg_level = \&WARN;
> +			$msg_level = \&CHK if ($file);
> +			&{$msg_level}("DEPRECATED_API",
> +				      "Deprecated use of '$deprecated_string_api', prefer '$new_api' instead\n" . $herecurr);
> +		}
> +
>  # check for various structs that are normally const (ops, kgdb, device_tree)
>  # and avoid what seem like struct definitions 'struct foo {'
>  		if ($line !~ /\bconst\b/ &&
> --
> 2.17.1
> 

-- 
Kees Cook
