Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65C6FC4707F
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 16:18:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4141F613C0
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 16:18:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236140AbhE0QUE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 May 2021 12:20:04 -0400
Received: from ms.lwn.net ([45.79.88.28]:48356 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235418AbhE0QUC (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 May 2021 12:20:02 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 990582B7;
        Thu, 27 May 2021 16:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 990582B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1622132303; bh=pASu1/VIHfBpb9vMWlsDqMGJZ8JbJEGYzIQPxXJtB80=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=pyHHAodC2SnRLwBnEKhk3VGBsxjnrOsHA3416MPXyFfg7lggzxAfXbx6Ves4qOYUu
         bfJnlYUPYBGJd5bkTu2zbigDzNjCOQPdLhtMqie0O9Zv3UAD3TJQzJcKaaUy2x+hP4
         i9r/0uSt3DvziU7cTKoITUgygRHtujlz1ZQj/Tzal3PpPG1AZCXgTexnbmLx3/7Vk+
         1nLAoaqmLdCiuB0Z8mp02cK8XSHFmVwqOg9c2aCYltNmVbRgMYvSg7WSkxZXfc1/Mr
         nSWTmX0xRddn7F1X+7epju++pGIjOU4c/xThXFMx6f3lYg9SXhqTOvuujHDng+rMvb
         Jfc/9VDNvfHXg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH] docs: zh_CN: update Chinese translations
In-Reply-To: <20210521083908.3783492-1-siyanteng@loongson.cn>
References: <20210521083908.3783492-1-siyanteng@loongson.cn>
Date:   Thu, 27 May 2021 10:18:23 -0600
Message-ID: <87mtsg2lrk.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> Two new commits were added to the original document:
>
> commit ddba35031db2ea89facc91c745e5ad55ba2e0e7f
> commit 20bc8c1e972f29afcac85e524e430c11a6df5f58
>
> translate them into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/core-api/printk-formats.rst           | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)

I've applied these, but ... in the future, please use the canonical
format for referring to other commits:

  commit ddba35031db2 ("module: add printk formats to add module build ID to stacktraces")

Thanks,

jon
