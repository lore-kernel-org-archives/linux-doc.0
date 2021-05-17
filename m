Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1049C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 18:30:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9B0F2611BF
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 18:30:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237034AbhEQSbp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 14:31:45 -0400
Received: from ms.lwn.net ([45.79.88.28]:51712 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232572AbhEQSbp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 May 2021 14:31:45 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DD0DF2F3;
        Mon, 17 May 2021 18:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DD0DF2F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1621276229; bh=9J1z04QUInFd5OsLL/tqG+IVrH+gV0GqTm6+eQBRTq8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Rhvbjz7NDVf4U4fjtPDVC92jRMfoSKeuDkDf3xd1k6dCkVvsvR5p6C+WpDFo6OYqM
         UVT6SJxddDtZD861LZhublOKGXJi+CPHEBc09RfRegEvYjmapTdOiNz8BkSOGqxUK2
         agosyTn87dqzbRE+4l1ZwR4MKbIYGwUSbPd20eIF6OhLLqZ56o/2e6mYeaeQDPK45/
         rmbD22y83Iju/VIlZH1qQKDb8Nk4v4gn4Ggy+tzFVOzIG8DvAKayXcy+JYjHMi50YL
         1GCzOqmv1vlufrHN7CtfVHRf7t5eh6FQw5XL1MuiOrbXQw8DbEZal0SS9xqgEDO2pv
         TW8ozUIxqOsUg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v3] docs/zh_CN: add core api kobject translation
In-Reply-To: <20210517133748.3461357-1-siyanteng@loongson.cn>
References: <20210517133748.3461357-1-siyanteng@loongson.cn>
Date:   Mon, 17 May 2021 12:30:28 -0600
Message-ID: <875yzh2oxn.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> This patch translates Documentation/core-api/kobject.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
> ---
> v3:
>
> * Pick Alex'S review-by tag.
> * Pick Xiangcheng'S review-by tag.
> * Writting Changelog under three dashes(---)
>
> v2:
>
> Modified some words under Xiangcheng Wu's advices.
> Thanks for his review!
> https://lore.kernel.org/linux-doc/CAEensMw+PPjwS4p7k39xouww0hz8D2LZG67Nm1hq9vSrRmFqJw@mail.gmail.com/T/#t
>
>  .../translations/zh_CN/core-api/index.rst     |   6 +-
>  .../translations/zh_CN/core-api/kobject.rst   | 378 ++++++++++++++++++
>  2 files changed, 383 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/kobject.rst

Applied, thanks.

jon
