Return-Path: <SRS0=MCi+=BN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D44C433E3
	for <linux-doc@archiver.kernel.org>; Mon,  3 Aug 2020 04:15:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76C5B20775
	for <linux-doc@archiver.kernel.org>; Mon,  3 Aug 2020 04:15:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="s0z2n5m6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725268AbgHCEPx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Aug 2020 00:15:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgHCEPt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Aug 2020 00:15:49 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D4FBC06174A
        for <linux-doc@vger.kernel.org>; Sun,  2 Aug 2020 21:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=wYTRpjfymCgNRLej5wa/gQSa8PBvdtAZGCPIUw1orIo=; b=s0z2n5m6s1IMkI7HeCbgC2dlPf
        yOPQ7BAYBx8xmZVunwFYfWN6nYPt2x1KIyS4lLLOgdNFTKvWGE3D6Hz8Fs7CFfPz7MZrU7FKpf+He
        0f2MnechNqzWqFvqwXebGadiknhHgLO+GyC+wC8MWnmPga/96miDjjZ0BjO6cxzUYfOgpyTeGCUqD
        ZWCjR3OtOz+GGYf6k0OVKpl6w1WFCRDWFRU/T8VyyWFTeI0nqLzVyKMPJ0Gh7b8eFxen2dVvGmtyd
        CD/MeQ1G2iuvQRH+x/whh1+kZv4JCaWg4G/iUrADUtJvDi+dkKHTLzkq7kGreM6LnKrt2arjVrndp
        k/WWaalA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k2Rt5-0006Ub-5j; Mon, 03 Aug 2020 04:15:47 +0000
Date:   Mon, 3 Aug 2020 05:15:47 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     David Niklas <Hgntkwis@vfemail.net>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net
Subject: Re: PROBLEM: Missing debug instructions when EIP is not present
Message-ID: <20200803041547.GZ23808@casper.infradead.org>
References: <20200802224652.6be413fe@Phenom-II-x6.niklas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200802224652.6be413fe@Phenom-II-x6.niklas.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Aug 02, 2020 at 10:46:52PM -0400, David Niklas wrote:
> The file: Documentation/admin-guide/bug-hunting.rst
> gives instructions on how to find the offending line of code using EIP.
> My particular bug that I need to report doesn't have EIP listed -- at
> least not by name. I tried to guess what EIP was in
> my case "__schedule+0x29e/0x6c0" but that didn't produce any results in
> gdb on my debug kernel.

EIP is the x86-32 name for what x86-64 calls RIP.  Not much help in
this case, because it's pointing to a userspace address (actually, I
think it's the vdso).  

> I don't appear to have the referenced module type problem:
> "[<ffffffff8802c8e9>] :jbd:log_wait_commit+0xa3/0xf5"
> 
> I'm totally new to kernel debugging so the documentation is really
> important and I'm rather frustrated in even bothering to read it as it's
> incomplete/unhelpful.
> 
> Here's the exact bug I'm trying to tackle.
> 
> [68812.480447] INFO: task CacheThread_Blo:9414 blocked for more than 480
> seconds.

That's the important bit.  Your task tried to take a mutex and 480
seconds later, it still didn't have it.

> [68812.480459]       Not tainted 4.14.184-nopreempt-AMDGPU-dav9
> #1 [68812.480464] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> disables this message. [68812.480469] CacheThread_Blo D    0  9414   9082
> 0x00000080 [68812.480476] Call Trace:
> [68812.480494]  __schedule+0x29e/0x6c0
> [68812.480505]  schedule+0x32/0x80
> [68812.480513]  schedule_preempt_disabled+0xa/0x10
> [68812.480520]  __mutex_lock.isra.1+0x26b/0x4e0
> [68812.480550]  ? do_journal_begin_r+0xbe/0x390 [reiserfs]
> [68812.480570]  do_journal_begin_r+0xbe/0x390 [reiserfs]

The mutex it tried to take was in the function do_journal_begin_r().
Best of luck debugging reiserfs problems these days.  It doesn't get
a lot of love.

