Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AD3DCCA47B
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 19:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346500AbiFMTAy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jun 2022 15:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346311AbiFMTAV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 15:00:21 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14C89270D
        for <linux-doc@vger.kernel.org>; Mon, 13 Jun 2022 09:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=EPzxVs47nIxGZ2zvDCchlISLDeGrafNLqdyatVa2evM=; b=UZpMQOFFYtx+AcfoUT00FanRUS
        D3u1z6wp+hmarCPQ1ZdYpC24bIo6wxgJ4m5ZvQ7se0bDXkZquZIO700bw3NSLQvQNpJf8vP9xARBw
        IEaQEOdz1A6VZ9PYAWqFCXbrU+aYRArQe5nPd+JxZL+RdicbpA6pFVGl+lJ/qX1mx7Jrik9Fh3ITZ
        UHkRhOII4QAxwBHllJtiGWo0YdHOy3hSjo8JNVe5/CtmsSKTkpr0bQqKDXAI/FDrkGRzOfe5KnsQc
        8gK9EGtt62m7xyQSS3eqL4cf8md7Llb9NjOUIqqypu2JqvZ7VVBBon/3NCcwYtQ61LUOC6pmNZRmp
        C50LxyYg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1o0mnF-00GzNz-RB; Mon, 13 Jun 2022 16:19:57 +0000
Date:   Mon, 13 Jun 2022 17:19:57 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Adam Turner <aaturnerpython@outlook.com>
Cc:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Sphinx pre v3 -- removing support
Message-ID: <YqdjrTKV77OycnQt@casper.infradead.org>
References: <LO3P123MB26810D190462B6BBBF1305F6C2A19@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
 <877d5xx1xo.fsf@meer.lwn.net>
 <YponOKPBgE8pgBYD@casper.infradead.org>
 <20220603154229.sj5sfeaehbkfzgin@meerkat.local>
 <87tu91vis5.fsf@meer.lwn.net>
 <20220603162615.wto3fywuvs2wlb5r@meerkat.local>
 <871qw5ju1m.fsf@meer.lwn.net>
 <20220613154059.oeb2kfp3j2amqat5@meerkat.local>
 <YqdfJPiQmYkC2uyT@casper.infradead.org>
 <LO3P123MB2681B5638A09A83208095DCDC2AB9@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LO3P123MB2681B5638A09A83208095DCDC2AB9@LO3P123MB2681.GBRP123.PROD.OUTLOOK.COM>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 13, 2022 at 04:16:12PM +0000, Adam Turner wrote:
> > Can confirm the bug I mentioned is now present on at least
> > https://www.kernel.org/doc/html/latest/core-api/mm-api.html#c.folio_add_wait_queue
> 
> > What should be the link to 'struct folio' is instead a link to
> > folio_add_wait_queue.
> 
> >From a skim of the "view source" link, I think it is probably a problem in the kernel-doc directive, offending lines copied below:
> 
> .. code-block:: restructuredtext
> 
>    Filemap
>    -------
> 
>    .. kernel-doc:: mm/filemap.c
>       :export:
> 
> Happy to take a look on the Sphinx side for any regressions we've introduced, though I don't know anything about the kernel's documentation tooling so can't help from that side.

Jon's pretty sure it's our bug,

https://lore.kernel.org/linux-doc/87tu91ieiw.fsf@meer.lwn.net/

Our tooling is an unholy mess of perl and python, so it may take some
time to track down.
