Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D673C4338F
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:11:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA459603E7
	for <linux-doc@archiver.kernel.org>; Sun, 25 Jul 2021 20:11:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhGYTbU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 25 Jul 2021 15:31:20 -0400
Received: from ms.lwn.net ([45.79.88.28]:41742 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229709AbhGYTbU (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 25 Jul 2021 15:31:20 -0400
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id D43C52E5;
        Sun, 25 Jul 2021 20:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D43C52E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1627243910; bh=RHiih0sbDS0ddNNrbXNoza75JT3+DbSceexQxA/SrV0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=IgxOxr7MYziszpjx9NCi0IWE4wzvo3lrbMz9oPCUCcPfwydVpDN2lT1zK44pGYpYE
         q8NBl5KpKY9kLY1/j7yajIqlXlBAoryt4iBh3q2qnf/uFCN2facNag88ULfsNA9g76
         4eImI3apRUnkCM2goL6ApReCxqQBr3ajgIkwyGVcmzZaJRSz9K1XDUMonTnhVbExiL
         3yjg0hnbpoPPpz+kQ4JNjqnBsPmqcu2mYClRFPPYE0B6Bpcmf1R2QP8g7sGBhCvEUw
         lBQNnQxHMJ0hlX6PlfYnQ29QfbIFWII8bZu/rQiedpBcKX8rXR1MBBZ/XowwsZwgD4
         n7M5bwtq1u7QQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     pioneer695 <pioneer695@protonmail.com>
Cc:     "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: make cleandocs issue: rm -rf /output when obj not defined
In-Reply-To: <hMV_L3bAsgmBToxsfiYBJDxTBoLHll-1BOk7FvqialjmZFNDp14Bq69ddTVagVH49yViCM43-yFpZ39Kfr6geVK7ota0QhCDA4MaC_5vILY=@protonmail.com>
References: <hMV_L3bAsgmBToxsfiYBJDxTBoLHll-1BOk7FvqialjmZFNDp14Bq69ddTVagVH49yViCM43-yFpZ39Kfr6geVK7ota0QhCDA4MaC_5vILY=@protonmail.com>
Date:   Sun, 25 Jul 2021 14:11:49 -0600
Message-ID: <875ywyw3ui.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

pioneer695 <pioneer695@protonmail.com> writes:

> In an attempt to get some readable documentation I cloned the git repository
> to check how the PDF format is.
>
> Entered Documentation and proceeded with:
>
> 	make pdfdocs
>
> which failed, so to start fresh, my thought was that:
>
> 	make cleandocs
>
> would be the next step before anything else. But, this resulted in:
>
> 	rm -rf /output

That's not good...

> as $(obj) for some reason was empty.

*This* would appear to be the real problem.  If you could do some
digging to figure out why that happened, I suspect that would be
useful. 

> Makefile for Documentation has:
>
> 	BUILDDIR      = $(obj)/output
>
> 	cleandocs:
> 		$(Q)rm -rf $(BUILDDIR)
>
>
> This should (at least?!) be:
>
> 	BUILDDIR      = ./$(obj)/output
> or:
> 	$(Q)rm -rf ./$(BUILDDIR)

These would break builds for a lot of people and are not the right
solution.

Thanks for the report,

jon
