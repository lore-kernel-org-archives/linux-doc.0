Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2B1C57D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Nov 2018 22:29:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728277AbeKIHid (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 9 Nov 2018 02:38:33 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:34484 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728491AbeKIHic (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Nov 2018 02:38:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=hk1JID0w158EIaGcr+HCkYTvTEFZ9mw1TMrwyhEXE3Y=; b=BtgqaeN5RxYXE0oy0PLqwjh7r
        t8QVPwzmJ0q7SL0wFaHgO1ObCjn5rI/5mmcFvxdaR3RRH37tE/4PzZ23IcZnFBTYK6H6UJ25H0fa7
        3XTGbeV6la9bTYPN8n/ifIKXsxKmC3ge+wj0hyU378Bsj2KxB3xB5nk96VG/33vndqyPOusmlYvn4
        TP0ZF2O7+Wwft6xZ+/YulihwWxhQWA2ncN7h1HlRLQwtfdthqVNTAr5bxYjTePk5DiyzyN5nD4z3P
        Qu0UtelLBNrCgq+Cei4bWbG235I8j5qbMUQB840PFn9LNax5URVU4AzilITACbFN06pIAc/QUVtxg
        dDiWwfikg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gKsMA-0005k8-PU; Thu, 08 Nov 2018 22:00:54 +0000
Date:   Thu, 8 Nov 2018 14:00:54 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Dave Hansen <dave.hansen@intel.com>
Cc:     Andy Lutomirski <luto@amacapital.net>,
        Yu-cheng Yu <yu-cheng.yu@intel.com>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Balbir Singh <bsingharora@gmail.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>
Subject: Re: [PATCH v5 04/27] x86/fpu/xstate: Add XSAVES system states for
 shadow stack
Message-ID: <20181108220054.GP3074@bombadil.infradead.org>
References: <20181011151523.27101-1-yu-cheng.yu@intel.com>
 <20181011151523.27101-5-yu-cheng.yu@intel.com>
 <CALCETrVAe8R=crVHoD5QmbN-gAW+V-Rwkwe4kQP7V7zQm9TM=Q@mail.gmail.com>
 <4295b8f786c10c469870a6d9725749ce75dcdaa2.camel@intel.com>
 <CALCETrUKzXYzRrWRdi8Z7AdAF0uZW5Gs7J4s=55dszoyzc29rw@mail.gmail.com>
 <043a17ef-dc9f-56d2-5fba-1a58b7b0fd4d@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <043a17ef-dc9f-56d2-5fba-1a58b7b0fd4d@intel.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 08, 2018 at 01:48:54PM -0800, Dave Hansen wrote:
> On 11/8/18 1:22 PM, Andy Lutomirski wrote:
> >> +struct cet_kernel_state {
> >> +       u64 kernel_ssp; /* kernel shadow stack */
> >> +       u64 pl1_ssp;    /* ring-1 shadow stack */
> >> +       u64 pl2_ssp;    /* ring-2 shadow stack */
> >> +} __packed;
> >> +
> > Why are these __packed?  It seems like it'll generate bad code for no
> > obvious purpose.
> 
> It's a hardware-defined in-memory structure.  Granted, we'd need a
> really wonky compiler to make that anything *other* than a nicely-packed
> 24-byte structure, but the __packed makes it explicit.
> 
> It is probably a really useful long-term thing to stop using __packed
> and start using "__hw_defined" or something that #defines down to __packed.

packed doesn't mean "don't leave gaps".  It means:

'packed'
     The 'packed' attribute specifies that a variable or structure field
     should have the smallest possible alignment--one byte for a
     variable, and one bit for a field, unless you specify a larger
     value with the 'aligned' attribute.

So Andy's right.  It tells the compiler, "this struct will not be naturally aligned, it will be aligned to a 1-byte boundary".  Which is silly.  If we have

struct b {
	unsigned long x;
} __packed;

struct a {
	char c;
	struct b b;
};

we want struct b to start at offset 8, but with __packed, it will start
at offset 1.

Delete __packed.  It doesn't do what you think it does.
