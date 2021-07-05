Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE255C07E99
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jul 2021 14:57:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1F8661955
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jul 2021 14:57:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbhGEO75 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jul 2021 10:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231543AbhGEO75 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jul 2021 10:59:57 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 133F2C061574
        for <linux-doc@vger.kernel.org>; Mon,  5 Jul 2021 07:57:20 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8C1D9383;
        Mon,  5 Jul 2021 14:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8C1D9383
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1625497039; bh=oiqjN5ddj7l5Cmcy7TStx8qiWuNwNe7O3uvKpB6k35I=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=WxAM6NwCIoadjcv0TgfTFhRjGUFACmuq7RNFJFn4hLpQ2nmpFgRh+Yb91v0EZJslY
         zbGcNs8sOtSmm8qZx2yCvwHUTZOVFNaGWoFwM+xRphxe8JACFyUBrQaX/q4PZ8HT2z
         M8gVoCLpuIpJGk4guDGrkRp/9jy0pdZS/qcyMnMNxWzuBOEusUKyaxUybR3VfeFPVP
         d1rocZorKLksnZaTnwL7oppomSF3ga+yCFh19aw34XYsFqA1kCkUMR1YRGiqoD7IKe
         TkmhUGwxHHmURAULzuzt/re9YSF2C4Zac8nJhZJ0eYYrDcsfongX8PXFQEzL8okH4V
         UfyLVIQzP581w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Huacai Chen <chenhuacai@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Alex Shi <seakeel@gmail.com>
Cc:     linux-doc@vger.kernel.org, Wu XiangCheng <bobwxc@email.cn>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Yanteng Si <siyanteng@loongson.cn>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH 1/2] Documentation: LoongArch: Add basic documentations
In-Reply-To: <20210705111607.1208270-1-chenhuacai@loongson.cn>
References: <20210705111607.1208270-1-chenhuacai@loongson.cn>
Date:   Mon, 05 Jul 2021 08:57:18 -0600
Message-ID: <87a6n0kdv5.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Huacai Chen <chenhuacai@loongson.cn> writes:

> Add some basic documentations for LoongArch. LoongArch is a new RISC
> ISA, which is a bit like MIPS or RISC-V. LoongArch includes a reduced
> 32-bit version (LA32R), a standard 32-bit version (LA32S) and a 64-bit
> version (LA64).
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  Documentation/arch.rst                     |   1 +
>  Documentation/loongarch/features.rst       |   3 +
>  Documentation/loongarch/index.rst          |  21 ++
>  Documentation/loongarch/introduction.rst   | 342 +++++++++++++++++++++
>  Documentation/loongarch/irq-chip-model.rst | 158 ++++++++++
>  5 files changed, 525 insertions(+)
>  create mode 100644 Documentation/loongarch/features.rst
>  create mode 100644 Documentation/loongarch/index.rst
>  create mode 100644 Documentation/loongarch/introduction.rst
>  create mode 100644 Documentation/loongarch/irq-chip-model.rst

So documentation is good, but it still seems a bit strange to add
documentation for an architecture that Linux doesn't support.  I assume
that patches adding that support exist, right?  The documentation
patches should probably be a part of that patch set.

Thanks,

jon
