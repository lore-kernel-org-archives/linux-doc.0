Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFB8C4338F
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 14:55:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7164C6108C
	for <linux-doc@archiver.kernel.org>; Thu, 12 Aug 2021 14:55:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235770AbhHLOzd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 Aug 2021 10:55:33 -0400
Received: from ms.lwn.net ([45.79.88.28]:48480 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235613AbhHLOzc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 12 Aug 2021 10:55:32 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E97A244A;
        Thu, 12 Aug 2021 14:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E97A244A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1628780107; bh=ekOBuTAaJDn7u76qWnvHEXJlMOigWhLouT/jl4jlhf4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=eKxdOnukcnevall3TFD00ONFJxVsMRZx9eXqV2qG00scnDZN09vmjqEJPnBm30DnX
         NEXXnOwY1E2jypUpICxl2bFd9gDS9/eiqpypy7GlSx0Kgfib/PsOaDFCBzQcimrf94
         LehAOs2OqljqMjpiS6eWh+dLP+7e5dHxdVPdh67fSyvC67Z5Hg4mBp8HVM9CXoRzUw
         cvA7hhTg6jkfxvzflpXRLl4672X5OkYnmer9jOOfJM3+mD1j8gcvX8dlvI34McCrzg
         HxNq0E8Wzy5JWnyoOjm+DRcYIIXhg1ogPqswCmgs1hFZ26Guul1yGBLjy8T3ZPC11W
         UbU+9Qh/p5TDQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jisheng Zhang <jszhang3@mail.ustc.edu.cn>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH] Documentation/features/vm: riscv supports THP now
In-Reply-To: <20210805002739.23f44d2d@xhacker>
References: <20210805002739.23f44d2d@xhacker>
Date:   Thu, 12 Aug 2021 08:55:06 -0600
Message-ID: <875ywa1zn9.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Jisheng Zhang <jszhang3@mail.ustc.edu.cn> writes:

> From: Jisheng Zhang <jszhang@kernel.org>
>
> After commit e88b333142e4 ("riscv: mm: add THP support on 64-bit"),
> riscv can support THP.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  Documentation/features/vm/THP/arch-support.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/features/vm/THP/arch-support.txt b/Documentation/features/vm/THP/arch-support.txt
> index e8238cb2a4da..7dbd6967b37e 100644
> --- a/Documentation/features/vm/THP/arch-support.txt
> +++ b/Documentation/features/vm/THP/arch-support.txt
> @@ -22,7 +22,7 @@
>      |    openrisc: |  ..  |
>      |      parisc: | TODO |
>      |     powerpc: |  ok  |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: |  ..  |
>      |       sparc: |  ok  |

Applied, thanks.

jon
