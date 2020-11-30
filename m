Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35CF5C64E8A
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 17:42:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E65602074A
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 17:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727874AbgK3Rme (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 12:42:34 -0500
Received: from ms.lwn.net ([45.79.88.28]:54624 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729401AbgK3Rme (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 30 Nov 2020 12:42:34 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D5CE82CC;
        Mon, 30 Nov 2020 17:41:53 +0000 (UTC)
Date:   Mon, 30 Nov 2020 10:41:52 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wei Li <liwei391@huawei.com>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        Guo Ren <guoren@linux.alibaba.com>,
        Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
        <guohanjun@huawei.com>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation/features: Update feature lists for 5.10
Message-ID: <20201130104152.4e734f90@lwn.net>
In-Reply-To: <20201119022709.45843-1-liwei391@huawei.com>
References: <20201119022709.45843-1-liwei391@huawei.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 19 Nov 2020 10:27:09 +0800
Wei Li <liwei391@huawei.com> wrote:

> The feature lists don't match reality as of v5.10-rc4, update them
> accordingly (by features-refresh.sh).
> 
> Fixes: aa65ff6b18e0 ("powerpc/64s: Implement queued spinlocks and rwlocks")
> Fixes: e95a4f8cb985 ("csky: Add SECCOMP_FILTER supported")
> Fixes: 0bb605c2c7f2 ("sh: Add SECCOMP_FILTER")
> Fixes: bdcd93ef9afb ("csky: Add context tracking support")
> Signed-off-by: Wei Li <liwei391@huawei.com>
> ---
>  .../features/locking/queued-rwlocks/arch-support.txt          | 2 +-
>  .../features/locking/queued-spinlocks/arch-support.txt        | 2 +-
>  .../features/seccomp/seccomp-filter/arch-support.txt          | 4 ++--
>  Documentation/features/time/context-tracking/arch-support.txt | 2 +-
>  Documentation/features/time/virt-cpuacct/arch-support.txt     | 2 +-
>  5 files changed, 6 insertions(+), 6 deletions(-)

Applied, thanks.

jon
