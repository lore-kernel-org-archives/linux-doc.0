Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 83F977D043
	for <lwn-linux-doc@archive.lwn.net>; Thu,  7 Jun 2018 18:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935074AbeFGSmP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 7 Jun 2018 14:42:15 -0400
Received: from merlin.infradead.org ([205.233.59.134]:57142 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933108AbeFGSmO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jun 2018 14:42:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=tqO+u91eIAN7O0P+p3RNq5RoYe1I0GwQgXsBlPtmveA=; b=g6CrDUvFfhZ/VuXlixaVxnEAC
        eyVDuQ80xpnTKFhHjJh4KS/RkzD7lT0p0ZQ+P1YwXdFLOTOhxwSGz7OSAUCEPUB6iFfvD5OAYAOAC
        L8B8mLqTV6mba8ZusOwC3/UrdbDT2gCfm5RwkGfadIYxPGeWT4IOhiG96qfiosy49ATLPzQ0ROyDe
        NjmkZKG9qrDulSk42RkfKy8VapOrH5VYaANwlRMH/R/NZrNmXcZ8eTRccWHXpiPbXWsgDHCbNKJUD
        FncVAPXXEyGuh1uWQigp4NuYH38guMyzliuLwM4QDoBkxjiHGv9xIENMYuu7Evdtekl/emiWC6WAz
        iJHDqx0cw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fQzqz-0002KT-2f; Thu, 07 Jun 2018 18:41:45 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 5A71D201EA7A5; Thu,  7 Jun 2018 20:41:42 +0200 (CEST)
Date:   Thu, 7 Jun 2018 20:41:42 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Andy Lutomirski <luto@kernel.org>
Cc:     Yu-cheng Yu <yu-cheng.yu@intel.com>,
        LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
        Linux-MM <linux-mm@kvack.org>,
        linux-arch <linux-arch@vger.kernel.org>, X86 ML <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        "H. J. Lu" <hjl.tools@gmail.com>,
        "Shanbhogue, Vedvyas" <vedvyas.shanbhogue@intel.com>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Oleg Nesterov <oleg@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
        mike.kravetz@oracle.com
Subject: Re: [PATCH 02/10] x86/cet: Introduce WRUSS instruction
Message-ID: <20180607184142.GJ12217@hirez.programming.kicks-ass.net>
References: <20180607143807.3611-1-yu-cheng.yu@intel.com>
 <20180607143807.3611-3-yu-cheng.yu@intel.com>
 <CALCETrU45Cuzvfz3c1+-+7=9KS2N33Bpp1JqBtaGxhPo8U+Fqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrU45Cuzvfz3c1+-+7=9KS2N33Bpp1JqBtaGxhPo8U+Fqg@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 07, 2018 at 09:40:02AM -0700, Andy Lutomirski wrote:
> Peterz, isn't there some fancy better way we're supposed to handle the
> error return these days?

Don't think so. I played with a few things but that never really went
anywhere.

Also, both asm things look suspicously similar, it might make sense to
share. Also, maybe do the instruction .byte sequence in a #define INSN
or something.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
