Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C070C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jan 2022 18:29:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbiA0S3K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jan 2022 13:29:10 -0500
Received: from ms.lwn.net ([45.79.88.28]:52004 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231827AbiA0S3K (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Jan 2022 13:29:10 -0500
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DC21737C;
        Thu, 27 Jan 2022 18:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DC21737C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1643308150; bh=GMXzrPt4iYDG4uZAjWg2xX/NeBALlZYiT8mFZsO7v4g=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Ud7sv3mbQdtTS3LbymcacAGMBtD0fDoFPWaWkzf/VhZwDawssaeqB96r07wBF/c6m
         I9f9PG4DhMrm9gFkyCZoFyAMOqEfWzuAE0hd/W1cOoX0xJ54Pm/SytvpMCxg4BJWke
         wSD6hfym6xPS18Craz3rmvGGdwyTApdHrsMXrD9pRPRBJGYooz5es+e3dovDRgIyQK
         1zkC0nWbwUVP0wbz+A7naZ+jvKjeKjD3fFPKyrsjuV9Rl1N7u2vWrn3w/31gwiCs9z
         ui873Uk3qhdfeSOGZAytj1dSA+k6LM9HShlz7lZg5CIw9Fw2mfU9ezGrEC9QBF0UMW
         cZG/UGqedepsg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH v3 0/3] Translate opp into Chinese
In-Reply-To: <20211229024212.32752-1-tangyizhou@huawei.com>
References: <20211229024212.32752-1-tangyizhou@huawei.com>
Date:   Thu, 27 Jan 2022 11:29:41 -0700
Message-ID: <87bkzxrq0a.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> Translate power/index.rst and power/opp.rst into Chinese.
>
> v3:
> 1. Translate comments in the pseudocode and chart.
> 2. Pick Yanteng's Reviewed-by tags.
>
> v2:
> 1. Split a cleanup patch for index.rst.
> 2. Pick Alex's Reviewed-by tags.
>
> Tang Yizhou (3):
>   docs/zh_CN: Cleanup index.rst
>   docs/zh_CN: Add power/index Chinese translation
>   docs/zh_CN: Add opp Chinese translation
>
>  Documentation/translations/zh_CN/index.rst    |   8 +-
>  .../translations/zh_CN/power/index.rst        |  56 +++
>  .../translations/zh_CN/power/opp.rst          | 341 ++++++++++++++++++
>  3 files changed, 401 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/power/index.rst
>  create mode 100644 Documentation/translations/zh_CN/power/opp.rst

Set applied (finally), thanks.

jon

