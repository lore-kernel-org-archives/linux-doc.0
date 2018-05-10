Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AD1BA7E27B
	for <lwn-linux-doc@archive.lwn.net>; Thu, 10 May 2018 12:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1757250AbeEJMUl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 May 2018 08:20:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47404 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756741AbeEJMUk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 May 2018 08:20:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=pImiZrUuCZ/bLbAaRbJIPl9tHlFhMMSbiIeNLvRa8ks=; b=dVIJ1V6o4VP8Vw9FxlVey+71q
        mHlt+peiDF3dW/rYbiSG8+dNhTs/YIleDkLl/2VQcki3enoJ9W4jNWmiGiyPX7anD6XfzeCRxF3TQ
        8yjLDDfncCLDyA/TOPccwzyeX+bkFATqLwL3Dxa2L44c8bzckdsyeRDwfqFYB7uSU1eKaRlYw+Nx3
        uhB/JKg/fsPgZ2aYUFYQ6aRyS1+0LCc6h15zn4kJ01pErY5YT1kRsyuo1DUZdGBcW4L77u3fRs1Y0
        60RY8jIvc7jZqmIlols5HGumJZMdODkgk2lWI94xVs8kn7VT1bBEZ3bNouS+SPphjt3vTm3Fky0hj
        RYg5G/3RA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGkYo-0008Je-O2; Thu, 10 May 2018 12:20:38 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 04C102029FA13; Thu, 10 May 2018 14:20:36 +0200 (CEST)
Date:   Thu, 10 May 2018 14:20:36 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
Message-ID: <20180510122036.GD12217@hirez.programming.kicks-ass.net>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
 <20180510083838.GA21846@infradead.org>
 <20180510063805.1859b1aa@vento.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180510063805.1859b1aa@vento.lan>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 10, 2018 at 06:38:05AM -0300, Mauro Carvalho Chehab wrote:
> Em Thu, 10 May 2018 01:38:38 -0700
> Christoph Hellwig <hch@infradead.org> escreveu:
> 
> > >   * Use either while holding wait_queue_head::lock or when used for wakeups
> > > - * with an extra smp_mb() like:
> > > + * with an extra smp_mb() like::  
> > 
> > Independent of any philosophical discussion not allowing a setence to
> > end with a single ':' is completely idiotic.  Please fix the tooling
> > instead to allow it, as it is very important for being able to just
> > write understandable comments.

That is exactly my point; the whole rst stuff detracts from normal text.
It makes both reading and writing harder than it needs to be.

> Patches are welcome, although I don't see any easy way to solve it.
> 
> In English, the common case is that a line with ends with a colon is
> followed by a list. E. g.

(google) Dictionary says:

"a punctuation mark (:) used to precede a list of items, a quotation, or
an expansion or explanation."

An enumeration (list) is just one of many possible uses of the colon.

> However, in this specific case, it is followed by an ascii artwork. 
> The double colon is a notation that tells Sphinx to not parse the
> lines at the next block, placing the contents of it inside a literal
> block. It is used also when the next lines contain a code example,
> in order to avoid parsing things like @, () and * inside the code 
> block.
> 
> The kernel-doc tool might eventually have some parsing logic that
> would replace something to a '::' before sending it to Sphinx.

I think typically there will be an 'empty' line between the colon ending
and the 'example/explanation'. This seems true for a number of comments
I found in drm using the '::' nonsense.

Simple regexes don't do multi-line patterns, but maybe the kerneldoc
thing can parse it differently.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
