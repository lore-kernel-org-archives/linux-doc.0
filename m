Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814F0C4332F
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 10:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbiLCKy5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Dec 2022 05:54:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229765AbiLCKyw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Dec 2022 05:54:52 -0500
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0F237F8E
        for <linux-doc@vger.kernel.org>; Sat,  3 Dec 2022 02:54:49 -0800 (PST)
Received: from localhost (mdns.lwn.net [45.79.72.68])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 8E4D5536;
        Sat,  3 Dec 2022 10:54:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8E4D5536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1670064889; bh=vivpMffdvIcCrtI00WmMjUQezMAm1k4ONLBLuFrWQ6k=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=edjsB4zG9YaW4xb7Okfv7+n6/7F4IO1S3H0EbYsuXs8vaG4g8VXKaknCO4jgmV8TV
         D1NFRqrQXMNtUUPfswyIhAexiiDaUsYShThWym1Nis2CdfyOyd5KyxdFEEUy+WyvPi
         /vp5GAVqxw3pvipd3WmrnLjrHjSLKVD4KZN1BMGGfvuZqC8BT2AEuFkHmHYvaW20xs
         xwmrwaAE5r19W0KpJ/wqV6jJ1TDqfdQJg6UcFCd2bu2HUUo9SWEJsn79PngVF1XTiJ
         KiG9onSf/12Bnv2GOK5triJSCKonSvYFX6m4q+HUVs6ONI9AwiER4vEN+m0lelIURu
         akrEtiByFziKw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wei Li <liwei391@huawei.com>
Cc:     Guo Ren <guoren@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Patricia Alfonso <trishalfonso@google.com>,
        Richard Weinberger <richard@nod.at>,
        Johannes Berg <johannes@sipsolutions.net>,
        linux-doc@vger.kernel.org, huawei.libin@huawei.com
Subject: Re: [PATCH] Documentation/features: Update feature lists for 6.1
In-Reply-To: <20221203093750.4145802-1-liwei391@huawei.com>
References: <20221203093750.4145802-1-liwei391@huawei.com>
Date:   Sat, 03 Dec 2022 03:54:42 -0700
Message-ID: <87lenooiz1.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wei Li <liwei391@huawei.com> writes:

> Run the refresh script to document the recent feature additions
> on loong, um and csky as of v6.1-rc7.
>
> Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
> Fixes: 5f1e001be579 ("LoongArch: Add qspinlock support")
> Fixes: b37042b2bb7c ("LoongArch: Add perf events support")
> Fixes: 5b301409e8bc ("UML: add support for KASAN under x86_64")
> Fixes: 4e8bb4ba5a55 ("csky: Add jump-label implementation")
> Fixes: 45e15c1a375e ("csky: Add qspinlock support")
> Signed-off-by: Wei Li <liwei391@huawei.com>
> ---
>  Documentation/features/core/eBPF-JIT/arch-support.txt         | 2 +-
>  Documentation/features/core/jump-labels/arch-support.txt      | 2 +-
>  Documentation/features/debug/KASAN/arch-support.txt           | 2 +-
>  .../features/locking/queued-spinlocks/arch-support.txt        | 4 ++--
>  Documentation/features/perf/perf-regs/arch-support.txt        | 2 +-
>  Documentation/features/perf/perf-stackdump/arch-support.txt   | 2 +-
>  6 files changed, 7 insertions(+), 7 deletions(-)

Applied, thanks.

jon
