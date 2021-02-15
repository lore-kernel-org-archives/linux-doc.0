Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B42AAC433E9
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 18:22:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AD5564DEE
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 18:22:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbhBOSWg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 13:22:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230031AbhBOSWa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Feb 2021 13:22:30 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E5C2C061574
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 10:21:50 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::e2d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 649CD5CC;
        Mon, 15 Feb 2021 18:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 649CD5CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1613413309; bh=a766pukE3Vc9nzgYjSEj5lJCT4CDP9OHh/v8q70x4V8=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Atdxq9VD1ZZY6T90nNV9aOWb735DAsWW/atqjh3wqhQJGoloQWtOs1Q4Sl3I4enTm
         Oz2tYm7drLCcxwFnavNDZyRQoxduGS0/vKnz4gEPKVxCTgog7xgrV4VMX3an2Tpt9v
         pk5/J1eLXwR8k9Iz+R324rnLDTZKQeM4IENJnMD04/8GyFDlaySFfCVq3koM0BxJvz
         P7bJjluc1aLif5Y/M3ugePlfILmPBV76zvxLQeJbPj8fy/McuBybk1RkW6GcHIYivl
         rAqennTl//LAejeEHusVTEAQ+0SsnVEvm793g4dD+a0yKuNd4mR0vZl5bALWTD+08A
         af79vSLtTygdg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] Fix unaesthetic indentation
In-Reply-To: <20210215163657.GE2858050@casper.infradead.org>
References: <20210215161757.GD2858050@casper.infradead.org>
 <87k0r9mgt3.fsf@meer.lwn.net>
 <20210215163657.GE2858050@casper.infradead.org>
Date:   Mon, 15 Feb 2021 11:21:48 -0700
Message-ID: <87y2fp42f7.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Matthew Wilcox <willy@infradead.org> writes:

>> The alternative would be:
>> 
>>           possible issues in the generated output.\n''')
>
> Do you want me to submit a revised patch with that change?

No worries, I can tweak it.

Thanks,

jon
