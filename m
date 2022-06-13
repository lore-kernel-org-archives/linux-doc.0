Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D14C43334
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 18:56:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344996AbiFMS4x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jun 2022 14:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345326AbiFMSzn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 14:55:43 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 372F2E64
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 09:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=kVweHBeIAt8iVzGUpmrlJ3UE3hMq8yyWMUFUj5xycRw=; b=Cl4SMVznahNQP2ZzbRbs3gHA02
        BukFHF1rftb625C688LcQcmeU5P5xZvSV29TlJT+3ese1aQijDnfyugi0ZEFMZRZ4zAtB78WnUu39
        TlF9p9gCqFqmdVsLQOV3dA4a9pDLTvowdunG1KwMpVdmB0jx3QQgBlv90JPZQ0/lG9U9fwmc+ZxnK
        ZWPic24WRtoSt7yRxZr9Ep3corgKOpxg6ziCCi3GwwJL4nQ8KO60nAYNsbprBouT9Lx50t5nVz9tf
        ldBjSPGAJ4ASAMbAOcOi7o+863+T9jIyiVBT9A3RyjXa1mQPesx1t0sCgc8YXSEugpXna6qbc5OKZ
        Q5nXWNkg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1o0mUW-00GyXu-24; Mon, 13 Jun 2022 16:00:36 +0000
Date:   Mon, 13 Jun 2022 17:00:36 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Adam Turner <aaturnerpython@outlook.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
Message-ID: <YqdfJPiQmYkC2uyT@casper.infradead.org>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net>
 <YponOKPBgE8pgBYD@casper.infradead.org>
 <20220603154229.sj5sfeaehbkfzgin@meerkat.local>
 <87tu91vis5.fsf@meer.lwn.net>
 <20220603162615.wto3fywuvs2wlb5r@meerkat.local>
 <871qw5ju1m.fsf@meer.lwn.net>
 <20220613154059.oeb2kfp3j2amqat5@meerkat.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613154059.oeb2kfp3j2amqat5@meerkat.local>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 13, 2022 at 11:40:59AM -0400, Konstantin Ryabitsev wrote:
> On Fri, Jun 03, 2022 at 03:50:29PM -0600, Jonathan Corbet wrote:
> > > Indeed. So, should I go to 3.x, 4.x, or go all new and shiny with 5.x?
> > 
> > Unless there is some subtle problem in the rendered docs that I'm not
> > seeing, I don't think that there is any reason to go with the older
> > releases.  5.0.1 seems to build things just fine, so I'd say go with the
> > shiniest you can get.
> 
> Okay, https://docs.kernel.org/ is now built with Sphinx-5.0.1. At least, the
> timestamps on the files are telling me so, because I can't see any other
> changes. :)

Can confirm the bug I mentioned is now present on at least
https://www.kernel.org/doc/html/latest/core-api/mm-api.html#c.folio_add_wait_queue

What should be the link to 'struct folio' is instead a link to
folio_add_wait_queue.
