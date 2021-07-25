Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900BBC4338F
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:45:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6D06560C51
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:45:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbhGYUEl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Jul 2021 16:04:41 -0400
Received: from ms.lwn.net ([45.79.88.28]:42018 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229518AbhGYUEl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 25 Jul 2021 16:04:41 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 08C0D2E6;
        Sun, 25 Jul 2021 20:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 08C0D2E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1627245911; bh=WPr0GxdZDa06tc90TGKR25JKfAH2VmmY0XxWgOAmsgY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=RPRNQeIY3dAN4Fhrk0DYr09YtLZtjn1B1iJNf2+7c+fUjCCDzReSojmmEEQxLXtso
         7jhCuhty9O6dBnNspuoHyNnYuesG0WmvVQASN/hFFSb9282OZU7Wfov2+T+YPg2/dL
         x4OF0+b89iE2e1sBG0AD17EHEl9p61PQI3j/IsdOhj5G5wjvdrji4/vO/i8N3OnV5K
         /F0jOHHvOjW7bSXekbN+VHuHKmUwskPJZGQ6g91mplsN1natAfeEae6ZDRJy4UhQFr
         7Hg0Xq7qrtWM+TdeDdt6IOruJBFaRMAtlxmr7S/smORZYt5vpZRb0phjYSrxRttit6
         lsfnJQYx7blVA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH 0/8] docs/zh_CN: add infiniband translation.
In-Reply-To: <cover.1624525360.git.siyanteng@loongson.cn>
References: <cover.1624525360.git.siyanteng@loongson.cn>
Date:   Sun, 25 Jul 2021 14:45:10 -0600
Message-ID: <87wnpet961.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> translation linux-next/Documentation/infiniband/* into Chinese.
>
> Yanteng Si (8):
>   docs/zh_CN: add infiniband index translation
>   docs/zh_CN: add infiniband core_locking translation
>   docs/zh_CN: add infiniband ipoib translation
>   docs/zh_CN: add infiniband opa_vnic translation
>   docs/zh_CN: add infiniband sysfs translation
>   docs/zh_CN: add infiniband tag_matching translation
>   docs/zh_CN: add infiniband user_mad translation
>   docs/zh_CN: add infiniband user_verbs translation
>
>  Documentation/translations/zh_CN/index.rst    |   2 +-
>  .../zh_CN/infiniband/core_locking.rst         | 114 ++++++++++++
>  .../translations/zh_CN/infiniband/index.rst   |  39 +++++
>  .../translations/zh_CN/infiniband/ipoib.rst   | 110 ++++++++++++
>  .../zh_CN/infiniband/opa_vnic.rst             | 155 +++++++++++++++++
>  .../translations/zh_CN/infiniband/sysfs.rst   |  20 +++
>  .../zh_CN/infiniband/tag_matching.rst         |  62 +++++++
>  .../zh_CN/infiniband/user_mad.rst             | 163 ++++++++++++++++++
>  .../zh_CN/infiniband/user_verbs.rst           |  71 ++++++++
>  9 files changed, 735 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/infiniband/core_locking.rst
>  create mode 100644 Documentation/translations/zh_CN/infiniband/index.rst
>  create mode 100644 Documentation/translations/zh_CN/infiniband/ipoib.rst
>  create mode 100644 Documentation/translations/zh_CN/infiniband/opa_vnic.rst
>  create mode 100644 Documentation/translations/zh_CN/infiniband/sysfs.rst
>  create mode 100644 Documentation/translations/zh_CN/infiniband/tag_matching.rst
>  create mode 100644 Documentation/translations/zh_CN/infiniband/user_mad.rst
>  create mode 100644 Documentation/translations/zh_CN/infiniband/user_verbs.rst

So these have been waiting for a month without review...is there any
chance somebody can take a look at them?

Thanks,

jon
