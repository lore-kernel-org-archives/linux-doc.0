Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 900147DF86
	for <lwn-linux-doc@archive.lwn.net>; Mon, 25 Jun 2018 16:38:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752819AbeFYQin (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 25 Jun 2018 12:38:43 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46006 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752286AbeFYQim (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jun 2018 12:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=00lWR76EPRxqdazQnRbTEd2SjXK+alBJSlw2sX7RI8U=; b=fKFU9TuyPIr+Urmvgffe0+fSn
        ufXIqFKUvlM8Kf19g4tuwyCk0u5k7p8jHuuAGfiqGlFOfytRAFYFqB3mn+vkzpw7m3r7+Wn30XxHM
        rEyIB06c9AfsrS7soui99cH8XoNxqSztPKOqVPvgujMcCma5J1lk7ziIevj+87t+fOkAmOICGZxiw
        KHlcB70ORs7d3Vh5VnkNyDp4K9acczfpsj0YmU2No5S2+P2GmqzVkgb6fewfwBdnvX0xSVM3GFbiw
        csrjp+n14rzzLezqbzYCrUCJzdhl+U8QwiNsLh2xCrrFA1XaKLLidW7y0mdtSleQmlDR62WpxzJmQ
        1eoWRxbyg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fXUVa-00049I-D0; Mon, 25 Jun 2018 16:38:30 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 955872029FA0A; Mon, 25 Jun 2018 18:38:28 +0200 (CEST)
Date:   Mon, 25 Jun 2018 18:38:28 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Daniel Lustig <dlustig@nvidia.com>
Cc:     Andrea Parri <andrea.parri@amarulasolutions.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Will Deacon <will.deacon@arm.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] doc: Update wake_up() & co. memory-barrier guarantees
Message-ID: <20180625163828.GV2458@hirez.programming.kicks-ass.net>
References: <1529918258-7295-1-git-send-email-andrea.parri@amarulasolutions.com>
 <20180625095031.GX2494@hirez.programming.kicks-ass.net>
 <20180625105618.GA12676@andrea>
 <20180625123121.GY2494@hirez.programming.kicks-ass.net>
 <20180625131643.GA15126@andrea>
 <20180625141830.GC2494@hirez.programming.kicks-ass.net>
 <20180625145611.GA16333@andrea>
 <bad7783b-9510-0049-b10a-a0d7f7273b57@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bad7783b-9510-0049-b10a-a0d7f7273b57@nvidia.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 25, 2018 at 08:44:14AM -0700, Daniel Lustig wrote:
> RISC-V is (other-)multi-copy-atomic, so I don't think transitivity
> should be an issue here.

Ah, ok.

> We do have a "fence w,r", but we decided to warn against actually using
> it for a few reasons: 1) lack of known common use cases :), 2) IIRC
> there was some corner case discrepancy between the axiomatic and
> operational models if we allowed it, and 3) in practice, it's already
> both expensive enough and obscure enough that many or most
> implementations will simply just treat it as "fence rw,rw" anyway.

Because the majority of the cost is flushing the store-buffer in either
case?

> So, in theory, "fence w,r" should be enough to prevent SB-like patterns.
> It's just not yet clear that it's a big enough win that it's worth
> creating a new fence macro for it, or pulling the current RISC-V
> recommendation against its use.  What do you all think?

It was mostly a theoretical argument for why smp_mb() is too strong, not
a real practical desire to have w,t.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
