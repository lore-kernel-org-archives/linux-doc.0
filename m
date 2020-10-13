Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B589C433E7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 15:02:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C69A4248CB
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 15:02:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Yfr09mI1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbgJMPCy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 11:02:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgJMPCy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Oct 2020 11:02:54 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F29C3C0613D0;
        Tue, 13 Oct 2020 08:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=+GiKfWtAn/Mfo8qZVIIc64QAMOtmuubpCnTuDECij28=; b=Yfr09mI1ZEDPaPoTWudNu967GC
        CssHCB69kfBaadvuNMM7MKvkl903XlgOcxWUnR+f0WsRzaj8Tl/2cWrgSJrveu6Yp5g6Nrf5jBGs7
        /EOHT/Yqalf3EpFg1MmIoZ3scArTCoFgL37LFdUqyYkTSCO6ZCAX+A39kSldKWHAD784FRLNF+FbD
        BmFES4JfB5pJz9WqEzlJGnW5yrs1c3otO+PRylZHmu0BNWnY8Sfuc7hmd6QEHDifhthgSaPjNNcuw
        6fxCcTCG6s/pktboWgipBLos2BnLk9JFhBCEWVwu+f2kROVQFgLw4anMBVE0EpQRWFCfPN9ZTl1ZX
        2b8Fm3TA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kSLpC-000727-93; Tue, 13 Oct 2020 15:02:50 +0000
Date:   Tue, 13 Oct 2020 16:02:50 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Boqun Feng <boqun.feng@gmail.com>,
        Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/24] docs: lockdep-design: fix some warning issues
Message-ID: <20201013150250.GJ20115@casper.infradead.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
 <c76318f859a78adb80a6eef63c5c777d05501198.1602590106.git.mchehab+huawei@kernel.org>
 <20201013125206.GU2611@hirez.programming.kicks-ass.net>
 <20201013131116.GG20115@casper.infradead.org>
 <20201013140941.GC2594@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013140941.GC2594@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 13, 2020 at 04:09:41PM +0200, Peter Zijlstra wrote:
> On Tue, Oct 13, 2020 at 02:11:16PM +0100, Matthew Wilcox wrote:
> > On Tue, Oct 13, 2020 at 02:52:06PM +0200, Peter Zijlstra wrote:
> > > On Tue, Oct 13, 2020 at 02:14:31PM +0200, Mauro Carvalho Chehab wrote:
> > > > +   =====  ===================================================
> > > > +   ``.``  acquired while irqs disabled and not in irq context
> > > > +   ``-``  acquired in irq context
> > > > +   ``+``  acquired with irqs enabled
> > > > +   ``?``  acquired in irq context with irqs enabled.
> > > > +   =====  ===================================================
> > >
> > > NAK!
> > 
> > You're seriously suggesting that:
> > 
> > -   ===  ===================================================
> > -   '.'  acquired while irqs disabled and not in irq context
> > -   '-'  acquired in irq context
> > -   '+'  acquired with irqs enabled
> > -   '?'  acquired in irq context with irqs enabled.
> > -   ===  ===================================================
> > +   =====  ===================================================
> > +   ``.``  acquired while irqs disabled and not in irq context
> > +   ``-``  acquired in irq context
> > +   ``+``  acquired with irqs enabled
> > +   ``?``  acquired in irq context with irqs enabled.
> > +   =====  ===================================================
> > 
> > this change makes the lockdep docs less readable?
> 
> Definitely makes it harder to read for me. My C trained eyes go WTF at
> seeing it, which breaks the flow. ',' is a regular single character
> constant, '','' a syntax error.

OK, that's fair.  'a' is definitely a character constant.  Perhaps
the automarkup script can take care of this for us?  We'd have to
be careful not to catch anything we shouldn't've [1], but I'm sure
there's a regex for it.  Something like "\<'.'\>", perhaps?

[1] I'm quite proud of that one.

> > It's not the markup that makes the lockdep documentation hard to
> > understand.
> 
> I'm not sure what you're alluding to, the subject just isn't easy to
> begin with.

Absolutely.  The problem is (similar to most Linux documentation)
the document doesn't know who its audience is.  It mixes internal
implementation details of lockdep with what people need to know who
are just trying to understand what a lockdep splat means.  I don't
have time to restructure it right now though.
