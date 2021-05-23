Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08018C47080
	for <linux-doc@archiver.kernel.org>; Sun, 23 May 2021 16:02:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D715E60E0B
	for <linux-doc@archiver.kernel.org>; Sun, 23 May 2021 16:02:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231817AbhEWQEW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 23 May 2021 12:04:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231789AbhEWQEV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 23 May 2021 12:04:21 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E522C061574;
        Sun, 23 May 2021 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=nf4kv69q0wLNCQzLT6osph4X3WdmmTcIkLYbJDobBeY=; b=RQjkD0eMDPvV+noiV/KJDkAgLv
        96D9XW1NlR3V7y9qDT0Z9N+Xyt3g1JEql87qb7VnraS4NjvKLL6NMnjpw7OTswyRnIN7hZSNAuGKD
        bkc3tY58KA6z4+W+R+I+ErYVIGXvT32GwebXqG7nhYU/JtGIzkob4Cjv5qxkAuqcgBOCNgUHDoMe9
        /9dAyvsrg3C0HB4UScBJBKwCOfOEgyuvO3GYsx6ZHuGShUGmu2GiKMXclMVF5pXSfU4a4LONxbsdV
        wEbpr2N5dA0fX3X/pc8/tEuciILO7cnNQhQyInaB3mtk7qfP6YEaVvIROQGupVukJdCaxXP/Rp3s9
        dWoHwDEg==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lkqZ3-000UIl-JQ; Sun, 23 May 2021 16:02:53 +0000
Subject: Re: [PATCH] w1: ds2482: fix kernel-doc syntax in file
To:     Aditya Srivastava <yashsri421@gmail.com>, zbr@ioremap.net
Cc:     lukas.bulwahn@gmail.com, linux-kernel@vger.kernel.org,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org
References: <20210523150122.21160-1-yashsri421@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a73d2d15-20a5-b6bf-9cf3-3a78c3608822@infradead.org>
Date:   Sun, 23 May 2021 09:02:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210523150122.21160-1-yashsri421@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/23/21 8:01 AM, Aditya Srivastava wrote:
> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> The comments for drivers/w1/masters/ds2482.c follows this syntax, but
> the content inside does not comply with kernel-doc.
> 
> Similarly, the syntax for function and arguments declaration as well.
> 
> Fix all such occurrences appropriately.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  drivers/w1/masters/ds2482.c | 94 ++++++++++++++++++-------------------
>  1 file changed, 47 insertions(+), 47 deletions(-)

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy

