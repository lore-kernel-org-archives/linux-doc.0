Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A043E7AD77
	for <linux-doc@archiver.kernel.org>; Tue,  3 Oct 2023 16:09:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240289AbjJCQJf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Oct 2023 12:09:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbjJCQJe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Oct 2023 12:09:34 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C018910F;
        Tue,  3 Oct 2023 09:09:18 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 6C3D46E2;
        Tue,  3 Oct 2023 16:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6C3D46E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1696349358; bh=gN4q7xZ8VSntPQTwz8g/93qY/JKghkX5R+ozb81Ymrk=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=aAtfRHRtuK0gElAVII6Tz6F0sRTZL2UMYUYzs3FrWZx5gR04Bvwf3ycEBG5/KmQ16
         XvA0gOmgkL8yl912j2ZEx9D2mTtM3gXMeFMEvfsdk3253dlADaO5O4sVMwm/TnLOMg
         uP3FiE50iNUFYtsLyiCb555oXbToGAaIkXkUNqyR9zRJ6FZuyAx2Jfp3pdJMK25DU3
         xUhWERyt6qs/tC7QNmsZkgXVSg+6d18MEh5gTe/s9R7Y0usSK1+XGdXNFWiYCrn+8P
         S4wfxj5Hd6HA+wSCxONl9CgTpuUhwjs+sVj53gzlngAL58ZUHTadpRK3j/QxkO6XQQ
         8iGJ7JEZA90cw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-doc@vger.kernel.org, Christian Brauner <brauner@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fork: Fix kernel-doc
In-Reply-To: <20230824193644.3029141-1-willy@infradead.org>
References: <20230824193644.3029141-1-willy@infradead.org>
Date:   Tue, 03 Oct 2023 10:09:17 -0600
Message-ID: <878r8jelhu.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Matthew Wilcox (Oracle)" <willy@infradead.org> writes:

> Fix the various warnings from kernel-doc in kernel/fork.c
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  kernel/fork.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

It looks like this never got picked up by anybody, so I've applied it
now.

Thanks,

jon
