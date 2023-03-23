Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA720C6FD1C
	for <linux-doc@archiver.kernel.org>; Thu, 23 Mar 2023 18:04:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229794AbjCWSEx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Mar 2023 14:04:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbjCWSEu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Mar 2023 14:04:50 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79EC1EC78
        for <linux-doc@vger.kernel.org>; Thu, 23 Mar 2023 11:04:49 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 2869544A;
        Thu, 23 Mar 2023 18:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2869544A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1679594689; bh=O+j1l5LiYOeBLlKmG3jvEHRxALo+DzW7YtnJrrt2yGw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=abc45V2meh7D88mnAQUl/SSftfNuhovOpG0a1FE6JpeE4vAPP307e5QCVtixliWiP
         5L0FNB34x2JPEwVvhARaMEi9rCUSU6QZFGfvSKntSTA9YPQMV29cizbX5Of8MLBjJ7
         umZZsRie2TK6ty5kkZn5fWG2S9gJDUXrCc4AR91olHVzWGCwGIgn9yD/TepQeXeFAf
         T+hXFEj57jwIriIZ/5byD4P2FdvMboybZHTmQCGzbv9MoQiNGx1MpLFr6JBE7S7i7J
         dtRDdvVpahYXQdfjmWgFaWB22QnaNqcBTejdHabE+ODR9Fn4UO6QlgH2Ai+7kfU+jr
         hrIQZ8KSy15Sg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jakub Wilk <jwilk@jwilk.net>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] coding-style: fix title of Greg K-H's talk
In-Reply-To: <20230322215311.6579-1-jwilk@jwilk.net>
References: <20230322215311.6579-1-jwilk@jwilk.net>
Date:   Thu, 23 Mar 2023 12:04:48 -0600
Message-ID: <87pm8zbayn.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jakub Wilk <jwilk@jwilk.net> writes:

> The talk title was inadvertently mangled in 8c27ceff3604 ("docs: fix
> locations of several documents that got moved").
>
> Signed-off-by: Jakub Wilk <jwilk@jwilk.net>
> ---
>  Documentation/process/coding-style.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
> index 007e49ef6cec..6db37a46d305 100644
> --- a/Documentation/process/coding-style.rst
> +++ b/Documentation/process/coding-style.rst
> @@ -1267,5 +1267,5 @@ gcc internals and indent, all available from https://www.gnu.org/manual/
>  WG14 is the international standardization working group for the programming
>  language C, URL: http://www.open-std.org/JTC1/SC22/WG14/
>  
> -Kernel :ref:`process/coding-style.rst <codingstyle>`, by greg@kroah.com at OLS 2002:
> +Kernel CodingStyle, by greg@kroah.com at OLS 2002:
>  http://www.kroah.com/linux/talks/ols_2002_kernel_codingstyle_talk/html/

Applied, thanks.

jon
