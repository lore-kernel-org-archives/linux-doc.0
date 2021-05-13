Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC105C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 15:37:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC41461439
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 15:37:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbhEMPit (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 11:38:49 -0400
Received: from ms.lwn.net ([45.79.88.28]:43200 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234933AbhEMPir (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 13 May 2021 11:38:47 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A7659153;
        Thu, 13 May 2021 15:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A7659153
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1620920253; bh=afZXGc5L4TTkDLeo8YPvvC9S8/153iwVeD6sWu3EY/Y=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ZBsXJzNsLSIFvaYSjE34IJokcuP7Oh7LWNZ/hX2kf2zePIWIooPRTMrEN2QeuSVoc
         jy0zTllTY2YOUKkqGInGkuk9D0riIIPOQLb+7QNRzBCSHxkhqiMBlQkm9q0aftLzhG
         iF3EbGMKrUzHZIYBgRHs6KaYfWDKB3UKwul8XqG7I90WLlC0RdxkvByc5a71cGqYQ2
         i2l2AikqxIUoqJGAQBUS61cj3+rpZ6nJf3vBVRLpAltDEQps2uuEnD7chuj8Xhj3vJ
         J66Q7gGBTqIEyDnzWIcIXUOARIY7LytZmENUeCnGKSP23PdY9HmDWV+pPNsRbEEKNp
         E1DA1nzWZaaEQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <bobwxc@email.cn>
Cc:     Stephen Boyd <swboyd@chromium.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] docs: kernel-hacking: Fix two ref links
In-Reply-To: <2b855d05ab1da0635b88bfb8e65cac36260fba64.1618933932.git.bobwxc@email.cn>
References: <e81dbd91c0afab466d6274ea7c27d20baea75141.1618933932.git.bobwxc@email.cn>
 <2b855d05ab1da0635b88bfb8e65cac36260fba64.1618933932.git.bobwxc@email.cn>
Date:   Thu, 13 May 2021 09:37:33 -0600
Message-ID: <87wns263wi.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <bobwxc@email.cn> writes:

> Fix a abnormal funxtion ref link in locking.rst
> Convert a path to bare path
>
> Fixes: b1735296cef9 ("docs: locking: Drop :c:func: throughout")
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
> v2:
> * No change.
>
> v1:
> <https://lore.kernel.org/linux-doc/6a15b17d46f5db190fb10afc57ea59132b33c701.1618761749.git.bobwxc@email.cn/>
>
>  Documentation/kernel-hacking/locking.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/kernel-hacking/locking.rst b/Documentation/kernel-hacking/locking.rst
> index ed1284c6f078..9bcd70aa8411 100644
> --- a/Documentation/kernel-hacking/locking.rst
> +++ b/Documentation/kernel-hacking/locking.rst
> @@ -1323,7 +1323,7 @@ from user context, and can sleep.
>  
>     -  put_user()
>  
> --  kmalloc(GP_KERNEL) <kmalloc>`
> +-  :c:func:`kmalloc(GFP_KERNEL) <kmalloc>`

So this makes no sense at all.  We are trying to get rid of :c:func:;
why are you adding it back?

Thanks,

jon
