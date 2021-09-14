Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCBEC433EF
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 20:54:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C6C761164
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 20:54:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233098AbhINUzb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 16:55:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231856AbhINUzb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Sep 2021 16:55:31 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B7B8C061574
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 13:54:13 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 37D8F2C1;
        Tue, 14 Sep 2021 20:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 37D8F2C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1631652853; bh=dQTGC579F6O7KBtH1KuOrwYAIUbWd8aBQUR6F+/wAQs=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=gtkhLhcYiZqAqrytzn7WFbCflM9BLLEahgfp5p/lyFAcpHxbGAIyG18R9vN8SymAj
         kbwQ05x99yVHlMi0LKuYJbu4wI4fYj2mXq237AJcpAXND862yhU6hiAY6zZ+2PvQZd
         RgNBDq8PrVqw9aLk5ZuJyPAf4QX10qjuWCA8M30jUxZ3iCzEtoxjW4ICmRNXZy4qyw
         clU/INsy3qaHJxVP8gStj2QHGG7jX+DMvynZTg65UueIF6JhZB2uKG7VfFYb1L7/fn
         7PmG3aYPcdIhY94r5rChgx/E/89U/TojmFJYzVtc/HSuM0Hpp1ImKQ/bBZPGyv3uhK
         vx2cJ2KXLb8CQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Li Xinhai <lixinhai.lxh@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Doc: page_migration: fix numbering for non-LRU movable
 flags
In-Reply-To: <20210908145215.592325-1-lixinhai.lxh@gmail.com>
References: <20210908145215.592325-1-lixinhai.lxh@gmail.com>
Date:   Tue, 14 Sep 2021 14:54:12 -0600
Message-ID: <874kamev4b.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Li Xinhai <lixinhai.lxh@gmail.com> writes:

> The non-LRU movable flags part is not relevant to above 3 funcitons, so remove
> the number 4.
>
> Signed-off-by: Li Xinhai <lixinhai.lxh@gmail.com>
>
> ---
>  Documentation/vm/page_migration.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/vm/page_migration.rst b/Documentation/vm/page_migration.rst
> index db9d7e5539cb..08810f549f70 100644
> --- a/Documentation/vm/page_migration.rst
> +++ b/Documentation/vm/page_migration.rst
> @@ -205,7 +205,7 @@ which are function pointers of struct address_space_operations.
>     In this function, the driver should put the isolated page back into its own data
>     structure.
>  
> -4. non-LRU movable page flags
> +Non-LRU movable page flags
>  
>     There are two page flags for supporting non-LRU movable page.

Applied, thanks.

jon
