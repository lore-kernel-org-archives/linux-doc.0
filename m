Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8A6C2D0E4
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 18:00:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 85AC62242B
	for <linux-doc@archiver.kernel.org>; Fri, 20 Nov 2020 18:00:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728588AbgKTSAG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 20 Nov 2020 13:00:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728561AbgKTSAG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 20 Nov 2020 13:00:06 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A32AC0613CF
        for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2020 10:00:06 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0881835A;
        Fri, 20 Nov 2020 18:00:04 +0000 (UTC)
Date:   Fri, 20 Nov 2020 11:00:03 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Szabolcs Nagy <szabolcs.nagy@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        adobriyan@gmail.com
Subject: Re: [PATCH] Documentation: document /proc api for arm64 MTE vm
 flags
Message-ID: <20201120110003.5bba61d5@lwn.net>
In-Reply-To: <20201120144408.GE24344@gaia>
References: <20201106101940.5777-1-szabolcs.nagy@arm.com>
        <20201120144408.GE24344@gaia>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 20 Nov 2020 14:44:09 +0000
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Fri, Nov 06, 2020 at 10:19:40AM +0000, Szabolcs Nagy wrote:
> > Document that /proc/PID/smaps shows PROT_MTE settings in VmFlags.
> > Support for this was introduced in
> > 
> >   commit 9f3419315f3cdc41a7318e4d50ba18a592b30c8c
> >   arm64: mte: Add PROT_MTE support to mmap() and mprotect()
> > 
> > Signed-off-by: Szabolcs Nagy <szabolcs.nagy@arm.com>
> > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: linux-doc@vger.kernel.org
> > ---
> >  Documentation/filesystems/proc.rst | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
> > index 533c79e8d2cd..e5fa972d4c76 100644
> > --- a/Documentation/filesystems/proc.rst
> > +++ b/Documentation/filesystems/proc.rst
> > @@ -546,6 +546,7 @@ encoded manner. The codes are the following:
> >      nh    no huge page advise flag
> >      mg    mergable advise flag
> >      bt    arm64 BTI guarded page
> > +    mt    arm64 MTE allocation tags are enabled
> >      ==    =======================================
> >  
> >  Note that there is no guarantee that every flag and associated mnemonic will  
> 
> Are you ok with picking up this patch (it can be left for 5.11) or
> should I queue it in the arm64 tree?

It wasn't sent to me, so it wasn't on my radar.  Up to you, I'm happy to
grab it if you'd prefer.

Thanks,

jon
