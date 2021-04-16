Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 442D3C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 19:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12E7F613B0
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 19:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236021AbhDPTHD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 15:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235877AbhDPTHD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Apr 2021 15:07:03 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EFEAC061574
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 12:06:38 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BAC3C6D9;
        Fri, 16 Apr 2021 19:06:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BAC3C6D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1618599997; bh=PNhWhHDX4QjHizURCIPzXL0D81/fOu6dufo/G5GhPM4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=HWgnu3bQbnTlGqGvleg80EwZnLJKcbQ4VN82vCpV5UXdPG3zq1A+PzxGC01R2+tba
         ftbyLNmsSBKf3Mvb0sREJCNdV6gv8/GtfP/esQJuzkPPl2GvoD4BbVTs4tn4mgoMCc
         aV8gkMRTUjSLlhNSMpSob42+b2YmDaVatYJXOKH/FythXV0PFPOAiFn+z8puh3jW2P
         OfSzepd9LX7B/GU6NXWoC48MCMvbRl/aSzE1MmY1OUOlAm4r/fLjsAjoFPArJYcWou
         KzGW5RhCfFWdLUgADocVgtuCpMh8Kt3i1RKfPwJG75EHHfURicY8n/5ThBn23OIP3H
         oNLr+mU5eaZjQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>,
        Wu XiangCheng <bobwxc@email.cn>
Subject: Re: [PATCH v5 0/4] docs/zh_CN: add core api and openrisc translation
In-Reply-To: <CAEensMyd=yeLaYwoLr6P3qnenj+DbcAqsmTamhAT=uy8nKHtOQ@mail.gmail.com>
References: <20210415063838.2341827-1-siyanteng@loongson.cn>
 <87y2dj4lvw.fsf@meer.lwn.net>
 <CAEensMyd=yeLaYwoLr6P3qnenj+DbcAqsmTamhAT=uy8nKHtOQ@mail.gmail.com>
Date:   Fri, 16 Apr 2021 13:06:37 -0600
Message-ID: <87v98mf3r6.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

yanteng si <siyanteng01@gmail.com> writes:

>> So I am now totally confused.  I have two "v5" series with the same
>> subject; they are evidently different but there's no explanation of why
>> or which order I should put them in.
>>
>> Please, why have you done this, and what do you expect me to do now?
>>
> I'm sorry.
>
> I'm making things worse and worse. I just want to split into two
> separate series,
> the first series is 7 patches for core-api and the second series is 4
> patches for
> openrisc. However, I didn't change the subject of the cover letter,
> I'm really stupid.

No, you're not; no need to talk that way.  There's a lot to learn when
it comes submitting patches without making maintainers grumpy (or at
least any more grumpy than they already are :).  You're doing fine,
don't worry about it, thanks for working to improve the documentation.

jon
