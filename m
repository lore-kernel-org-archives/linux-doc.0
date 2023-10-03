Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F71FE7545E
	for <linux-doc@archiver.kernel.org>; Tue,  3 Oct 2023 18:38:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240783AbjJCSi7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 3 Oct 2023 14:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240799AbjJCSi6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Oct 2023 14:38:58 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA5A0AB
        for <linux-doc@vger.kernel.org>; Tue,  3 Oct 2023 11:38:52 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::646])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5F6B22B4;
        Tue,  3 Oct 2023 18:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5F6B22B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1696358332; bh=RQyO/2bdSk6r3oat5KVsSdCZhnzSueej+3pve/BSzcQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=rVTsblE0KOXsooUe/LMTKcsgR2bVGyDbrj1+u0/yaymi/5jfBponcvgTme35Wy9ii
         qpBdWAGBfa81dQBQLh0uohp6v/TXSRwCo7IphXq81ln++YAJsa4w07WnlY5PxqA3ia
         i8n4XtUAQz4RWYDgjk0D5ubrWpIi28LAVMTJiU1+rmGYGn9mwvMYGTnmOlUmKaueat
         RItrH9F+qTtNADi0ggqRGopauzoVhMUoV2nbNTzLXhGE/cGaIn1N33Uvsj8phUeSKU
         ITSv4RdRrTtgIDXZup3pLuyDmH2ZNLunjH2Qwewk5Ud+YDv6DCvipgkv3tFmnR8Ee7
         U7QWsZwZGAEVA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        linux-doc@vger.kernel.org
Cc:     "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Carlos Bilbao <carlos.bilbao@amd.com>
Subject: Re: [PATCH] doc: Always check kernel-doc
In-Reply-To: <20230817144142.903553-1-willy@infradead.org>
References: <20230817144142.903553-1-willy@infradead.org>
Date:   Tue, 03 Oct 2023 12:38:51 -0600
Message-ID: <87bkdf5z5w.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"Matthew Wilcox (Oracle)" <willy@infradead.org> writes:

> kernel-doc checks were initially enabled only for builds which had extra
> warnings enabled.  We have now eliminated enough kernel-doc warnings that
> we can enable kernel-doc checking by default.  This comes at a slight
> cost; for an allmodconfig build, make -j8 fs/ timings on my laptop
> increase by less than 5%:
>
> before real     4m7.456s        4m4.416s        4m6.663s
> after real      4m18.960s       4m21.566s       4m23.234s
> before user     29m35.370s      29m11.036s      29m30.092s
> after user      30m55.602s      31m10.918s      31m20.311s
> before sys      2m8.230s        2m6.392s        2m9.727s
> after sys       2m19.896        2m23.422s       2m25.762s
>
> This feels like a reasonable price to pay to force people to keep
> documentation up to date.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
> ---
>  scripts/Makefile.build | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

So I finally got around to actually giving this a try ...

It adds 1,095 warnings to an allmodconfig build here.  If I merge that,
I suspect that next thing that happens will be One Of Those Emails from
Linus... and perhaps from others as well.

If we had a series that drove the number to zero prior to this change,
it would be a different story.  I'm kind of thrashing and don't think I
can do that in the near future, as nice as it would be.  I suspect
there's not a lot of other folks just waiting for a chance to do this
either.

As nice as it would be to have this, I don't think it would survive to a
mainline release if I tried to push it now.  But maybe others disagree?

Thanks,

jon
