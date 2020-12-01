Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3FFAC64E7A
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 19:04:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D11A2151B
	for <linux-doc@archiver.kernel.org>; Tue,  1 Dec 2020 19:04:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729859AbgLATEv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Dec 2020 14:04:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:45466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbgLATEv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 Dec 2020 14:04:51 -0500
Received: from gaia (unknown [95.146.230.165])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 131DE20643;
        Tue,  1 Dec 2020 19:04:08 +0000 (UTC)
Date:   Tue, 1 Dec 2020 19:04:06 +0000
From:   Catalin Marinas <catalin.marinas@arm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Szabolcs Nagy <szabolcs.nagy@arm.com>, adobriyan@gmail.com,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: document /proc api for arm64 MTE vm flags
Message-ID: <20201201190406.GC2502@gaia>
References: <20201106101940.5777-1-szabolcs.nagy@arm.com>
 <20201120144408.GE24344@gaia>
 <20201120110003.5bba61d5@lwn.net>
 <20201120222413.GA28722@gaia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120222413.GA28722@gaia>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

On Fri, Nov 20, 2020 at 10:24:13PM +0000, Catalin Marinas wrote:
> On Fri, Nov 20, 2020 at 11:00:03AM -0700, Jonathan Corbet wrote:
> > On Fri, 20 Nov 2020 14:44:09 +0000
> > Catalin Marinas <catalin.marinas@arm.com> wrote:
> > 
> > > On Fri, Nov 06, 2020 at 10:19:40AM +0000, Szabolcs Nagy wrote:
> > > > Document that /proc/PID/smaps shows PROT_MTE settings in VmFlags.
> > > > Support for this was introduced in
> > > > 
> > > >   commit 9f3419315f3cdc41a7318e4d50ba18a592b30c8c
> > > >   arm64: mte: Add PROT_MTE support to mmap() and mprotect()
> > > > 
> > > > Signed-off-by: Szabolcs Nagy <szabolcs.nagy@arm.com>
> > > > Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> > > > Cc: linux-doc@vger.kernel.org
> > > > ---
> > > >  Documentation/filesystems/proc.rst | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
> > > > index 533c79e8d2cd..e5fa972d4c76 100644
> > > > --- a/Documentation/filesystems/proc.rst
> > > > +++ b/Documentation/filesystems/proc.rst
> > > > @@ -546,6 +546,7 @@ encoded manner. The codes are the following:
> > > >      nh    no huge page advise flag
> > > >      mg    mergable advise flag
> > > >      bt    arm64 BTI guarded page
> > > > +    mt    arm64 MTE allocation tags are enabled
> > > >      ==    =======================================
> > > >  
> > > >  Note that there is no guarantee that every flag and associated mnemonic will  
> > > 
> > > Are you ok with picking up this patch (it can be left for 5.11) or
> > > should I queue it in the arm64 tree?
> > 
> > It wasn't sent to me, so it wasn't on my radar.  Up to you, I'm happy to
> > grab it if you'd prefer.
> 
> Please do grab it. Thanks.

In case it slipped through the cracks (I haven't seen it in -next).
Otherwise I'll queue it sometime later this week for 5.11.

Thanks.

-- 
Catalin
