Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97D17C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 25 Mar 2022 19:33:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbiCYTfB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Mar 2022 15:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229923AbiCYTe0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Mar 2022 15:34:26 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4C5D291B84
        for <linux-doc@vger.kernel.org>; Fri, 25 Mar 2022 12:24:32 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:35::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E8383383;
        Fri, 25 Mar 2022 19:24:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E8383383
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1648236272; bh=l4T1PqKbYf5z1K6Xh8+YmUpnCZYk3QpZZE3utfSI2ac=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=k/mwQ48vqNgqc5UEft8FA8kIEMsqruI+EQ2z5h5pnieQC1z01cUjFiPNuHjZC8zsq
         lnQPacPeImIJaR61wqCGKZgW0iz6hIz91LFUaskwgcgve76kJKHe/y5zFpQZQaBw/e
         +6dHqr4U31CSuixvkr0jjvyj9O+IPi9lNeDnEhzLUH8AC1eNjqlRmXVZ5JHghq3/mC
         o3YKO8i/4lVStWPM0/9KNfuNB2dXJZ/2sgRm2dsCdx/uFuu2QPll80Q+o41y/YwtlX
         l6en56uLPmD43F3Ey54n6UM90KoGicxJXqYL60NaWs62llKwgX+nLnYo32s972IUEd
         i8L76vMyP0pOg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Dylan Yudaken <dylany@fb.com>,
        Akinobu Mita <akinobu.mita@gmail.com>,
        linux-doc@vger.kernel.org
Cc:     Dylan Yudaken <dylany@fb.com>
Subject: Re: [PATCH] docs: fault-injection: fix defaults
In-Reply-To: <20220325173819.2255914-1-dylany@fb.com>
References: <20220325173819.2255914-1-dylany@fb.com>
Date:   Fri, 25 Mar 2022 13:24:31 -0600
Message-ID: <87zgldesy8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dylan Yudaken <dylany@fb.com> writes:

> ignore-gfp-wait and ignore-gfp-highmem defaults are actually true (Y) in
> both failslab and fail_page_alloc, not false as the docs suggest. See
> page_alloc.c:3762 and failslab.c:13
>
> At the same time use 'Y' instead of '1' in the example scripts just for
> consistency. (though 1 would work)
>
> Signed-off-by: Dylan Yudaken <dylany@fb.com>
> ---
>  Documentation/fault-injection/fault-injection.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/fault-injection/fault-injection.rst b/Documentation/fault-injection/fault-injection.rst
> index 4a25c5eb6f07..8b4e1ce26d01 100644
> --- a/Documentation/fault-injection/fault-injection.rst
> +++ b/Documentation/fault-injection/fault-injection.rst
> @@ -132,7 +132,7 @@ configuration of fault-injection capabilities.
>  
>  	Format: { 'Y' | 'N' }
>  
> -	default is 'N', setting it to 'Y' won't inject failures into
> +	default is 'Y', setting it to 'Y' won't inject failures into
>  	highmem/user allocations.

So the associated help text should perhaps have its sense changed too -
what happens if you set it to "N"?  The help text would be more useful,
IMO, if it read something like "set to 'N' if you want errors injected
into GFP_HIGHUSER allocations" (or whatever GFP flags actually apply
here). 

>  - /sys/kernel/debug/failslab/ignore-gfp-wait:
> @@ -140,7 +140,7 @@ configuration of fault-injection capabilities.
>  
>  	Format: { 'Y' | 'N' }
>  
> -	default is 'N', setting it to 'Y' will inject failures
> +	default is 'Y', setting it to 'Y' will inject failures
>  	only into non-sleep allocations (GFP_ATOMIC allocations).

This is a little better in general, but still would be improved by
telling the reader what they get if they change the default.

Thanks,

jon
