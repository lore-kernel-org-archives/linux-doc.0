Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D02E37DD32
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Mar 2018 18:03:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752899AbeC1SDk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Mar 2018 14:03:40 -0400
Received: from merlin.infradead.org ([205.233.59.134]:57458 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751166AbeC1SDh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Mar 2018 14:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=8ral5wkuQs6TLHgSTW0awnWovHTYbuoT/4Dku0SV9q8=; b=jVGc49FGiZ8m2C0CB0V4cPnKn
        c6MHznqOhei83RGyHE097sCyo+dXjE/5TUa73hzPznNjRRVbl0+O/hnVjQSj2K++duCSCQLrYRWHA
        Pf95h+Jaui/45k6dirD5f8u/HXRi7ttTvitZoRtdpyqEjpHM5XCnQqmFFPh79B98ORTADcAwXf8aC
        SsSRvAHXkEc4qP8QhikoTgZhA+iwcC5Lfih1feN+xggA7dmPu9hB8p1mxyyq3tGlEgfNf9we3EXII
        7ot1oACy8vaVA0eqbLoE2nVIVS0T9doy//xDF/il/h1AKNEoOvZjlqsvv5G9+dtMYg03CWx0MJgOm
        SkvShWlRQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1f1FPq-0003kl-Mo; Wed, 28 Mar 2018 18:03:18 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 7C7AD202A4A09; Wed, 28 Mar 2018 20:03:16 +0200 (CEST)
Date:   Wed, 28 Mar 2018 20:03:16 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Tony Luck <tony.luck@intel.com>
Cc:     Sinan Kaya <okaya@codeaurora.org>,
        Paul McKenney <paulmck@linux.vnet.ibm.com>,
        Will Deacon <will.deacon@arm.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        Ingo Molnar <mingo@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>
Subject: Re: [PATCH] docs/memory-barriers.txt: Fix broken DMA vs MMIO
 ordering example
Message-ID: <20180328180316.GN4082@hirez.programming.kicks-ass.net>
References: <1522156287-15169-1-git-send-email-will.deacon@arm.com>
 <20180327150252.GN3675@linux.vnet.ibm.com>
 <c93ed5db-8cfd-1258-3396-62ca2076c44d@codeaurora.org>
 <CA+8MBb+61AhMkbo8xtd3Y0fY8xRUPD+kUsEvWgOz94KGEuovOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+8MBb+61AhMkbo8xtd3Y0fY8xRUPD+kUsEvWgOz94KGEuovOw@mail.gmail.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 28, 2018 at 10:57:11AM -0700, Tony Luck wrote:
> On Wed, Mar 28, 2018 at 6:02 AM, Sinan Kaya <okaya@codeaurora.org> wrote:
> > +linux-ia64
> > Does IA64 follow this requirement? If not, is implementation planned?
> >
> > "no wmb() before writel()"
> >
> > Linus asked us to get rid of wmb() in front of writel() for UC memory.
> > Just checking that we are not breaking anything for IA64.
> 
> We should be OK on ia64, writel() uses a cast to:
> 
>  *(volatile unsigned int __force *)
> 
> which the compiler takes as a request to use a "st4.rel" instruction
> (meaning "store with release semantics"). So the value stored will
> be visible to anything that follows.

Just to nitpick, regular release semantics don't guarantee anything like
that, but ia64 never actually got around to implementing proper release
and it's a full barrier and thus what you say is true.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
