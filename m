Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53FC6C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  7 Dec 2021 14:57:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238317AbhLGPBM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Dec 2021 10:01:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238316AbhLGPBL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Dec 2021 10:01:11 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DB29C061574
        for <linux-doc@vger.kernel.org>; Tue,  7 Dec 2021 06:57:41 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4821B378;
        Tue,  7 Dec 2021 14:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4821B378
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638889061; bh=7/M4JI7i9rPVlildLio81V4m/RivCqZlI9oNp1nHNkU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Ewjnb4RVSOnvQsK8zbe1DlVyFMlAy5zt2uvsg5Yvl+s/k8Mi1BsjUeVPtj77GpM7u
         bA1Hw4lttZ+n0qtRxnC9zt+EXco028gHq48d+fmV0/4CG+OtZuE9KpRBRXVGfH3na/
         8zCyD/BDCFLt2e1CaLroPLQo4LRBT7Nbx9fVjj/9+MJL3OwTrLr28lvvTG/hDnUpz0
         C91LVcwYWNcFlaCJzfrDnEohDXFCuEE6AhtSSagm1w7uCdP91PDAHVgNmI0qt+sdZa
         MOYPZ3hyGd2irPBKztc8RitCicBBHA7NwQlGl2LR2sEnn2Ef9K0itS8DEQV9+kdd81
         kWWaTGQ6I9s5A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Alex Shi <seakeel@gmail.com>, Tang Yizhou <tangyizhou@huawei.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        yanteng si <siyanteng01@gmail.com>,
        Alex Shi <alexs@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        zhengbin13@huawei.com, Yeechou Tang <tangyeechou@gmail.com>
Subject: Re: [PATCH 1/1] docs/zh_CN: Add sched-capacity translation
In-Reply-To: <CAJy-AmmdGQndsx3MDhYCgqawc-JRib7-YGm1oDit2hW1otbjuQ@mail.gmail.com>
References: <20211206090911.26487-1-tangyizhou@huawei.com>
 <20211206090911.26487-2-tangyizhou@huawei.com>
 <CAJy-Am=C4A6FBV2P4nB3zPsP7NbFn6nyhqT2wB9+dgEa2V-0pQ@mail.gmail.com>
 <f01d3083-c1d6-54c1-fb5a-2d00b2357762@huawei.com>
 <CAJy-AmmdGQndsx3MDhYCgqawc-JRib7-YGm1oDit2hW1otbjuQ@mail.gmail.com>
Date:   Tue, 07 Dec 2021 07:57:40 -0700
Message-ID: <87ee6o1mzf.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Alex Shi <seakeel@gmail.com> writes:

> What the result of scripts/checkpatch.pl or make htmldocs say?
> Let's tame these tools and follow the regluar styles of kernel.

checkpatch knows nothing about different languages, and "make htmldocs"
doesn't do that sort of stylistic checking.

I don't know enough (i.e. anything :) to have an opinion on the best
length for lines of Chinese text.  Surely there must be some conventions
out there?

Thanks,

jon
