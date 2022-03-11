Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AEFC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 11 Mar 2022 20:43:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229923AbiCKUom (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Mar 2022 15:44:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231233AbiCKUol (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Mar 2022 15:44:41 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A741DA44F
        for <linux-doc@vger.kernel.org>; Fri, 11 Mar 2022 12:43:31 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B30D32C0;
        Fri, 11 Mar 2022 20:43:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B30D32C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1647031410; bh=ZAvgwBTO1d+bJw6m1OSnPYuXvHlIpQiYGkGjkWvR0gk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=aEwzaYLCIcOLwPS5LrG782pWc+0RI72p0t3xeADPblcm9la6v5ns9Ob4AJYl5O7xK
         3tfrmHd/FHkgPnJ2aQclpRBIQQYXEy/YBgos4dAbBmj1r8P96aTTNsitvy9/QYESaq
         5l9o/JRYhPAGSDSrVGwH/b90fcuDP4Ij0Q1AYDmoY4h18iCZjE+F5so8EgBNzQMkWa
         X5oJChGTFXRgGvCXoRIyYOwmmiqRL0XE7Jdu4BJvWnWsizJ+vyTuAXQ7B+CFJkR2EK
         cWuRIN6jhw+kDOAPfvEZkN/o3hNaL8V4WDkOSEaZHSNuat6K3dpn8RFmGxDKSCnWwY
         wDNPhbUd085kQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v6 0/5] docs/zh_CN: add admin-guide damon translation
In-Reply-To: <cover.1646899089.git.siyanteng@loongson.cn>
References: <cover.1646899089.git.siyanteng@loongson.cn>
Date:   Fri, 11 Mar 2022 13:43:30 -0700
Message-ID: <87zglw2pal.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v6:
> * Modify "Enable" to "enable" under Alex's advice.
> * My patch thread is based on
> <https://lore.kernel.org/linux-doc/cover.1646899056.git.siyanteng@loongson.cn/T/#t>
>
> v5:
> * Modify some words under Alex's advice.
>
> v4:
> * Build test in next-20220307.
>
> v3:
> * Build test in next-20220304.
>
> v2:
> * Pick Alexs Reviewed-by tag. [PATCH 1-3/5]
> * Fix a build warning.(introduce from usage.rst)
>
> v1:
> * Translate .../admin-guide/mm/damon/* into Chinese
> * note my patch thread is based on
> <https://lore.kernel.org/linux-doc/20220212080024.1684590-1-xu.xin16@zte.com.cn/T/#t>
>
> Yanteng Si (5):
>   docs/zh_CN: Refactoring the admin-guide directory index
>   docs/zh_CN: add admin-guide damon index translation
>   docs/zh_CN: add admin-guide damon start translation
>   docs/zh_CN: add damon usage translation
>   docs/zh_CN: add damon reclaim translation
>
>  .../translations/zh_CN/admin-guide/index.rst  | 122 ++++----
>  .../zh_CN/admin-guide/mm/damon/index.rst      |  28 ++
>  .../zh_CN/admin-guide/mm/damon/reclaim.rst    | 232 ++++++++++++++
>  .../zh_CN/admin-guide/mm/damon/start.rst      | 132 ++++++++
>  .../zh_CN/admin-guide/mm/damon/usage.rst      | 286 ++++++++++++++++++
>  .../zh_CN/admin-guide/mm/index.rst            |   2 +-
>  6 files changed, 740 insertions(+), 62 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/reclaim.rst
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/start.rst
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon/usage.rst

Applied, thanks.

jon
