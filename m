Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1A2C433B4
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 15:19:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 550D861166
	for <linux-doc@archiver.kernel.org>; Thu, 13 May 2021 15:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234760AbhEMPUa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 May 2021 11:20:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234757AbhEMPUY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 May 2021 11:20:24 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD7D0C061574
        for <linux-doc@vger.kernel.org>; Thu, 13 May 2021 08:19:13 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 55245153;
        Thu, 13 May 2021 15:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 55245153
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1620919153; bh=lcpueckNHobuxUqTxZoIvZ7yrsn2k4sxH7S/hlLyh8E=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=BcuZ7YHs9OE85rGxLgn+SYvZTayheMp2EnCR/sDcuE8wnfKB71Reh8jLUBZNJIs/a
         Hlnza9vpU8rk5P9N2NnmAnDHmtRxpUaSYE+4oERbtZ7leGf2WJJCfyAaO9UEqCoZ5l
         9AYXaS/AI+RmqPkh1FCOKOht5cN6B8dvt/x1n5lWBHOAV3e2Y04ANeMtYoV5Ou9Yy5
         Ueq6jsZT+xOqs7JIGEWoMVycxc+hueK9RkeB6ZR5cww9y/pIF+/cqZCG30XqHFv6Kb
         mHax9M2zXKZULBPLS+UZ560m3oVIY+kn2GDX+UNUqUlFO4A+7TZey5CCLN4NSTN+z4
         AxhzAFa4WSXUg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com,
        Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kenrel.org>
Subject: Re: [PATCH v3] docs/zh_CN: add core-api workqueue.rst translation
In-Reply-To: <20210512083341.914-1-siyanteng@loongson.cn>
References: <20210512083341.914-1-siyanteng@loongson.cn>
Date:   Thu, 13 May 2021 09:19:12 -0600
Message-ID: <87lf8i7jbj.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I've applied this, but...

Yanteng Si <siyanteng@loongson.cn> writes:

> v3:
>
> * Pick Alex'S review-by tag.
>
> v2:
>
> Some bad translations have been modified as suggested by Alex.Thank you for your review.
> https://lore.kernel.org/linux-doc/CAEensMwq=i+nek6sNeqOJJMY648Q9ZF8cTKpXdJVuqdQQnMWUw@mail.gmail.com/T/#t
>
> v1:

Text like the above belongs below the "---" line so I don't have to edit
it out of the changelog by hand.

> This patch translates Documentation/core-api/workqueue.rst into Chinese.
>
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kenrel.org>

I fixed that typo too - it appears to originate from Alex...:)

Thanks,

jon
