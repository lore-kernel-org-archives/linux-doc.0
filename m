Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DE2F97D099
	for <lwn-linux-doc@archive.lwn.net>; Tue, 30 Oct 2018 17:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbeJaCw7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 30 Oct 2018 22:52:59 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:48696 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727771AbeJaCw7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Oct 2018 22:52:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hOYWHalG3Y75DkapHEk+KGS33M+jo0PxnQZRMWWEPDw=; b=LAUn5VAFrKdjhcQJb1i0SEG9p
        cPOEsORxwVWPJv5gMmVTLPOHIsr6cdXMqOGAtudMvPcYlS5R4WMumsACsgk56M9TWUYIlAmtw+X6v
        JP/D3xGnSmjXGlHRrORSwx0D4zH1EQn2fFj5XYRWj4nNmiPrQ/GTrEAfserDocmzdiZk/lXDWUG9n
        UdcxqXbixNbKD3cREqhDzoRNDI9wc9lffAPTwS2ufz/+DM28yfxiEGdZQjhT3hryTxkGT2ACvcVCK
        KkHcVdLTdaCRHOwSuMQQgdchI1SUHFTfAyw261MrKSyiSnVJDPkk/iqFK0oOpqY5L+qR2BPrXqvYa
        jXgR9dzCA==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gHYHO-0001qf-Ff; Tue, 30 Oct 2018 17:58:14 +0000
Date:   Tue, 30 Oct 2018 10:58:14 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Andy Lutomirski <luto@amacapital.net>
Cc:     Kees Cook <keescook@chromium.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Igor Stoppa <igor.stoppa@gmail.com>,
        Mimi Zohar <zohar@linux.vnet.ibm.com>,
        Dave Chinner <david@fromorbit.com>,
        James Morris <jmorris@namei.org>,
        Michal Hocko <mhocko@kernel.org>,
        Kernel Hardening <kernel-hardening@lists.openwall.com>,
        linux-integrity <linux-integrity@vger.kernel.org>,
        linux-security-module <linux-security-module@vger.kernel.org>,
        Igor Stoppa <igor.stoppa@huawei.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Laura Abbott <labbott@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 10/17] prmem: documentation
Message-ID: <20181030175814.GB10491@bombadil.infradead.org>
References: <20181023213504.28905-1-igor.stoppa@huawei.com>
 <20181023213504.28905-11-igor.stoppa@huawei.com>
 <20181026092609.GB3159@worktop.c.hoisthospitality.com>
 <CAGXu5jKCs01jvtvpEFS7R8qCR-5iRqK11kJxLJY99NicGWc4aQ@mail.gmail.com>
 <20181028183126.GB744@hirez.programming.kicks-ass.net>
 <40cd77ce-f234-3213-f3cb-0c3137c5e201@gmail.com>
 <20181030152641.GE8177@hirez.programming.kicks-ass.net>
 <CAGXu5jJftJ+Hq+jrZGHX5CTDLWOog7kGsd_Ne=yMvrRs__skSg@mail.gmail.com>
 <0A7AFB50-9ADE-4E12-B541-EC7839223B65@amacapital.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0A7AFB50-9ADE-4E12-B541-EC7839223B65@amacapital.net>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 30, 2018 at 10:06:51AM -0700, Andy Lutomirski wrote:
> > On Oct 30, 2018, at 9:37 AM, Kees Cook <keescook@chromium.org> wrote:
> I support the addition of a rare-write mechanism to the upstream kernel.
> And I think that there is only one sane way to implement it: using an
> mm_struct. That mm_struct, just like any sane mm_struct, should only
> differ from init_mm in that it has extra mappings in the *user* region.

I'd like to understand this approach a little better.  In a syscall path,
we run with the user task's mm.  What you're proposing is that when we
want to modify rare data, we switch to rare_mm which contains a
writable mapping to all the kernel data which is rare-write.

So the API might look something like this:

	void *p = rare_alloc(...);	/* writable pointer */
	p->a = x;
	q = rare_protect(p);		/* read-only pointer */

To subsequently modify q,

	p = rare_modify(q);
	q->a = y;
	rare_protect(p);

Under the covers, rare_modify() would switch to the rare_mm and return
(void *)((unsigned long)q + ARCH_RARE_OFFSET).  All of the rare data
would then be modifiable, although you don't have any other pointers
to it.  rare_protect() would switch back to the previous mm and return
(p - ARCH_RARE_OFFSET).

Does this satisfy Igor's requirements?  We wouldn't be able to
copy_to/from_user() while rare_mm was active.  I think that's a feature
though!  It certainly satisfies my interests (kernel code be able to
mark things as dynamically-allocated-and-read-only-after-initialisation)
