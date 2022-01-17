Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7897C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 17 Jan 2022 21:55:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243380AbiAQVzU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Jan 2022 16:55:20 -0500
Received: from ms.lwn.net ([45.79.88.28]:51136 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231401AbiAQVzT (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 Jan 2022 16:55:19 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 56BAB2D3;
        Mon, 17 Jan 2022 21:55:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 56BAB2D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1642456519; bh=bbke6icTjajJgZMPYn2uTwxiatvWG9/Q/cTcoI855hI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=FDLpfoUDbmhG7MZrYoW38nFeNs7SLbKk8N6pCPv+a0Gq/FqnTgKNuvRumSROqgRUv
         vtHUEQY2Kgb+LduBupEZz4GlB9tSwiZgavOL3JgH4aikuh6UAZUT2tbD/VsFxrjtiY
         ZB71XKWYn7xI+2iRI6me5V6bvr+njvOE9ndHyI+g6KFs871jIadKLRaf075mZvl8mE
         nmiHN0eG4d3RZwbixF1b5CAKIMRi58M3BneK2LHSgUOqgIyG5pnvNZJcMej/jzQBeu
         U+JGtyziVjt6BT2eQKkUOmzVmc2wckByiiTU0j1UD+RZL18J1xTg8UJ9Gycu85sSMj
         A2+ALN6fj5qDQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wang Cheng <wanngchenng@gmail.com>, jens.wiklander@linaro.org
Cc:     op-tee@lists.trustedfirmware.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: staging/tee.rst: fix two typos found while reading
In-Reply-To: <20220115125236.34886-1-wanngchenng@gmail.com>
References: <20220115125236.34886-1-wanngchenng@gmail.com>
Date:   Mon, 17 Jan 2022 14:55:39 -0700
Message-ID: <87k0ey3u3o.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wang Cheng <wanngchenng@gmail.com> writes:

> Signed-off-by: Wang Cheng <wanngchenng@gmail.com>
> ---
>  Documentation/staging/tee.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/staging/tee.rst b/Documentation/staging/tee.rst
> index 3c63d8dcd61e..498343c7ab08 100644
> --- a/Documentation/staging/tee.rst
> +++ b/Documentation/staging/tee.rst
> @@ -255,7 +255,7 @@ The following picture shows a high level overview of AMD-TEE::
>   +--------------------------+      +---------+--------------------+
>  
>  At the lowest level (in x86), the AMD Secure Processor (ASP) driver uses the
> -CPU to PSP mailbox regsister to submit commands to the PSP. The format of the
> +CPU to PSP mailbox register to submit commands to the PSP. The format of the
>  command buffer is opaque to the ASP driver. It's role is to submit commands to
>  the secure processor and return results to AMD-TEE driver. The interface
>  between AMD-TEE driver and AMD Secure Processor driver can be found in [6].
> @@ -290,7 +290,7 @@ cancel_req driver callback is not supported by AMD-TEE.
>  
>  The GlobalPlatform TEE Client API [5] can be used by the user space (client) to
>  talk to AMD's TEE. AMD's TEE provides a secure environment for loading, opening
> -a session, invoking commands and clossing session with TA.
> +a session, invoking commands and closing session with TA.

Applied, thanks.

jon
