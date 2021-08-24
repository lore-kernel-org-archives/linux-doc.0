Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDCCC4338F
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 19:23:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C9126113A
	for <linux-doc@archiver.kernel.org>; Tue, 24 Aug 2021 19:23:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233673AbhHXTYl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Aug 2021 15:24:41 -0400
Received: from ms.lwn.net ([45.79.88.28]:58792 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232117AbhHXTYl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 24 Aug 2021 15:24:41 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5944F50E9;
        Tue, 24 Aug 2021 19:23:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5944F50E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1629833036; bh=XhE4+WmS13bzx8GC0xJP0H3SOw+ShyXY2BpMDse9AFY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=DYVUnMcfOWDIJYQPz5EAHC4T506fkc5pZsLBQE7rGLbrt9CvflU9Htvk9MXXfM/V2
         iX40fM9JhU2v3ABpZGKe5IsQZnAXJk44tQRtCil7nAXNQfwBdAontHW/bnGel1M3Hb
         5GOVk88bAGUwKUxtlHc9JJxbUd+xt7UcJE8X5U4TIRafirN8KQeIFcpcSz5KPWjHZu
         nPU05WPZEgD0ziqQUy4qmeO0TMNvESvgnGL4QG+UtbaMbJCsQQLZZExlTK3/p1C58l
         tT/90r9CwiR0K+2PIJoVM8EDCKFJORovYbjjoSXIL9KyKGnDPz1tg/OtoSQXNU7FC8
         rZfqytE8ia9hQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     SeongJae Park <sj38.park@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, SeongJae Park <sjpark@amazon.de>
Subject: Re: [PATCH 2/2] Documentation/process/maintainer-pgp-guide: Replace
 broken link to PGP path finder
In-Reply-To: <20210820184906.bcypsextkp2rm4e4@nitro.local>
References: <20210812095030.4704-1-sj38.park@gmail.com>
 <20210812095030.4704-2-sj38.park@gmail.com> <87fsv4rqfq.fsf@meer.lwn.net>
 <20210820184906.bcypsextkp2rm4e4@nitro.local>
Date:   Tue, 24 Aug 2021 13:23:55 -0600
Message-ID: <87h7femyt0.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Konstantin Ryabitsev <konstantin@linuxfoundation.org> writes:

> On Fri, Aug 20, 2021 at 11:12:09AM -0600, Jonathan Corbet wrote:
>> This looks fine to me, but I'd like Konstantin [CC'd] to have a look and
>> let me know if he agrees...
>
> Yes, this looks good to me. The entire section needs a more in-depth rewrite,
> but I'm not ready for that work yet, and this patch at least removes a dead
> link and offers some alternatives.
>
> Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

Thanks for having a look - patch applied.

jon
