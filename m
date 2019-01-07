Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C0AF87D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 Jan 2019 09:47:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726404AbfAGJrQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 Jan 2019 04:47:16 -0500
Received: from merlin.infradead.org ([205.233.59.134]:35072 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726402AbfAGJrQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Jan 2019 04:47:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=owmLCz674NsQ4X6zYu+dDxoNvJMYgBNm8s6qAzHY3Gk=; b=hcuul/VdcJfvZ+HF+Gdr8duBV9
        ke+A8rJux1Pd+7Z+uETTQiLDCpJ2l0WUMD1waB/dvl7hQAzDYWl1jh7CIxqieU1PgWKTGHaqEzmAc
        4b6DeMASCB6pMUO/4zKIP+Cn4PXOPCUMsf/4UM7clHh5085s8EI5XTK98wU526CUVKrv7I6x6Wlyp
        KeiNU7p35dvCUV1Iis7H2feA2Qtm58VTxXuM6UlSPI/sOvseBGUJ7YZvdKdlP3LMTFib7vEeDvgWX
        sgW09WCIlYpGbxSl615+AA7JXBRcNgJWJQgGTylY4bQURldEXzmxEy4wtEL+8LLEq1L1QR/0WBl4z
        KEIk6QkA==;
Received: from [185.88.64.153] (helo=worktop.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1ggRUJ-0002zr-48; Mon, 07 Jan 2019 09:46:27 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id A9696983877; Mon,  7 Jan 2019 10:46:10 +0100 (CET)
Date:   Mon, 7 Jan 2019 10:46:10 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Andrea Parri <andrea.parri@amarulasolutions.com>,
        Will Deacon <will.deacon@arm.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>, linux-arch@vger.kernel.org,
        netdev@vger.kernel.org, virtualization@lists.linux-foundation.org,
        Jonathan Corbet <corbet@lwn.net>,
        Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        linux-doc@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-sparse@vger.kernel.org
Subject: Re: [PATCH RFC 3/4] barriers: convert a control to a data dependency
Message-ID: <20190107094610.GA2861@worktop.programming.kicks-ass.net>
References: <20190102205715.14054-1-mst@redhat.com>
 <20190102205715.14054-4-mst@redhat.com>
 <86023cbe-d1ae-a0d6-7b75-26556f1a0c1f@redhat.com>
 <20190106231756-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190106231756-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jan 06, 2019 at 11:23:07PM -0500, Michael S. Tsirkin wrote:
> On Mon, Jan 07, 2019 at 11:58:23AM +0800, Jason Wang wrote:
> > On 2019/1/3 上午4:57, Michael S. Tsirkin wrote:

> > > +#if defined(COMPILER_HAS_OPTIMIZER_HIDE_VAR) && \
> > > +	!defined(ARCH_NEEDS_READ_BARRIER_DEPENDS)
> > > +
> > > +#define dependent_ptr_mb(ptr, val) ({					\
> > > +	long dependent_ptr_mb_val = (long)(val);			\
> > > +	long dependent_ptr_mb_ptr = (long)(ptr) - dependent_ptr_mb_val;	\
> > > +									\
> > > +	BUILD_BUG_ON(sizeof(val) > sizeof(long));			\
> > > +	OPTIMIZER_HIDE_VAR(dependent_ptr_mb_val);			\
> > > +	(typeof(ptr))(dependent_ptr_mb_ptr + dependent_ptr_mb_val);	\
> > > +})
> > > +
> > > +#else
> > > +
> > > +#define dependent_ptr_mb(ptr, val) ({ mb(); (ptr); })
> > 
> > 
> > So for the example of patch 4, we'd better fall back to rmb() or need a
> > dependent_ptr_rmb()?
> > 
> > Thanks
> 
> You mean for strongly ordered architectures like Intel?
> Yes, maybe it makes sense to have dependent_ptr_smp_rmb,
> dependent_ptr_dma_rmb and dependent_ptr_virt_rmb.
> 
> mb variant is unused right now so I'll remove it.

How about naming the thing: dependent_ptr() ? That is without any (r)mb
implications at all. The address dependency is strictly weaker than an
rmb in that it will only order the two loads in qestion and not, like
rmb, any prior to any later load.
