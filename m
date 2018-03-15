Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5D1B37E66E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 15 Mar 2018 13:18:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751357AbeCONSg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 15 Mar 2018 09:18:36 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34844 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751353AbeCONSf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Mar 2018 09:18:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wF+S9khd7aiSKxsQsauxGpAMKB9qckMF0tFWKyqsUuE=; b=remOt/q8u49demNnI+tLsqZZN
        0T+JcdNi1ArTh0p5zdJytTgf2VS2Oot+pLqiFPhjhjVqsRI3shcPRsCdVlg+5uSRjkO9k9nT1HsmN
        LUnmNDpkv9j576qjNOO7D7T+XYrDqIt0G1NkcN3A/uPa0mY8xCz52pqmXR4MdKLRUCk21PnGAbn2y
        7XmeQkq/ytm+A7pceCswjqJLtiisjLVEBcAMGoSQDfvFIVyTKxjmvHZ7DBN4tjjXMrdz1OOhFUUxD
        PAxcxOVM9+/kmAGB4cnKlw3zwwPdRKy4xYbmfZeYyryf4LZfJtlic7MKH3k7b9Zhk05Fc2GK7NOxa
        3xGRM3f0Q==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1ewSm8-00005U-Ad; Thu, 15 Mar 2018 13:18:32 +0000
Date:   Thu, 15 Mar 2018 06:18:32 -0700
From:   Matthew Wilcox <willy@infradead.org>
To:     Kirill Tkhai <ktkhai@virtuozzo.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>, tj@kernel.org,
        cl@linux.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH] Improve mutex documentation
Message-ID: <20180315131832.GC9949@bombadil.infradead.org>
References: <152102825828.13166.9574628787314078889.stgit@localhost.localdomain>
 <20180314135631.3e21b31b154e9f3036fa6c52@linux-foundation.org>
 <20180315115812.GA9949@bombadil.infradead.org>
 <2397831d-71b5-3cc8-9dc4-ce06e2eddfde@virtuozzo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2397831d-71b5-3cc8-9dc4-ce06e2eddfde@virtuozzo.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 15, 2018 at 03:12:30PM +0300, Kirill Tkhai wrote:
> > +/**
> > + * mutex_lock_killable() - Acquire the mutex, interruptible by fatal signals.
> 
> Shouldn't we clarify that fatal signals are SIGKILL only?

It's more complicated than it might seem (... welcome to signal handling!)
If you send SIGINT to a task that's waiting on a mutex_killable(), it will
still die.  I *think* that's due to the code in complete_signal():

        if (sig_fatal(p, sig) &&
            !(signal->flags & SIGNAL_GROUP_EXIT) &&
            !sigismember(&t->real_blocked, sig) &&
            (sig == SIGKILL || !p->ptrace)) {
...
                                sigaddset(&t->pending.signal, SIGKILL);

You're correct that this code only checks for SIGKILL, but any fatal
signal will result in the signal group receiving SIGKILL.

Unless I've misunderstood, and it wouldn't be the first time I've
misunderstood signal handling.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
