Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D58C4338F
	for <linux-doc@archiver.kernel.org>; Fri, 20 Aug 2021 17:17:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2A24611AD
	for <linux-doc@archiver.kernel.org>; Fri, 20 Aug 2021 17:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbhHTRSN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Aug 2021 13:18:13 -0400
Received: from ms.lwn.net ([45.79.88.28]:36508 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232460AbhHTRSM (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 20 Aug 2021 13:18:12 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 9E8AF5ED0;
        Fri, 20 Aug 2021 17:17:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9E8AF5ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1629479854; bh=Y3LRHMBOx4EfnbSvJscaQWctmXzRQBWppOEpiEFNqKw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=iSWyy5o7/syqdcoUybuNdBUNuR7F/wWAgw4t4EGLOLL/w/nl2X1SURREPtww++D0O
         VlJ9CiPjXGL/mJ3Rl/VHGDpeBXZl1BDQI6DTOMoVFHErP3wB3lMczkvY8U2vzzzHQ3
         Vt7irFQD8Wq/lUuyWoxHzgdYyWhYUDQjJ3OAR8UiOHHSZD7URvxTcToT1B6Db22z4B
         rFfcXi0NDEqSOkvGC33pif8pX0ACaSHwn06Ss5cuoPx/LNEuyITFp5VDhQItsbSIZn
         tijL67q3PQsUJLSvX364j1fmbjQeg+w8oEhffXy6dznlljKTDxmcXV7Jam8g8lAqvz
         GgXpuEgUqrW0Q==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Chun-Hung Tseng <henrybear327@gmail.com>
Cc:     jmseyas@dit.upm.es, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, henrybear327@gmail.com
Subject: Re: [PATCH v2] Documentation: Update details of The Linux Kernel
 Module Programming Guide
In-Reply-To: <20210819031407.17044-1-henrybear327@gmail.com>
References: <20210819031407.17044-1-henrybear327@gmail.com>
Date:   Fri, 20 Aug 2021 11:17:34 -0600
Message-ID: <877dggrq6p.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Chun-Hung Tseng <henrybear327@gmail.com> writes:

> Recently, the content and examples of the book "The Linux Kernel Module
> Programming Guide" are being actively maintained and added on Github[1].
> Currently, the book is being regularly built into webpage and pdf
> file using Github static page[2].
>
> [1]: https://github.com/sysprog21/lkmpg
> [2]: https://sysprog21.github.io/lkmpg/
>
> Signed-off-by: Chun-Hung Tseng <henrybear327@gmail.com>
> ---
>  Documentation/process/kernel-docs.rst | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/process/kernel-docs.rst b/Documentation/process/kernel-docs.rst
> index 22d9ace5df2a..631a3dc04e3e 100644
> --- a/Documentation/process/kernel-docs.rst
> +++ b/Documentation/process/kernel-docs.rst
> @@ -126,15 +126,17 @@ On-line docs
>          describes how to write user-mode utilities for communicating with
>          Card Services.
>  
> -    * Title: **Linux Kernel Module Programming Guide**
> +    * Title: **The Linux Kernel Module Programming Guide**
>  
> -      :Author: Ori Pomerantz.
> -      :URL: https://tldp.org/LDP/lkmpg/2.6/html/index.html
> -      :Date: 2001
> +      :Author: Peter Jay Salzman, Michael Burian, Ori Pomerantz, Bob Mottram,
> +      Jim Huang.
> +      :URL: https://sysprog21.github.io/lkmpg/
> +      :Date: 2021
>        :Keywords: modules, GPL book, /proc, ioctls, system calls,
>          interrupt handlers .
> -      :Description: Very nice 92 pages GPL book on the topic of modules
> -        programming. Lots of examples.
> +      :Description: A very nice 93 pages GPL book on the topic of modules
> +        programming. Lots of examples. Currently the new version is being
> +        actively maintained at https://github.com/sysprog21/lkmpg.

If this book is now being consistently maintained, then the number of
pages is sure to change in short order; it seems like kind of a strange
thing to track here...?

Thanks,

jon
