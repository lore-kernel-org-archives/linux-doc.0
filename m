Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B929CC433DB
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 19:19:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D36E64F4A
	for <linux-doc@archiver.kernel.org>; Mon, 15 Mar 2021 19:19:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233284AbhCOTTV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Mar 2021 15:19:21 -0400
Received: from ms.lwn.net ([45.79.88.28]:43900 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233369AbhCOTS6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Mar 2021 15:18:58 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 19DF82E5;
        Mon, 15 Mar 2021 19:18:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 19DF82E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1615835938; bh=So9BxVVP4vJIybXhEmOBJxB5pieD4QyUvx0pbVCgp5I=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mpxpQzoi39ZdBSexYO8A147/EiFJIj5SoXm+LXMnBxovMbOWbVB6aIxT2VQb1cNbO
         ip0xp770AKFuhIydaupQQHAkN8Xbcee6TyuidcwI9EJ47QxOhzeivCCr1bhdZBVMHJ
         H5ickUEj4++Vbq5B9J8JdydI7qyiosgyR9Q13mYmXrqp8bzgfWd/HwHFi3VBLfSrrI
         37ieCOZ8AZ4b8wrxy1K+R4Pc3/Oh3yM9h8cKil32skwu5HcZBL/NTqu9KXLyoq2ejs
         cYu8/BkAW54GB8VAn/FKB56k2dmvGITUJy90NbeEmHgVdHG2wbN3oPPpkJa+PXGunt
         HYSc6IK0mVqlg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Barry Song <song.bao.hua@hisilicon.com>, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, linux-mm@kvack.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linuxarm@openeuler.org, Barry Song <song.bao.hua@hisilicon.com>,
        Mel Gorman <mgorman@suse.de>,
        Andy Lutomirski <luto@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH] Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH
 doesn't apply to ARM64
In-Reply-To: <20210223003230.11976-1-song.bao.hua@hisilicon.com>
References: <20210223003230.11976-1-song.bao.hua@hisilicon.com>
Date:   Mon, 15 Mar 2021 13:18:57 -0600
Message-ID: <87a6r42pjy.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Barry Song <song.bao.hua@hisilicon.com> writes:

> BATCHED_UNMAP_TLB_FLUSH is used on x86 to do batched tlb shootdown by
> sending one IPI to TLB flush all entries after unmapping pages rather
> than sending an IPI to flush each individual entry.
> On arm64, tlb shootdown is done by hardware. Flush instructions are
> innershareable. The local flushes are limited to the boot (1 per CPU)
> and when a task is getting a new ASID.
> So marking this feature as "TODO" is not proper. ".." isn't good as
> well. So this patch adds a "N/A" for this kind of features which are
> not needed on some architectures.
>
> Cc: Mel Gorman <mgorman@suse.de>
> Cc: Andy Lutomirski <luto@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Signed-off-by: Barry Song <song.bao.hua@hisilicon.com>
> ---
>  Documentation/features/arch-support.txt        | 1 +
>  Documentation/features/vm/TLB/arch-support.txt | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)

This had a conflict with the c6x removal, but I fixed that up and
(finally) applied it, thanks.

jon
