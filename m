Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CDFC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 27 Apr 2021 15:59:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B54F613EA
	for <linux-doc@archiver.kernel.org>; Tue, 27 Apr 2021 15:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236398AbhD0QAB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Apr 2021 12:00:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236305AbhD0QAA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Apr 2021 12:00:00 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71709C061574
        for <linux-doc@vger.kernel.org>; Tue, 27 Apr 2021 08:59:17 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 34E2537C;
        Tue, 27 Apr 2021 15:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 34E2537C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1619539157; bh=bsILADiq4VH+dY+L/sDq6dmqn5WSlrJWZ2hZd3X5eUc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=ZbYNJUiv6uIZMkq4Snh1Q/UInSvAi9t84f09Oi3B8g+mB7JH8pXVSa/VBXZHq3LLa
         y+xXaeeAzhZsOaXN4gow0GIhpHB8opeO16IVz8d2mRVpTLOSwS7dR1AtaC1+8uLaqY
         BYRbyGNqoZsD/6BelYufdmzRfo9TADGJZ7iMaSRR16vAOrARlQO4nXzVtMJuCEs6rI
         hf0Bm79LyUIJw52mEcJg3mPAyQr1NkiQV6H64rfmqVE86wAhHblIjniT2v8mLoaO8g
         Ed7DiQNOMLSbWwBmt+34UnfQ8DSH8uVDdyr08uC1wPXNPxeRuszAMmMCyoMOwFYYai
         qY/iDwRtG4YSQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Matthew Wilcox <willy@infradead.org>, linux-doc@vger.kernel.org
Cc:     mchehab+huawei@kernel.org, yashsri421@gmail.com,
        lukas.bulwahn@gmail.com
Subject: Re: [PATCH] kernel-doc: Add support for __deprecated
In-Reply-To: <20210427114828.GY235567@casper.infradead.org>
References: <20210427114828.GY235567@casper.infradead.org>
Date:   Tue, 27 Apr 2021 09:59:16 -0600
Message-ID: <87o8dzd8h7.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Matthew Wilcox <willy@infradead.org> writes:

> The current linux-next tree has a new error:
>
> ./Documentation/gpu/drm-mm:445: ./drivers/gpu/drm/drm_prime.c:994: WARNING: Error in declarator or parameters
> Invalid C declaration: Expecting "(" in parameters. [error at 17]
>   int __deprecated drm_prime_sg_to_page_array (struct sg_table *sgt, struct page **pages, int max_entries)
>   -----------------^
>
> While we might consider that documenting a deprecated interface is not
> necessarily best practice, removing the error is easy.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index 2a85d34fdcd0..4840e748fca8 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1777,6 +1777,7 @@ sub dump_function($$) {
>      $prototype =~ s/^noinline +//;
>      $prototype =~ s/__init +//;
>      $prototype =~ s/__init_or_module +//;
> +    $prototype =~ s/__deprecated +//;
>      $prototype =~ s/__flatten +//;
>      $prototype =~ s/__meminit +//;
>      $prototype =~ s/__must_check +//;

Applied, thanks.

jon
