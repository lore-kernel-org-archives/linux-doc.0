Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEC3C63777
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 17:39:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCFA320678
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 17:39:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="FDUYXDY4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726509AbgKQRip (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Nov 2020 12:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729776AbgKQRio (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Nov 2020 12:38:44 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3330C0613CF;
        Tue, 17 Nov 2020 09:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=WwKD8PeL6XUEcNfNecTumntXPs0mwaroS6WwY4+2WHU=; b=FDUYXDY4RAIPGuIYSxMPwHbk6F
        neYbkW7o+/10Jf/zsP5ajSVnmWCatHIxmGQWGnywLK+Gn5y51NvKAVnUCmXgIow9x+JyYKvJLNafX
        FwZcGM19MzJG9xxzE/eGtyNqBEI77GHrXXE0dR5mrR0SEnW37uLj8pFopsmMynxObu2Qd+yTLrhPy
        3OCrtsbj/QDNauaL7xyCVX8wuRjHt9cI+1NXHsoM7JbltESBCKaH0VjJ8fFr1vEJmdCSQkLlUzTg/
        61x5DecfPvptVcr74c2CMeOiWenIYcWmCb//LL7D1qG2DxTbzjZ2kBj/lCTPkr/VUlFA+Z3jRNfh8
        QsMIGHAA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kf4wB-0006Y6-NV; Tue, 17 Nov 2020 17:38:39 +0000
Date:   Tue, 17 Nov 2020 17:38:39 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     corbet@lwn.net, keescook@chromium.org, gregkh@linuxfoundation.org,
        peterz@infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/13] seqnum_ops: Introduce Sequence Number Ops
Message-ID: <20201117173839.GO29991@casper.infradead.org>
References: <cover.1605287778.git.skhan@linuxfoundation.org>
 <26cbcc431be5e3ab7d8e0e881d522605a27b1312.1605287778.git.skhan@linuxfoundation.org>
 <20201113210327.GJ17076@casper.infradead.org>
 <13467f88-7e22-ce3e-60b6-44e7c3dfa7dc@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13467f88-7e22-ce3e-60b6-44e7c3dfa7dc@linuxfoundation.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 17, 2020 at 09:34:24AM -0700, Shuah Khan wrote:
> > seqnum_inc() should just return the new value -- seqnum_inc_return is
> > too verbose.  And do we not need a seqnum_add()?
> 
> I had the patch series with seqnum_inc() all ready to go and then
> revisited the choice. My thinking is that matching the current atomic
> api that has _inc() and inc_return() might be less confusing. That

No, it's more confusing.  I know you're converting things from using
atomic_t, but you really need to think about this in terms of "What
makes sense for this API".  Unless you really want to have inc that
returns void and inc_return that returns the new value, having only
inc_return makes no sense.

> being said, I have no problems with making just _inc(). The reason
> for 32 and 64 appended is based on comments that it including size
> in the api makes it very clear.

By putting 32 and 64 in the name of the API, I would contend you're making
people think about something that they should not need to think about.

> No need for atomic_add() - inc_return() is sufficient for this use-case.

I haven't looked at the various potential users of this API, but there
are often cases where we account, eg, number of bytes transmitted.

There are also cases where read-and-zero would be a useful operation
to have.  I'm thinking about sampling statistics.

