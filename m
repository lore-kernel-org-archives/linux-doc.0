Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187A1C4338F
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:43:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6083604DC
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:43:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhGYUCv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Jul 2021 16:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbhGYUCv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 25 Jul 2021 16:02:51 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A74DC061757
        for <linux-doc@vger.kernel.org>; Sun, 25 Jul 2021 13:43:20 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 05ABE2E5;
        Sun, 25 Jul 2021 20:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 05ABE2E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1627245800; bh=EYVjCTAlZczL+IruFJBAxdkPiBDCK4+Z/VU5YVGxuVc=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=lF9dCEfZWWBRyjqgqjN8GCz4XjHEuoWpd/Yx9nhupuePyQ3udLd1CpYmqJMB+pd58
         skCUCBd2MabtGxsLGIByuEfYLTbeR6eFFKdtUT6fjcqX8bL876yfU/YZS1eolFdUy7
         D6l6esKSkUgMXNobh1dvXbL4BtTMvhx+kWU9hHIQuHIZ2jn17e/HZLd8aSL2odLVey
         eeIGdNPNd1r/z6DbVELg7VXI4y8dPRy+QUp6HuV2u7hmzmfgt8ZLeX47VyNBBCNTj+
         fWR547c+CRk2Y6JI5TxHB4M+Tbcrb9/TioU+y0VKicLyie2soNovraZLOQNocz3GZ5
         eKYRKt1O4Fmjg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     "xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com>
Cc:     "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "mchehab+samsung@kernel.org" <mchehab+samsung@kernel.org>,
        "bigeasy@linutronix.de" <bigeasy@linutronix.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [RESEND] admin-guide/cputopology.rst: Remove non-existed
 cpu-hotplug.txt
In-Reply-To: <60ECEA44.1040306@fujitsu.com>
References: <1624412269-13155-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <87h7gzqzhb.fsf@meer.lwn.net> <60ECEA44.1040306@fujitsu.com>
Date:   Sun, 25 Jul 2021 14:43:19 -0600
Message-ID: <871r7muntk.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"xuyang2018.jy@fujitsu.com" <xuyang2018.jy@fujitsu.com> writes:

>> Is there a reason why you took out the reference to cpu-hotplug.txt
>> entirely rather than switching it to the rst file?
> Because rst file doesn't have HOTPLUGGED off information and
> ABI/testing/sysfs-devices-system-cpu file for offline  also doesn't have
> cpu-hotplug.txt or rst file.
>
> So I think removing it is better.

OK, I've gone ahead and applied it.

Thanks,

jon
