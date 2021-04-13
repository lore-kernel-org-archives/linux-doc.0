Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 571C6C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 21:04:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D66961176
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 21:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245510AbhDMVFK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 17:05:10 -0400
Received: from ms.lwn.net ([45.79.88.28]:46358 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231990AbhDMVFK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 17:05:10 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AF5B2823;
        Tue, 13 Apr 2021 21:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AF5B2823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618347889; bh=EUZwWZR+pFx9Tm2hVSqRTk5GJpsIZqyM13LU1XzuSU4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=GwdE6Q4ACMa/wvbydWDaWYkPctOlxt3AyWinOnFX1gSzoBs5SgukhhH8Bw2KosvVp
         om8Xqvn8qFmcxWsSwre5Ydc0pKVXGuzWKxXei4i1wJZM+K5CLhUXZRUk6B/gFrwS10
         ekzqgzxrHfe2XMCqzWTwD+qMhp2QYgW2zA2nKRprxdd53bFsZurxIpfLEq+tp8IBBp
         YiRSo3zhWUMC1pU31xeGlWTTNPAgw9brDCvxXelifHcpIOTL7gcdklL27httUPBGf2
         TM9bTR1upL5MmFTkdWI3BgBMNBLO2CiKDtrJSTMwmC0tE2yRelium1GAdFvDhMnTKx
         RZXLTtjm8JqQg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v3 00/11] docs/zh_CN: add core api and openrisc translation
In-Reply-To: <20210413131237.2253955-1-siyanteng@loongson.cn>
References: <20210413131237.2253955-1-siyanteng@loongson.cn>
Date:   Tue, 13 Apr 2021 15:04:49 -0600
Message-ID: <87lf9lsxou.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> This series of patches translates core-api/irq/* and openrisc/* into
> Chinese
>
> v1 -> v2:
>
> Modify some words under Xiangcheng Wu's suggestion. Thanks for his rewiew!
>
> v2 -> v3:
>
> keep the signs number equal to the title char under Alex's suggestion. 
> Thanks for his rewiew!
>
>
> Yanteng Si(11):
> docs/zh_CN: add core-api irq concepts.rst translation
> docs/zh_CN: add core-api irq irq-affinity.rst translation
> docs/zh_CN: add core-api irq irq-domain.rst translation
> docs/zh_CN: add core-api irq irqflags-tracing.rst
> docs/zh_CN: add core-api irq index.rst translation
> docs/zh_CN: add core-api index.rst translation
> docs/zh_CN: add translation to zh_CN index
> docs/zh_CN: add openrisc openrisc_port.rst translation
> docs/zh_CN: add openrisc todo.rst translation
> docs/zh_CN: add openrisc index.rst translation
> docs/zh_CN: add translation to zh_CN index
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

This looks like it's about ready to go in, but I seem to be missing
patch 11...?

Thanks,

jon
