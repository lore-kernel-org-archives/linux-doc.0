Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 933097D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 25 Jul 2019 18:50:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfGYSu0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Jul 2019 14:50:26 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:41997 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726195AbfGYSu0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Jul 2019 14:50:26 -0400
Received: by mail-pf1-f194.google.com with SMTP id q10so23185692pff.9
        for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2019 11:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KgMBXseeuQsdqSuGEWeeA5eJNRzyR59gJRwHUubllLU=;
        b=h0hnsIDcQvjhJWJRuZyRt3d6rz/AwxMnaTk57/IR7ajs7S+RDYdbkAS/6vyiC7h8SL
         VhT1INz2v7ULdjkBv6/9w5NC3Zytn3nsGSNp3mXeqX0CdmKi49zJdVGz1bFGx5jiOLpA
         UD6wrgQBYTANPSwXX0RNScKtMlrpO9DaoU7Ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KgMBXseeuQsdqSuGEWeeA5eJNRzyR59gJRwHUubllLU=;
        b=FO29Y0L9ePvZhkNkvlBxYTevwWx8dM2EQp3oQKWYcqnzCcmPuyqfxX1myWyk4gMFxe
         MUn323DUZJVbqHnd6pwgwH2r7cluD5Itl6dyXULUBHN6mPOabUSBQShY+W/L8yz86Rx/
         XD3JzFN7jlGgWM4U9MgVM0lBhbzgvvXmvWcq1x5h5go9YTpK+puCEMJavbQRk78M1b6N
         ZumOb8x44ebphv2IZsUh576q2gMVVYmlU+robYmhOuUxivXDeFQHdmo6XMnPChSzfWav
         ZibK8H3drEJmrX7DiGAXBWY+oHrVX2qDfeOFFLPrRVljcIMAhWVWk/NltmqxUgOOjfbx
         UYdg==
X-Gm-Message-State: APjAAAXRMQ3FVYiFeUXY65s8Ays/P5Apz87XgPuW4q5J/uaFXUq5KubE
        Gn1YUCNgiLvVCRsIkLqnu/Xaag==
X-Google-Smtp-Source: APXvYqzL95DjsC7OQDsa3RI77Al5cGi9B1bsdA6VXlgvY5+0zNMkNB31JjPd7Jg+pb2t7ijCDy8Rdg==
X-Received: by 2002:a63:9dcb:: with SMTP id i194mr42191627pgd.444.1564080624943;
        Thu, 25 Jul 2019 11:50:24 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id g18sm89058171pgm.9.2019.07.25.11.50.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 11:50:24 -0700 (PDT)
Date:   Thu, 25 Jul 2019 11:50:23 -0700
From:   Kees Cook <keescook@chromium.org>
To:     NitinGote <nitin.r.gote@intel.com>
Cc:     joe@perches.com, corbet@lwn.net, akpm@linux-foundation.org,
        apw@canonical.com, linux-doc@vger.kernel.org,
        kernel-hardening@lists.openwall.com
Subject: Re: [PATCH v6] Documentation/checkpatch: Prefer stracpy over
 strcpy/strlcpy/strncpy.
Message-ID: <201907251149.B7FD8631@keescook>
References: <20190725112219.6244-1-nitin.r.gote@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725112219.6244-1-nitin.r.gote@intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 25, 2019 at 04:52:19PM +0530, NitinGote wrote:
> From: Nitin Gote <nitin.r.gote@intel.com>
> 
> Added check in checkpatch.pl to deprecate strcpy(), strlcpy() and
> strncpy() in favor of stracpy().

stracpy() is preferred when the destination is a char array (rather than
a string pointer), so that likely needs to be clarified.

-Kees

> 
> Updated Documentation/process/deprecated.rst for stracpy().
> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> ---
>  Change log:
>  v5->v6
>  - Used stracpy() instead of strscpy().
> 
>  v4->v5
>  - Change the subject line as per review comment.
>  - v5 is Reviewed-by: Kees Cook <keescook@chromium.org>
> 
>  v3->v4
>  - Removed "c:func:" from deprecated.rst as per review comment.
> 
>  v2->v3
>  - Avoided use of $check in implementation.
>  - Incorporated trivial comments.
> 
>  v1->v2
>  - For string related apis, created different %deprecated_string_api
>    and these will get emitted at CHECK Level using command line option
>    -f/--file to avoid bad patched from novice script users.
> 
>  Documentation/process/deprecated.rst | 10 +++++-----
>  scripts/checkpatch.pl                | 24 ++++++++++++++++++++++++
>  2 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> index 49e0f64a3427..709662c71a1a 100644
> --- a/Documentation/process/deprecated.rst
> +++ b/Documentation/process/deprecated.rst
> @@ -84,7 +84,7 @@ buffer. This could result in linear overflows beyond the
>  end of the buffer, leading to all kinds of misbehaviors. While
>  `CONFIG_FORTIFY_SOURCE=y` and various compiler flags help reduce the
>  risk of using this function, there is no good reason to add new uses of
> -this function. The safe replacement is :c:func:`strscpy`.
> +this function. The safe replacement is stracpy().
> 
>  strncpy() on NUL-terminated strings
>  -----------------------------------
> @@ -93,9 +93,9 @@ will be NUL terminated. This can lead to various linear read overflows
>  and other misbehavior due to the missing termination. It also NUL-pads the
>  destination buffer if the source contents are shorter than the destination
>  buffer size, which may be a needless performance penalty for callers using
> -only NUL-terminated strings. The safe replacement is :c:func:`strscpy`.
> -(Users of :c:func:`strscpy` still needing NUL-padding will need an
> -explicit :c:func:`memset` added.)
> +only NUL-terminated strings. In this case, the safe replacement is
> +stracpy(). If, however, the destination buffer still needs NUL-padding,
> +the safe replacement is stracpy_pad().
> 
>  If a caller is using non-NUL-terminated strings, :c:func:`strncpy()` can
>  still be used, but destinations should be marked with the `__nonstring
> @@ -107,7 +107,7 @@ strlcpy()
>  :c:func:`strlcpy` reads the entire source buffer first, possibly exceeding
>  the given limit of bytes to copy. This is inefficient and can lead to
>  linear read overflows if a source string is not NUL-terminated. The
> -safe replacement is :c:func:`strscpy`.
> +safe replacement is stracpy().
> 
>  Variable Length Arrays (VLAs)
>  -----------------------------
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 342c7c781ba5..dddf5adf1aac 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -605,6 +605,20 @@ foreach my $entry (keys %deprecated_apis) {
>  }
>  $deprecated_apis_search = "(?:${deprecated_apis_search})";
> 
> +our %deprecated_string_apis = (
> +	"strcpy"		=> "stracpy",
> +	"strlcpy"		=> "stracpy",
> +	"strncpy"		=> "stracpy - for non-NUL-terminated uses, strncpy dest should be __nonstring",
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
