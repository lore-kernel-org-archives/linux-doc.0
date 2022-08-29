Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B429ECAAD5
	for <linux-doc@archiver.kernel.org>; Mon, 29 Aug 2022 16:39:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiH2Qjx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Aug 2022 12:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiH2Qjw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Aug 2022 12:39:52 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0BE4BEF
        for <linux-doc@vger.kernel.org>; Mon, 29 Aug 2022 09:39:49 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id CBC764B7;
        Mon, 29 Aug 2022 16:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CBC764B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1661791189; bh=fZBqWKelIo7HUyMIz5uf4gifLndo5jfUYFayRe7Ai48=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=VAqJeKdnUutzdKIM+ZnmIURrtPoqLGcAYQ2d/IKJDGtw7GLH196039H7dDndavJAf
         R5Vlxwt0In7SGHGCE1RZxoKgkTMFFb9XG+dH9tiZcGWBd+7HbFZdU2Vx3fugSyHqJu
         qfZ5PrNmqRGMD7qWltUAr1ua5TQdZNJ9W+JK0NCwEdI+DrW1rXjoEI/T+7awbyWfJd
         ANU2zWP/JP8fEQoZSZeIsXahITu4UDRLMu1r94qHdGeQM9jMTd1brK7NegzuL63kEQ
         SYKZf7LIsQh7VA95NRmJw8VUZ7lfb/06XANj3ZbXktbbctR7dUQNRjvM2mjhU0Ufnl
         iB/RTr+9JgOrQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>,
        Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Cc:     Binbin Zhou <zhoubinbin@loongson.cn>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs/zh_CN: Update zh_CN/process/submit-checklist.rst
 to 6.0-rc2
In-Reply-To: <Ywli7VfhQVPHKiGw@bobwxc.mipc>
References: <Ywli7VfhQVPHKiGw@bobwxc.mipc>
Date:   Mon, 29 Aug 2022 10:39:48 -0600
Message-ID: <87o7w3ovfv.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <wu.xiangcheng@linux.dev> writes:

> From: Wu XiangCheng <bobwxc@email.cn>
>
> * update to commit 163ba35ff371 ("doc: use KCFLAGS instead of
>   EXTRA_CFLAGS to pass flags from command line")
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>
> One question here:
> 	Should we use `#)` to replace ordered list prefix `Number)` ?
> 	It's inconvenient to manually modify them every time. Auto
> 	generating is better.

There is clear appeal to autogeneration, but it reduces the readability
of the plain-text form slightly.

A better question, perhaps, is: do we actually need the bullet points to
be enumerated at all?  Nothing refers to those numbers, and there is no
particular ordering there.  So a better solution in this case might be
to just get rid of the numbers entirely.

Of course, this documentation file needs a bit more attention than
that...

Anyway, I've applied the patch.

Thanks,

jon
