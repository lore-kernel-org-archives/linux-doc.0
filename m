Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32285C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 18:44:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA43F61A31
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 18:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhCYSoJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 14:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229616AbhCYSoB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 14:44:01 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EDEDC06174A;
        Thu, 25 Mar 2021 11:44:01 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1ED12381;
        Thu, 25 Mar 2021 18:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1ED12381
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1616697841; bh=YcqsL03pJI2WiLO6wkq6SWxkDP0PGSii+GjhwvaeqPw=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Ne2pjuxyQfKyGKcYDkAPjerw4XLdCr7VlbjQnRiV4RDttTEc7VYvHw1sftS+JnsXG
         VgWGxXtO3vLr7IusTPwdZBtu9vPbEe3HYbvxceQ+Oj2tUVLHA1waF4bZ7Pwyw588Cy
         CU/iWX0Z/4EU8SyzPhXoADWNWgLw8Z7wM5MGH5d8LCe/Sb+3qEmZXcnbUyHqYRmXOO
         5O/Cb03EFYpdgnfFxYfAcBbDb0TJ3dqCojyeFt3HPVY1B0a3zTssJZ4RYo7mvhbnmu
         hjK7xNXbk+s7DCPCwVMBhCdfGXAsiCWihrCBHIzXbuRNeDCH1mJmEGBSPRvmtkAWcW
         ldutH8YufTr5A==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] docs: reporting-issues: streamline process and
 solve a FIXME
In-Reply-To: <c8770353-3d0d-17af-115a-efa4a31fd97b@leemhuis.info>
References: <cover.1616181657.git.linux@leemhuis.info>
 <c8770353-3d0d-17af-115a-efa4a31fd97b@leemhuis.info>
Date:   Thu, 25 Mar 2021 12:43:59 -0600
Message-ID: <87y2ebysy8.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thorsten Leemhuis <linux@leemhuis.info> writes:

> That's why I'd like to speed things up a little. But for that it would
> be good to have something from you: a kind of "I like the direction
> where this patch set is heading and I'm optimistic that we get it merged
> for 5.13-rc1" message from you. With something like that I could move
> ahead as outlined above already. Do you maybe have a minute for that?

Honestly, I don't see any reason to delay this work any further, so I've
just applied the set.

Sorry for the slowness, it has been a rather harsh week.

Thanks,

jon
