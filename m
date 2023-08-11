Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4590AC001B0
	for <linux-doc@archiver.kernel.org>; Fri, 11 Aug 2023 20:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236378AbjHKUb1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Aug 2023 16:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236268AbjHKUb0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Aug 2023 16:31:26 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C6618E
        for <linux-doc@vger.kernel.org>; Fri, 11 Aug 2023 13:31:26 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 528944A2;
        Fri, 11 Aug 2023 20:31:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 528944A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1691785886; bh=ZUftxayagjsUOpnhM2Ygucn2PBRLWbwsYW+pPJsMUjI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=M19azIKYjRLCBPf+0uCzEfpPH0yIcY5xK/CRHtX5R9sIzefnfjczcbo1Ll9p56sCB
         hvAlWyoRfVzSV7nY//giXZcLtPIwveYVbaaUCWaGuuWX7Mt3GPvWYs7AvzO5wm8RA3
         i+wtHRhvLwNn24oJSwZ9PUzULoaQdqy/LTGYau6q36PCDd/hz9jqtDXfGUpE1iDoNU
         AHPQZGa4Ptg2S3J1RgbkF5olZvcI4y61M5DLNEvmFJSms38u1Qzt2dlmCQmFCXQsvu
         a2WGvNnFu6/8ZdjKeCUWT9z8WpfR5Qq2MHZlVJlIouuAJb2ybUNk/z2UjveIi36nff
         0i64+OXGpwd6A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wupeng Ma <mawupeng1@huawei.com>, akpm@linux-foundation.org,
        david@redhat.com
Cc:     linux-mm@kvack.org, mawupeng1@huawei.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: update params of memhp_default_state=
In-Reply-To: <20230802074312.2111074-1-mawupeng1@huawei.com>
References: <20230802074312.2111074-1-mawupeng1@huawei.com>
Date:   Fri, 11 Aug 2023 14:31:25 -0600
Message-ID: <87h6p5xqw2.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wupeng Ma <mawupeng1@huawei.com> writes:

> From: Ma Wupeng <mawupeng1@huawei.com>
>
> Commit 5f47adf762b7 ("mm/memory_hotplug: allow to specify a default
> online_type") allows to specify a default online_type which make
> online memory to kernel or movable zone possible but fail to update
> to doc. Update doc to fit this change.
>
> Signed-off-by: Ma Wupeng <mawupeng1@huawei.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index a1457995fd41..09bad9c62f41 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -3105,7 +3105,7 @@
>  			[KNL,SH] Allow user to override the default size for
>  			per-device physically contiguous DMA buffers.
>  
> -	memhp_default_state=online/offline
> +	memhp_default_state=online/offline/online_kernel/online_movable
>  			[KNL] Set the initial state for the memory hotplug

Applied, thanks.

jon
