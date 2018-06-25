Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 40D917D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 25 Jun 2018 10:56:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755289AbeFYK4a (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 25 Jun 2018 06:56:30 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:54240 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755278AbeFYK41 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jun 2018 06:56:27 -0400
Received: by mail-wm0-f67.google.com with SMTP id x6-v6so8700867wmc.3
        for <linux-doc@vger.kernel.org>; Mon, 25 Jun 2018 03:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6ogIL3yb10eO2zBiNP7tMLo5NgpmJiRLveQpIw8LnwQ=;
        b=JmxALotuvuzgm79cZrw6w2bccRM9Ie0LwgV9ODrjKWtmYx46r3QkOKhySl0ZAHXoKj
         8pcRM/MmFo5tLJ+kBuJpq/V7eHwIV3DV+rZsSuYwvddHzlHwRTYCIpt2HRwtLMPAdPMC
         XaP544AFeoa9Z9iEfh2/L3HJcBh+beeVp/BEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6ogIL3yb10eO2zBiNP7tMLo5NgpmJiRLveQpIw8LnwQ=;
        b=J9vMHgPnFnCJ011wBLq7O6F3uVFuutleMG/+ZlrCt+XIYgFBSkMtHkEPAmFdnveBoU
         tZDzjFTS1MKGd5BvFQwExqAVHHEW25M2hJFCeThqLyCnZnF8jUDRaLA4b8GVlOJeT27j
         6XEX5jC4nUV+13z88zo8uoJTUKef48BR2HdUCYTPMCOhWJnA2tS2JhsVgQZN+W9YaL4l
         vCe6tU5Pq3Cc/ky4ng0VgPc5Vk+fVwW1tAzXopvZKG1KtQIYO2+bEP692zh0iryr8YNU
         En4zEzUSFqVvJyCm1KOUBHZQ074TJ6y9a1NFOSWQiNG4QEyufBtOcSrCRu4qdkkZ6E8Y
         VV8A==
X-Gm-Message-State: APt69E3RDgsiWi2vo/ebp0oiMOXMBrEi1NMOzdUNaT7+GytBrAiJ8Jok
        0oA0MljF+eAlahauZ378szyiCA==
X-Google-Smtp-Source: ADUXVKJMulMyXeh6B3LsvyShgmmhkE4fURuXIBVDLCBNWDo8SCaetydDqB7rOA04CRWmBvwj3ejxLw==
X-Received: by 2002:a1c:470b:: with SMTP id u11-v6mr579642wma.49.1529924186181;
        Mon, 25 Jun 2018 03:56:26 -0700 (PDT)
Received: from andrea (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id q17-v6sm15149427wrs.5.2018.06.25.03.56.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jun 2018 03:56:25 -0700 (PDT)
Date:   Mon, 25 Jun 2018 12:56:18 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Will Deacon <will.deacon@arm.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] doc: Update wake_up() & co. memory-barrier guarantees
Message-ID: <20180625105618.GA12676@andrea>
References: <1529918258-7295-1-git-send-email-andrea.parri@amarulasolutions.com>
 <20180625095031.GX2494@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180625095031.GX2494@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 25, 2018 at 11:50:31AM +0200, Peter Zijlstra wrote:
> On Mon, Jun 25, 2018 at 11:17:38AM +0200, Andrea Parri wrote:
> > Both the implementation and the users' expectation [1] for the various
> > wakeup primitives have evolved over time, but the documentation has not
> > kept up with these changes: brings it into 2018.
> 
> I wanted to reply to this saying that I'm not aware of anything relying
> on this actually being a smp_mb() and that I've been treating it as an
> RELEASE.
> 
> But then I found my own comment that goes with smp_mb__after_spinlock(),
> which explains why we do in fact need the transitive thing if I'm not
> mistaken.

A concrete example being the store-buffering pattern reported in [1].


> 
> So yes, I suppose we're entirely suck with the full memory barrier
> semantics like that. But I still find it easier to think of it like a
> RELEASE that pairs with the ACQUIRE of waking up, such that the task
> is guaranteed to observe it's own wake condition.
> 
> And maybe that is the thing I'm missing here. These comments only state
> that it does in fact imply a full memory barrier, but do not explain
> why, should it?

"code (people) is relying on it" is really the only "why" I can think
of.  With this patch, that same/SB pattern is also reported in memory
-barriers.txt.  Other ideas?

  Andrea
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
