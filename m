Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A48C4338F
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 19:30:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4778560FD8
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 19:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234287AbhHXTbB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Aug 2021 15:31:01 -0400
Received: from ms.lwn.net ([45.79.88.28]:59102 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229913AbhHXTbA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Aug 2021 15:31:00 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4EC4E304D;
        Tue, 24 Aug 2021 19:30:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4EC4E304D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1629833416; bh=302hykrJPlbudXypeTpGvT/hwe8cMycs0rZBJAHOBkA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=RBKMOTGW44XDwGl9YtvKuEaSru5nPz+x8XN8LJCZ3NeL4/WCve4UcuSVQq5BG8LXn
         58ehWRR6NRbm5sDgytwDvnSO8ETSBfj+Hh+K5LbZNyy3URuOBnWSnTk+t6EHgY7GxL
         CLMg3hibH2zajcoes8WJL47grnS15Pl0xpgY2cY9QDdHCuwyt0dKvyUkr51hWmABkQ
         xbBzpCpfLbUYK+q0r/mzIkQw+r37dSHvu3GJDHzaUXmnwXfTsscl/hm9xwSSFpIOY6
         rHuWyGBTA9EmXetppgOTBhQLGG70W2d1p+si7h+FbsEA0q4oLsuve1j7yz89/Gfta4
         TQFX3254CQFCg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jinay Jain <jinaybjain@gmail.com>
Cc:     trivial@kernel.org, linux-doc@vger.kernel.org,
        Jinay Jain <jinaybjain@gmail.com>
Subject: Re: [PATCH] Documentation: block: blk-mq: Fix small typo in
 multi-queue docs
In-Reply-To: <20210812152528.300668-1-jinaybjain@gmail.com>
References: <20210812152528.300668-1-jinaybjain@gmail.com>
Date:   Tue, 24 Aug 2021 13:30:15 -0600
Message-ID: <871r6imyig.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jinay Jain <jinaybjain@gmail.com> writes:

> Fixed a small typo in the documentation for multi-queue block IO.
>
> Signed-off-by: Jinay Jain <jinaybjain@gmail.com>
> ---
>  Documentation/block/blk-mq.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/block/blk-mq.rst b/Documentation/block/blk-mq.rst
> index d96118c73954..31f52f326971 100644
> --- a/Documentation/block/blk-mq.rst
> +++ b/Documentation/block/blk-mq.rst
> @@ -54,7 +54,7 @@ layer or if we want to try to merge requests. In both cases, requests will be
>  sent to the software queue.
>  
>  Then, after the requests are processed by software queues, they will be placed
> -at the hardware queue, a second stage queue were the hardware has direct access
> +at the hardware queue, a second stage queue where the hardware has direct access
>  to process those requests. However, if the hardware does not have enough

Applied, thanks.

jon
