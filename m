Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F424C433B4
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 20:33:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6666F60200
	for <linux-doc@archiver.kernel.org>; Wed, 31 Mar 2021 20:33:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236413AbhCaUcj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 Mar 2021 16:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236438AbhCaUcX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Mar 2021 16:32:23 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04CF6C061574;
        Wed, 31 Mar 2021 13:32:22 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id A1D73867;
        Wed, 31 Mar 2021 20:32:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A1D73867
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1617222742; bh=v0IjrHFfqIojGkegIjX604oY9b4ajeeSp2r4MVDSf5o=;
        h=From:To:Subject:In-Reply-To:References:Date:From;
        b=bd2NSRJpfuxiltCZ+FWzuWKuS2/usGxc+jCiI8vrDLg8TjF/cP16aGt7u5xgtK1eN
         2ShSe1PS2dSsgKAE3q7qTsHj/ArnUEl1fWfLOSqzxcWqNt2hcLTlNlf3mLHH2W9MVP
         XEncQGMq2Qt2zI6ePuIpD7edrEf/HpBBbc5Me7CFxjYZNWrar6JW/aCA53tpFIHtiO
         tMw60jXVnCrJCy/8+ht6B3XBxqAQs/sLmGLAEGA1i0IMZ+w9LTVJRtEYYWXpcmN1Bl
         Ul/CdNGCKKHk3s/QgUJ5KqdnR2j0xkv9pb/maCyVpZltzf2XFVGY1IJtihr7OQ+JGd
         d/WyddbSU1AcQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wang Qing <wangqing@vivo.com>, Wang Qing <wangqing@vivo.com>,
        Joe Perches <joe@perches.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] doc: admin-guide: remove explanation of "watchdog/%u"
In-Reply-To: <1615801744-31548-1-git-send-email-wangqing@vivo.com>
References: <1615801744-31548-1-git-send-email-wangqing@vivo.com>
Date:   Wed, 31 Mar 2021 14:32:22 -0600
Message-ID: <87mtujjc89.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wang Qing <wangqing@vivo.com> writes:

> "watchdog/%u" threads has be replaced by cpu_stop_work, 
> which will mislead the reader.
>
> Signed-off-by: Wang Qing <wangqing@vivo.com>
> ---
>  .../admin-guide/kernel-per-CPU-kthreads.rst          | 20 --------------------
>  1 file changed, 20 deletions(-)

Applied, thanks.

jon
