Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C781C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 23:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238190AbiCIXpS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Mar 2022 18:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234529AbiCIXpL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 18:45:11 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7265119427
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 15:44:11 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1AA872C3;
        Wed,  9 Mar 2022 23:44:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1AA872C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1646869451; bh=hlbQi1Wqx5pRwzVF3mqhVov31aQggBVLGld/2o1LxTI=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QIVhcdJYA7802nflgND4dvuHfowyAzIpvw5Ep7ESSQWhENYzL+YbjdIwg7wMSiH9u
         lpTo1GUsRnDW5r61eYmibb263JaLE5UzFH3Fl9RMV3qA+B35Dn7UPStkRVSf70KlQa
         n1AJU3eZA5UGJs5rYsUjGTLE3Rfkjmngnt0U/zqObzHauOrVjBmDvNu1xAOr/hR8rr
         H0mN+U+Df0yfWiYhxwIWXaXk3eSWmpVBnlKTFdjSD+BbZluHYsoWOKf+SXdjCvhFJM
         CZtxxCYKsEQ25N4nSbnr/Tv/pstXaJwTle0k3/DD1mAfCiybbBekmr6vnINAAC6b8H
         OQDslcTOxFLEQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Tang Yizhou <tangyizhou@huawei.com>, siyanteng@loongson.cn,
        siyanteng01@gmail.com, alexs@kernel.org, seakeel@gmail.com
Cc:     linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        tangyeechou@gmail.com, Tang Yizhou <tangyizhou@huawei.com>
Subject: Re: [PATCH v2] docs/zh_CN: Add sched-stats Chinese translation
In-Reply-To: <20220309153659.24437-1-tangyizhou@huawei.com>
References: <20220309153659.24437-1-tangyizhou@huawei.com>
Date:   Wed, 09 Mar 2022 16:44:10 -0700
Message-ID: <87a6dy7ktx.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Tang Yizhou <tangyizhou@huawei.com> writes:

> Translate scheduler/sched-stats.rst into Chinese.
>
> Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> ---
> v2:
> Pick Yangteng and Alex's reviewed-by tags.
>  .../translations/zh_CN/scheduler/index.rst    |   3 +-
>  .../zh_CN/scheduler/sched-stats.rst           | 156 ++++++++++++++++++
>  2 files changed, 157 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/scheduler/sched-stats.rst

Applied, thanks.

jon
