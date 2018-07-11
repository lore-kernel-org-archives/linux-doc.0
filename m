Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 718597D071
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 09:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726392AbeGKJdY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 05:33:24 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:51608 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726368AbeGKJdY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jul 2018 05:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=HNfZeAyOUk6CW6jcqB/Fxzu6JdX1Qdcn48KtH6knTyA=; b=Stc7DE4qm7DUgMExJifJ6g72m
        XRgpSoJ3tR8xnZSiD/MA19wKq1as9PGJlZgRMdgbh6Aa5A41PJ9Bpa1tuq8+sF2x5RcizJv4qzBlc
        Qeb5RtPLCdq61vOAD4Zd/OyBPfDtEbpXx9iv/hvQ4IJB1gtDqflOMzAUtIb92QBOh0JDQVzJxR9T7
        VTh82WrAgibyqXydHugtAuZB2poqrHr+2UpnaSAOmw9QoVDF68nFoxpSUKMMHTw+8oAzEEwBKgsYa
        I29JIkNLAXIxrnW/RFkjiaEjg+gkEZ/ze42j8X6bW1xO1LWXYHKPYdPK+d4GaO0gHBkTYtLvhb6z2
        KsKwToA1g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fdBRZ-0004eh-67; Wed, 11 Jul 2018 09:29:53 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 4F2F820291063; Wed, 11 Jul 2018 11:29:51 +0200 (CEST)
Date:   Wed, 11 Jul 2018 11:29:51 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@amacapital.net>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromiun.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>
Subject: Re: [RFC PATCH v2 16/27] mm: Modify can_follow_write_pte/pmd for
 shadow stack
Message-ID: <20180711092951.GW2476@hirez.programming.kicks-ass.net>
References: <20180710222639.8241-1-yu-cheng.yu@intel.com>
 <20180710222639.8241-17-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180710222639.8241-17-yu-cheng.yu@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 10, 2018 at 03:26:28PM -0700, Yu-cheng Yu wrote:
> There are three possible shadow stack PTE settings:
> 
>   Normal SHSTK PTE: (R/O + DIRTY_HW)
>   SHSTK PTE COW'ed: (R/O + DIRTY_HW)
>   SHSTK PTE shared as R/O data: (R/O + DIRTY_SW)

I count _2_ distinct states there.

> Update can_follow_write_pte/pmd for the shadow stack.

So the below disallows can_follow_write when shstk && _PAGE_DIRTY_SW,
but this here Changelog doesn't explain why. Doesn't even get close.

Also, the code is a right mess :/ Can't we try harder to not let this
shadow stack stuff escape arch code.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
