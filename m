Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 235177E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri, 16 Mar 2018 13:57:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750986AbeCPN52 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 16 Mar 2018 09:57:28 -0400
Received: from merlin.infradead.org ([205.233.59.134]:41186 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750921AbeCPN51 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Mar 2018 09:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=M8Yi6mKWHHsorud3G96t1cN+S3J+2DhR9Ny7DjeYdks=; b=gjvSAUhsYe35UcewcHZpN3yHF
        vlDi7rAfFPT4iMsjFa9ZbLk3BZ9xaJ4HHlFj4RSfhFiLLeaNB2oBr53aKObKH8uk2TPW5giGSYH8C
        6TwonawYiJdWpji11UwbJxnWlkPrte/1HvP3I23n15+8CTIijuK1+OUJyGjzJjp4l52MkkGqN+mFG
        xCLDiqKX5lHw6uLufovbJtF6aY/JAiOxiPQc5WC8wnNkzWEQEeAuASuGkSR8qTelCwBPStG0Z34QC
        ddQJRGWeq4l5PWwwv3LcZMgIzhK21vPhi2+CEOAmhebnmkS3XnrgUG1o5TTY+EaaugPgQ8y36mRfk
        O67CkyW1w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1ewprC-0002Gt-E9; Fri, 16 Mar 2018 13:57:18 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id F1DA62029F860; Fri, 16 Mar 2018 14:57:16 +0100 (CET)
Date:   Fri, 16 Mar 2018 14:57:16 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Kirill Tkhai <ktkhai@virtuozzo.com>, tj@kernel.org,
        cl@linux.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH] Improve mutex documentation
Message-ID: <20180316135716.GG4064@hirez.programming.kicks-ass.net>
References: <152102825828.13166.9574628787314078889.stgit@localhost.localdomain>
 <20180314135631.3e21b31b154e9f3036fa6c52@linux-foundation.org>
 <20180315115812.GA9949@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180315115812.GA9949@bombadil.infradead.org>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 15, 2018 at 04:58:12AM -0700, Matthew Wilcox wrote:
> On Wed, Mar 14, 2018 at 01:56:31PM -0700, Andrew Morton wrote:
> > My memory is weak and our documentation is awful.  What does
> > mutex_lock_killable() actually do and how does it differ from
> > mutex_lock_interruptible()?
> 
> From: Matthew Wilcox <mawilcox@microsoft.com>
> 
> Add kernel-doc for mutex_lock_killable() and mutex_lock_io().  Reword the
> kernel-doc for mutex_lock_interruptible().
> 
> Signed-off-by: Matthew Wilcox <mawilcox@microsoft.com>

Thanks Matthew!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
