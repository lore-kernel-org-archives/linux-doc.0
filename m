Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E0DFC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 18:42:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbiBXSnH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Feb 2022 13:43:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230211AbiBXSnG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Feb 2022 13:43:06 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 220101B71BB
        for <linux-doc@vger.kernel.org>; Thu, 24 Feb 2022 10:42:35 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 350422E0;
        Thu, 24 Feb 2022 18:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 350422E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1645728155; bh=8ryE/0oRMNwDYs7ZbSdv/kmOvYonw6UZh+oRKYcz3dg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=KDwVQuJHqpL7b5eX4MxVoJGnlz/Urlr1GntTYVcjCsC/2M2HAEnexKitWujGd7yLU
         +rM5Cj/3O10Qv254iy0t24Hx8ZJNhYzF1vHwr46Cn4XMbi1AqeLjc8iCxr0U3eGFrM
         DqFdLPB7iOHEHh8CJ4eUiT5q59zknkzZC/GIHfYBH62bLQgQq8iIzgr3O1AS/Rzk7R
         eOTVXG6oTx0P8lJeYx7/DlptfoiCpj9YOdHYYS/Hm95Cj+vucoNQcZSwauV0dxJEwx
         XrxhcE5Bpc+HPnY1K4tgyx/JGxefKRWQOb0L22T5G9H1y3acQ7BZ1KFNL8qnGVmdeh
         FFVEg+0PImmeg==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Akira Yokosawa <akiyks@gmail.com>,
        Tomasz =?utf-8?B?V2FybmllxYLFgm8=?= <tomasz.warniello@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 00/11] Transform documentation into POD
In-Reply-To: <6a057644-7266-8c6b-76be-09b8d205e4d9@gmail.com>
References: <525f3696-91f4-5a4a-c9ef-24758ccaa2bb@infradead.org>
 <ff98f455-0221-7ff0-08ed-8dea9f08694b@gmail.com>
 <939ef119-8a84-9206-bd7c-cfd215bb0200@gmail.com>
 <20220223135548.27babd85@fuji.fritz.box>
 <1abcb226-dbfd-b3d2-5453-208af7faa0c2@gmail.com>
 <20220223150403.350ba3d0@fuji.fritz.box>
 <6a057644-7266-8c6b-76be-09b8d205e4d9@gmail.com>
Date:   Thu, 24 Feb 2022 11:42:34 -0700
Message-ID: <87v8x4ksx1.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Akira Yokosawa <akiyks@gmail.com> writes:

> Apparently, users of ./scripts/kernel-doc are who run "make htmldocs" or
> "make pdfdocs", a relatively small portion of Linux kernel development
> community, I guess.  Note that they don't have direct interactions with
> ./scripts/kernel-doc in most (>95% ??) cases.
>
> Normal Linux end-users don't bother with kernel-doc, I guess.

In my experience, directly running kernel-doc is usually part of the
process of trying to figure out why kerneldoc comments aren't rendering
as expected; otherwise it's completely hidden.  I do think that these
changes can be helpful in that use case, and they bring the script a bit
closer to contemporary Perl standards.  Overall, I think it's a
worthwhile change.

Thanks,

jon
