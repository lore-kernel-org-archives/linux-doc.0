Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB2D2C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 19:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbiBXTYs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Feb 2022 14:24:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233675AbiBXTYq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Feb 2022 14:24:46 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A787324776D
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 11:24:16 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 45BF95BF;
        Thu, 24 Feb 2022 19:24:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 45BF95BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1645730656; bh=KqygvCPTHXCXGgP1c9dDbhJkIPiRt2p87kWJzuvZhfg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=XK1lUdQEH8qduu7SQvzBEHbrH1fpzaCztPHHRdvY8m5KT3NXC4piAaEtb6qGpQq8J
         e1L9oeGdOOv3xxYi9zB0zU5iUq4LEJnhZ6FrN1bSHVKoDYAeG0nwTdlCZtO7lhIjwG
         XyeDS9ZOJ4AqXnvRfhqg8iQSHZcKJItJ8SKwQZuW3/UIIszTz/LAfhpFWDm+pDG81p
         W1c2GO70vdrH8pCVjx45Im7v2MuDQJIM59os3twymp02Azim9/OuEIwzzuEOeO4MiE
         S35A+OB0Qia4IFbob8dMx8e79ncmKuqZ0MyNfhTSUmzp78havhKe08wAfV3/hVcF3H
         jS2YYPIjePhhw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH v2 0/5] docs/zh_CN: add admin-guide damon translation
In-Reply-To: <cover.1645437621.git.siyanteng@loongson.cn>
References: <cover.1645437621.git.siyanteng@loongson.cn>
Date:   Thu, 24 Feb 2022 12:24:15 -0700
Message-ID: <87czjckqzk.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

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

This set doesn't apply to docs-next; could you respin and resubmit,
please?

Thanks,

jon
