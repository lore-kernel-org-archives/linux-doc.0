Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 093ACC56201
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 10:46:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6890020878
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 10:46:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="z5MeP68s"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1770261AbgJZKqa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 06:46:30 -0400
Received: from merlin.infradead.org ([205.233.59.134]:50334 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1770920AbgJZKq3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 06:46:29 -0400
X-Greylist: delayed 4081 seconds by postgrey-1.27 at vger.kernel.org; Mon, 26 Oct 2020 06:46:29 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=JyXZi/ERFgCbfx8pduwl1A0Zv/jNhz7fITwwiik2EAE=; b=z5MeP68s5Hpby0cnErRe3vB+nX
        6uoKnjd5XfNZAB+yQSWF2NvVdlUE9oELbv3oy3DJf5tA2HjasYsJkpun3eH9EzHLR/2ng1fOwP6Rh
        YnJQIZYLqWQBkCmZ9aWCWcsu15ute6d2QpEMjuSSRmwhj4VlYGuoJjNaBRAkp8kDfpeDbOPfuaJ9v
        kVkSxjk4/ZN15Br9XwdmFQEkx37oSqNiHQQoQH8Sge2jgpMDfPxRrU3HgevSV6Gb2VxIeA6B0iyuc
        HJVBw635zaje1ZEUcwghbGFg8QYviyfHusbtBEKyZODZ92MkRF9bRL/vVtiWQ/CaAErV+T2L83GWz
        IW6kD3vw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kWyxL-0001px-I0; Mon, 26 Oct 2020 09:38:24 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 15DFE301179;
        Mon, 26 Oct 2020 10:38:22 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 0098320325EC8; Mon, 26 Oct 2020 10:38:21 +0100 (CET)
Date:   Mon, 26 Oct 2020 10:38:21 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Jann Horn <jannh@google.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 49/56] refcount.h: fix a kernel-doc markup
Message-ID: <20201026093821.GG2628@hirez.programming.kicks-ass.net>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <fd94a95cfe01b97190b6ffb9e942cb4bbeeaa6bf.1603469755.git.mchehab+huawei@kernel.org>
 <202010231039.DE05B63@keescook>
 <20201023193907.GI2974@worktop.programming.kicks-ass.net>
 <20201023134757.628f91b7@lwn.net>
 <20201024082827.08ad3010@coco.lan>
 <20201026081059.GB2628@hirez.programming.kicks-ass.net>
 <20201026101620.1a11ef3e@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201026101620.1a11ef3e@coco.lan>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Oct 26, 2020 at 10:16:20AM +0100, Mauro Carvalho Chehab wrote:
> Em Mon, 26 Oct 2020 09:10:59 +0100
> Peter Zijlstra <peterz@infradead.org> escreveu:
> 
> > On Sat, Oct 24, 2020 at 08:28:27AM +0200, Mauro Carvalho Chehab wrote:
> > > If the intent is to document the struct and its internal fields,
> > > this kernel-doc should work:
> > > 
> > > 	/**
> > > 	 * struct refcount_struct - variant of atomic_t specialized for reference counts
> > > 	 * @refs: atomic_t counter field
> > > 	 *
> > > 	 * The counter saturates at REFCOUNT_SATURATED and will not move once
> > > 	 * there. This avoids wrapping the counter and causing 'spurious'
> > > 	 * use-after-free bugs.
> > > 	 */
> > > 
> > > Which produces this result:  
> > 
> > Who cares... :-(
> 
> Anyone that would need to use refcount_t, instead of atomic_t.

They can read the .h file just fine today.
