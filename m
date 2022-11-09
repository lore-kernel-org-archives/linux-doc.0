Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AB7C4332F
	for <linux-doc@archiver.kernel.org>; Wed,  9 Nov 2022 21:00:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231982AbiKIVAm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Nov 2022 16:00:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbiKIVAR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Nov 2022 16:00:17 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC73A30F71;
        Wed,  9 Nov 2022 12:57:32 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 715CC735;
        Wed,  9 Nov 2022 20:57:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 715CC735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1668027452; bh=1H9A1YDPA4r72i+WyXLw+XPOF+TT2SfWCjxoOJ83syU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=sHb0/Z0amq94oPtkHZtyuFgPqMPPYfgWnqV5PIjWgBGEEsQzNnuB2nVh+tMzDmHUk
         G6goBlPoBXYVtzhDN9e6J+D5rJnznDO/sVO2Jmzy82Hkpqp6ETTtgzMt5ezR6DT648
         ric1QwHL8Ui+7yqit4l+dEvRrS8mD+6bUNUhfOtnsYg5x1VILy6rxKnJnUDR3eeXUI
         zAbMdQUpDlKDuvwhWeBqDVcp4ozeL99MgiQFvT7w+bPv5PmfADCFsx+6a/P3yI4HDn
         BWrWAY5VVZU4rQvI8pDhQiauTriQFf0E0GbZ4MgVk8bTz8HE3ruiwDo+CV1+oEzcON
         adW1bMg64pLWQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     David Heidelberg <david@ixit.cz>
Cc:     ~okias/devicetree@lists.sr.ht, David Heidelberg <david@ixit.cz>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs/admin-guide/mm/zswap: remove a paragraph about
 zswap being a new feature
In-Reply-To: <20221104122612.14906-1-david@ixit.cz>
References: <20221104122612.14906-1-david@ixit.cz>
Date:   Wed, 09 Nov 2022 13:57:31 -0700
Message-ID: <877d03kfr8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

David Heidelberg <david@ixit.cz> writes:

> Nine years have passed since Linux 3.11.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  Documentation/admin-guide/mm/zswap.rst | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/Documentation/admin-guide/mm/zswap.rst b/Documentation/admin-guide/mm/zswap.rst
> index 6e6f7b0d6562..f67de481c7f6 100644
> --- a/Documentation/admin-guide/mm/zswap.rst
> +++ b/Documentation/admin-guide/mm/zswap.rst
> @@ -14,13 +14,7 @@ for potentially reduced swap I/O.  This trade-off can also result in a
>  significant performance improvement if reads from the compressed cache are
>  faster than reads from a swap device.
>  
> -.. note::
> -   Zswap is a new feature as of v3.11 and interacts heavily with memory
> -   reclaim.  This interaction has not been fully explored on the large set of
> -   potential configurations and workloads that exist.  For this reason, zswap
> -   is a work in progress and should be considered experimental.
> -
> -   Some potential benefits:
> +Some potential benefits:
>  

Applied, thanks.

jon
