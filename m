Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90052C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 29 Sep 2022 19:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiI2TSR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Sep 2022 15:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229835AbiI2TSR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Sep 2022 15:18:17 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 596CE1181C2
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 12:18:16 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73:8b7:7001:c8aa:b65f])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 11CF7734;
        Thu, 29 Sep 2022 19:18:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 11CF7734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1664479096; bh=JQEA+ygnLKcesFpnBO35do9kegSZJuluVCgRGdQlgsY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=m/mPh2zXAkpeKmY7+lm/4n0A+CS0DojjjjNEFuDvtikrofU0L8gRvfKkg3tLP+rX0
         gp1szotYvz2PqmqqO0DFfXL5B1cWu2z1O2JBY0LaLjQMfrlIn382ORnk2020LYu1Tf
         FyPrcJ2nx0QZyGdWdKG18FwBtSg1SBaQ5093dMxLj3zJnpnw+MEdKROElC7zv0udga
         DYWzddUM0L1s542Vi1Cs1S6qg3wYy6mzuY/+eWhllSF5jTIMQhgkuzNT62vob8+1T+
         DrYoq94T9PRPb/xfGNWpUYC8PK67ZqJDs+f1hIlQG5ulFmBhnNhpcwMO6XjMT9aah0
         xkZ86rwlB6+nA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-doc@vger.kernel.org
Cc:     bgolaszewski@baylibre.com, maz@kernel.org, yangyingliang@huawei.com
Subject: Re: [PATCH -next] Documentation: devres: update IRQ helper
In-Reply-To: <20220927083819.12484-1-yangyingliang@huawei.com>
References: <20220927083819.12484-1-yangyingliang@huawei.com>
Date:   Thu, 29 Sep 2022 13:18:15 -0600
Message-ID: <87sfkagfbc.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yang Yingliang <yangyingliang@huawei.com> writes:

> devm_irq_sim_init() has been changed to devm_irq_domain_create_sim()
> in commit 337cbeb2c13e ("genirq/irq_sim: Simplify the API").
>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  Documentation/driver-api/driver-model/devres.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

jon
