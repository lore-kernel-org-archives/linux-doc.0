Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82386C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 16:53:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4AF0122525
	for <linux-doc@archiver.kernel.org>; Mon, 21 Dec 2020 16:53:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbgLUQwv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 21 Dec 2020 11:52:51 -0500
Received: from ms.lwn.net ([45.79.88.28]:46574 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725818AbgLUQwv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 21 Dec 2020 11:52:51 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id E57DD559;
        Mon, 21 Dec 2020 16:52:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E57DD559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1608569531; bh=zU/ImX3dYug5rs168rDTfGTntJalI3vNWiNUsmAt2o4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DFLZ8IDNYEg74uOt9IXnkrZxmIGUm3PyL3ltclX56/7pRJVlfWqoB3MpwOxVpCL7v
         qg+nnTXoSdBFxZAo0r6xTlCYKEENt/qwdIGnOuGAQs9Y2qgIWyPCMp0PFYRY8VQACz
         CGJj0xT6yhkMPr7StXTLTtrJKvxB9rIuuV3MCgM+8L2dLamzrJ35utbC1fKZt9F6fD
         7RABjunTQNWAt2YIHHVeJku7U6PcL/el6+aCPQNP/IPWIL9LBsnzpL4b7NJKV5BK66
         fdbrPqPtvA3h27ZkGkDixfMP9yIPr3Xhpk6CPK3ejAc4tACTXoGMV12A/4JN86gUDL
         F4cvXN0/Gmlgg==
Date:   Mon, 21 Dec 2020 09:52:09 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Milan Lakhani <milan.lakhani@codethink.co.uk>
Cc:     linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech,
        linux-doc@vger.kernel.org, lukas.bulwahn@gmail.com,
        sudip.mukherjee@codethink.co.uk, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] Documentation: process: Correct numbering
Message-ID: <20201221095209.4dd4233e@lwn.net>
In-Reply-To: <1608064956-5512-1-git-send-email-milan.lakhani@codethink.co.uk>
References: <1608064956-5512-1-git-send-email-milan.lakhani@codethink.co.uk>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 15 Dec 2020 20:42:36 +0000
Milan Lakhani <milan.lakhani@codethink.co.uk> wrote:

> Renumber the steps in submit-checklist.rst as some numbers were skipped.
> 
> Fixes: 72deb455b5ec ("block: remove CONFIG_LBDAF")
> Signed-off-by: Milan Lakhani <milan.lakhani@codethink.co.uk>
> ---
>  Documentation/process/submit-checklist.rst | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/process/submit-checklist.rst b/Documentation/process/submit-checklist.rst
> index 1879f88..230ee42 100644
> --- a/Documentation/process/submit-checklist.rst
> +++ b/Documentation/process/submit-checklist.rst
> @@ -75,44 +75,44 @@ and elsewhere regarding submitting Linux kernel patches.
>  13) Has been build- and runtime tested with and without ``CONFIG_SMP`` and
>      ``CONFIG_PREEMPT.``
>  
> -16) All codepaths have been exercised with all lockdep features enabled.
> +14) All codepaths have been exercised with all lockdep features enabled.
>  
> -17) All new ``/proc`` entries are documented under ``Documentation/``
> +15) All new ``/proc`` entries are documented under ``Documentation/``
[...]

I've applied this, but, if you're going to stick a "Fixes" tag onto a
patch, it's probably only polite to copy the original author.  I'm not
fully convinced that the tag is warranted in this case.

This document seems out of date in a number of ways; it could really use a
rather more thorough updating than this.

Thanks,

jon
