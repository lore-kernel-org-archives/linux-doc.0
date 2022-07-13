Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C667DC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 13 Jul 2022 20:03:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236821AbiGMUDJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Jul 2022 16:03:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236667AbiGMUDH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Jul 2022 16:03:07 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C629C2CCA0
        for <linux-doc@vger.kernel.org>; Wed, 13 Jul 2022 13:03:06 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7A2FE2B2;
        Wed, 13 Jul 2022 20:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7A2FE2B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1657742586; bh=EOTfmgixUWcWcslxnLM2QoKLAde0L8nx97etzNvHvwc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=duJ2RE15kwrrKyo7TFpXDFLT7nwM/+bYkGJ2IlZzFYEtuXIudvEj2wWPHQyFxCImA
         sYOC0N8hOG4A9m5bpZ4SjMZcU8kD9Lmq+Kck7UdS8uKZ/t5w/fjWAh6hy7A5IgnF9T
         wS5ZlmdkCE87ctOwVP2m9wZ0QqBTLYfpkYrIaLGtkSeE488PJIeUGuwzp/9/2NIC8c
         Q5jhZnHfMoEQGncsjJvhdm7lpmvfaeytlKgQLlB1cPBiEc8iTGq0IfdkXqSCHEo2/C
         bIPtmBp4bZF5TGxqsfqz49Zoiox2VOT6wDZHWtl7Y9vDVK3xodYKeq4qw/CkWhsEDY
         djAiNR/TKuZNA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org,
        siyanteng@loongson.cn
Cc:     chenhuacai@loongson.cn, bobwxc@email.cn, zhoubb.aaron@gmail.com,
        linux-doc@vger.kernel.org, Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH V3] docs/zh_CN: core-api: Add watch_queue Chinese
 translation
In-Reply-To: <20220710133604.31382-1-zhoubinbin@loongson.cn>
References: <20220710133604.31382-1-zhoubinbin@loongson.cn>
Date:   Wed, 13 Jul 2022 14:03:05 -0600
Message-ID: <87bkts4w7a.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Binbin Zhou <zhoubinbin@loongson.cn> writes:

> Translate core-api/watch_queue.rst into Chinese.
>
> Last English version used:
> commit f5461124d59b ("Documentation: move watch_queue to core-api").
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>
> Changes since v2:
>
> Take Xiangcheng's advice and add his proofreading signature to
> watch_queue.rst, thanks.
>
> Details:
> https://lore.kernel.org/linux-doc/YsbjmEhOjUrYqml4@bobwxc.mipc/
>
> Changes since v1:
>
> Take Yanteng's advice and add his proofreading signature to
> watch_queue.rst, thanks.
>
> Details:
> https://lore.kernel.org/linux-doc/ea5f1206-f34c-9907-e7c4-f97122e84dce@loongson.cn/
>
> ---
>  .../translations/zh_CN/core-api/index.rst     |   1 +
>  .../zh_CN/core-api/watch_queue.rst            | 313 ++++++++++++++++++
>  2 files changed, 314 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/watch_queue.rst

Applied, thanks.

jon
