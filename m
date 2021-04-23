Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C545FC433ED
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 13:22:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 760D461452
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 13:22:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhDWNWo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Apr 2021 09:22:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbhDWNWl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Apr 2021 09:22:41 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D795C061574;
        Fri, 23 Apr 2021 06:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=tpTBKNV5/izxL1k5IlHIzvsRqg3svyXWJhuDCpXyO+A=; b=MHQet0QejLNMAzlp2D84sdDlE7
        z8qe6n1GFkCB/BkNAYLvOt0ujj5k2q82CxRvH1HHwkRVSdTwGJD3uHa4Lt0tiB+mRGBHqQbPx8bW9
        ZNRJxDU7mhF4xnEi5x3I+KV3s9Mr0E0piUmhIs+p6kzLRFpctHSgp9etgpFHI9XP090GBkHciinEw
        FBX61IUTaDPEG307xfYRyg1uYVY41AP0wjIelDatlxEVOOCn6V3TdpL6ei6r9TLkxQgPHcLz9Hlh4
        6PwP2aXWA/DTWTEK/zgquxOOan2HQNRD1sOoGm6hhQIjBOJ3PcCc3KmCw85PYI0WWH0/slyrxhcXE
        esCUXA9w==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lZvkD-001tIH-3X; Fri, 23 Apr 2021 13:21:27 +0000
Date:   Fri, 23 Apr 2021 14:21:17 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Aditya Srivastava <yashsri421@gmail.com>
Cc:     corbet@lwn.net, lukas.bulwahn@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] scripts: kernel-doc: reduce repeated regex expressions
 into variables
Message-ID: <20210423132117.GB235567@casper.infradead.org>
References: <20210422191839.6119-1-yashsri421@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210422191839.6119-1-yashsri421@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 23, 2021 at 12:48:39AM +0530, Aditya Srivastava wrote:
> +my $pointer_function = qr{([^\(]*\(\*)\s*\)\s*\(([^\)]*)\)};

Is that a pointer-to-function?  Or as people who write C usually call it,
a function pointer?  Wouldn't it be better to call it $function_pointer?

> @@ -1210,8 +1211,14 @@ sub dump_struct($$) {
>      my $decl_type;
>      my $members;
>      my $type = qr{struct|union};
> +    my $packed = qr{__packed};
> +    my $aligned = qr{__aligned};
> +    my $cacheline_aligned_in_smp = qr{____cacheline_aligned_in_smp};
> +    my $cacheline_aligned = qr{____cacheline_aligned};

I don't think those four definitions actually simplify anything.

> +    my $attribute = qr{__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)}i;

... whereas this one definitely does.

> -	$members =~ s/\s*__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)/ /gi;
> -	$members =~ s/\s*__aligned\s*\([^;]*\)/ /gos;
> -	$members =~ s/\s*__packed\s*/ /gos;
> +	$members =~ s/\s*$attribute/ /gi;
> +	$members =~ s/\s*$aligned\s*\([^;]*\)/ /gos;

Maybe put the \s*\([^;]*\) into $aligned?  Then it becomes a useful
abstraction.

> -    } elsif ($prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\(]*)\)/ ||
> -	$prototype =~ m/^()([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+)\s+([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+\s*\*+)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/ ||
> -	$prototype =~ m/^(\w+\s+\w+\s*\*+\s*\w+\s*\*+\s*)\s*([a-zA-Z0-9_~:]+)\s*\(([^\{]*)\)/)  {
> +    } elsif ($prototype =~ m/^()($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^(\w+)\s+($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^(\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^(\w+\s+\w+)\s+($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end1/ ||
> +	$prototype =~ m/^()($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+)\s+($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+)\s+($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s+\w+\s+\w+\s*\*+)\s*($name)\s*$prototype_end2/ ||
> +	$prototype =~ m/^(\w+\s+\w+\s*\*+\s*\w+\s*\*+\s*)\s*($name)\s*$prototype_end2/)  {

This is probably the best patch I've seen so far this year.

Now, can we go further?  For example:
	$prototype_end = $prototype_end1|$prototype_end2
That would let us cut the number of lines here in half.

Can we create a definition for a variable number of \w and \s and '*'
in the return type?  In fact, can we define a regex that matches a type?
So this would become:

> +    } elsif ($prototype =~ m/^($type)\s*($name)\s*$prototype_end/) {

