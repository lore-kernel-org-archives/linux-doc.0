Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334A7C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 21:34:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEF0864E02
	for <linux-doc@archiver.kernel.org>; Mon, 22 Feb 2021 21:34:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230232AbhBVVe0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Feb 2021 16:34:26 -0500
Received: from ms.lwn.net ([45.79.88.28]:35046 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230063AbhBVVeY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 22 Feb 2021 16:34:24 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0FB7B2B7;
        Mon, 22 Feb 2021 21:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0FB7B2B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1614029613; bh=bL4sbefqoOVp9OCqDyDEVtsiOHFV5JJR/crNNp2k3pM=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VKmOuPKu3fJG5P5HH+PnRU/+xrc8DgTCfef6J3Gozkc/h7IU1qRRHZRQ86K3faEae
         XK02k7S+AJnH69MywGMCq5CPy91M+pW7TsNc6Wf1CWC3d+CM/uyoMaQo+hOM+nKG1q
         sLvELn44CiV5xcL04T6edwL5I2ANJ3TGAM+BpYbut3h7l+Sbk9FLBjzgw766QNH5BS
         iuXCncnezFRYMJM4BpunAwJ8cZVeqRSSoMIb3i4506nsvfSHBA65ZKs10sNmEnzHMj
         JsY2R7g7R5+RGcg+1xrqygBkSX8fR/TR3Jv8rggMpzLzwG4ULlhV1HdBQHSJaZoRvY
         PhwwVmINpkNqg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Aditya Srivastava <yashsri421@gmail.com>
Cc:     yashsri421@gmail.com, lukas.bulwahn@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC] scripts: kernel-doc: fix array element capture in
 pointer-to-func parsing
In-Reply-To: <20210217145625.14006-1-yashsri421@gmail.com>
References: <20210217145625.14006-1-yashsri421@gmail.com>
Date:   Mon, 22 Feb 2021 14:33:32 -0700
Message-ID: <878s7flrdf.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Aditya Srivastava <yashsri421@gmail.com> writes:

> Currently, kernel-doc causes an unexpected error when array element (i.e.,
> "type (*foo[bar])(args)") is present as pointer parameter in
> pointer-to-function parsing.
>
> For e.g., running kernel-doc -none on kernel/gcov/gcc_4_7.c causes this
> error:
> "Use of uninitialized value $param in regexp compilation at ...", in
> combination with:
> "warning: Function parameter or member '' not described in 'gcov_info'"

In the future, please quote error messages from the kernel verbatim.
You can trim irrelevant stuff before or after, but please do not edit
them in this way.  That helps me to understand what you are fixing, and
is also useful for anybody else who might be searching for a solution to
the same problem.

> Here, the parameter parsing does not take into account the presence of
> array element (i.e. square brackets) in $param.
>
> Provide a simple fix by adding square brackets in the regex, responsible
> for capturing $param.
>
> A quick evaluation, by running 'kernel-doc -none' on entire kernel-tree,
> reveals that no additional warning or error has been added or removed by
> the fix.
>
> Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> * Applies perfectly over next-20210217
>
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index e046e16e4411..8b5bc7bf4bb8 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1553,7 +1553,7 @@ sub create_parameterlist($$$$) {
>  	} elsif ($arg =~ m/\(.+\)\s*\(/) {
>  	    # pointer-to-function
>  	    $arg =~ tr/#/,/;
> -	    $arg =~ m/[^\(]+\(\*?\s*([\w\.]*)\s*\)/;
> +	    $arg =~ m/[^\(]+\(\*?\s*([\w\[\]\.]*)\s*\)/;
>  	    $param = $1;
>  	    $type = $arg;
>  	    $type =~ s/([^\(]+\(\*?)\s*$param/$1/;
> -- 

...meanwhile, I have applied this one, thanks.

jon
