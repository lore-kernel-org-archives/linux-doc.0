Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9A3217D048
	for <lwn-linux-doc@archive.lwn.net>; Wed, 11 Jul 2018 15:28:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389066AbeGKPdI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 11 Jul 2018 11:33:08 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:56042 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732481AbeGKPdI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 11 Jul 2018 11:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Transfer-Encoding
        :Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=CiMpRUlb2je5lcCUpzH2mozLi3P9QJXirXk8qkgmZyk=; b=FDHs7YfAeoUgrqNmcF1wrBN8pT
        hCMrKv0JuJffqsMqFdmWOBrbUunnyhtbnpdhZKGisKh7IVVeXiaJcuHe404kBkak5NM2RlHcR37b1
        YV9pUBbstCoye4lK4KjcDa2hiRVXHukeMBMm7mCZbWU1CZCvwnnTxgEFPRYwOmHGUgpRA9+R9hMhk
        FgIZVKX31ekdGOTRH6Ijxnr0pdKzDEc5IZ+4DRP3my1Tkdl5g4uPJzvfQ1qcqbJEK1C5TJsC3I34W
        3NIfPuhRuT7lF3/g7uz1IFa3nZc3o2PvqQ4cwq7kf2KvK8ESbIK2TWSDnIrITKnEbD6eyQs1Z32hb
        OreDNHTw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fdH24-00071i-7V; Wed, 11 Jul 2018 15:27:56 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 9369220297EAB; Wed, 11 Jul 2018 17:27:54 +0200 (CEST)
Date:   Wed, 11 Jul 2018 17:27:54 +0200
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
Subject: Re: [RFC PATCH v2 18/27] x86/cet/shstk: Introduce WRUSS instruction
Message-ID: <20180711152754.GJ2476@hirez.programming.kicks-ass.net>
References: <20180710222639.8241-1-yu-cheng.yu@intel.com>
 <20180710222639.8241-19-yu-cheng.yu@intel.com>
 <20180711094549.GA2476@hirez.programming.kicks-ass.net>
 <1531321089.13297.4.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1531321089.13297.4.camel@intel.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 11, 2018 at 07:58:09AM -0700, Yu-cheng Yu wrote:
> On Wed, 2018-07-11 at 11:45 +0200, Peter Zijlstra wrote:
> > On Tue, Jul 10, 2018 at 03:26:30PM -0700, Yu-cheng Yu wrote:
> > > 
> > > diff --git a/arch/x86/lib/x86-opcode-map.txt b/arch/x86/lib/x86-
> > > opcode-map.txt
> > > index e0b85930dd77..72bb7c48a7df 100644
> > > --- a/arch/x86/lib/x86-opcode-map.txt
> > > +++ b/arch/x86/lib/x86-opcode-map.txt
> > > @@ -789,7 +789,7 @@ f0: MOVBE Gy,My | MOVBE Gw,Mw (66) | CRC32
> > > Gd,Eb (F2) | CRC32 Gd,Eb (66&F2)
> > >  f1: MOVBE My,Gy | MOVBE Mw,Gw (66) | CRC32 Gd,Ey (F2) | CRC32
> > > Gd,Ew (66&F2)
> > >  f2: ANDN Gy,By,Ey (v)
> > >  f3: Grp17 (1A)
> > > -f5: BZHI Gy,Ey,By (v) | PEXT Gy,By,Ey (F3),(v) | PDEP Gy,By,Ey
> > > (F2),(v)
> > > +f5: BZHI Gy,Ey,By (v) | PEXT Gy,By,Ey (F3),(v) | PDEP Gy,By,Ey
> > > (F2),(v) | WRUSS Pq,Qq (66),REX.W
> > >  f6: ADCX Gy,Ey (66) | ADOX Gy,Ey (F3) | MULX By,Gy,rDX,Ey (F2),(v)
> > >  f7: BEXTR Gy,Ey,By (v) | SHLX Gy,Ey,By (66),(v) | SARX Gy,Ey,By
> > > (F3),(v) | SHRX Gy,Ey,By (F2),(v)
> > >  EndTable
> > Where are all the other instructions? ISTR that documentation patch
> > listing a whole bunch of new instructions, not just wuss.
> 
> Currently we only use WRUSS in the kernel code.  Do we want to add all
> instructions here?

Yes, since we also use the in-kernel decoder to decode random userspace
code.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
