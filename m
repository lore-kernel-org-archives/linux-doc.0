Return-Path: <SRS0=bcQJ=C7=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE4F5C4363D
	for <linux-doc@archiver.kernel.org>; Tue, 22 Sep 2020 07:19:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B2A921924
	for <linux-doc@archiver.kernel.org>; Tue, 22 Sep 2020 07:19:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fmcXDTfJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729824AbgIVHTg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Sep 2020 03:19:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729743AbgIVHTg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Sep 2020 03:19:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 256A4C061755
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2020 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=N6M+528dGdp4KqkPbnzaU5rE0/rR+kiG/GBCI3zEKjg=; b=fmcXDTfJ1FX4tqpH25UttnEwaT
        3t/Flxz2eKgKHwuySty9Hw/z5rH4dxZnBh+raYDUKBL8LICttwUUFscep61yY/czYlYk0bgzwAjdU
        AAPTTDZax6G+OWwNpolVDuYPm6v7kPFRw1CEVEgqQjOQYagNBsDDzh+7qVRA8Yv3TVa1Qid35oKcY
        JScoOFZBjyZI3WcEv9HcTJCLj/V3kllnx6330lXLiuaSyE3dvy52WdvkqmAgapOltS8thzPb567FK
        6Ql6X4XlcRifFBoX9TwTEl9gGoGgIK4uq5Vnt1FQAGXr15oxJPZdwNRBC9xHSQlXMM2Wb6vlhvRiU
        EZQWLHZg==;
Received: from ip5f5ad5bc.dynamic.kabel-deutschland.de ([95.90.213.188] helo=coco.lan)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kKcaL-0006VI-VI; Tue, 22 Sep 2020 07:19:34 +0000
Date:   Tue, 22 Sep 2020 09:19:32 +0200
From:   Mauro Carvalho Chehab <mchehab@infradead.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Markus Heiser <markus.heiser@darmarit.de>
Subject: Re: [PATCH RFC] Make the docs build "work" with Sphinx 3.x
Message-ID: <20200922091932.4d22985b@coco.lan>
In-Reply-To: <20200921222639.GY32101@casper.infradead.org>
References: <20200904102925.52fcd2a1@lwn.net>
        <20200921222639.GY32101@casper.infradead.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <mchehab@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Mon, 21 Sep 2020 23:26:39 +0100
Matthew Wilcox <willy@infradead.org> escreveu:

> On Fri, Sep 04, 2020 at 10:29:25AM -0600, Jonathan Corbet wrote:
> > +# cdomain is badly broken in Sphinx 3+.  Leaving it out generates *most*
> > +# of the docs correctly, but not all.  Scream bloody murder but allow
> > +# the process to proceed; hopefully somebody will fix this properly soon.
> > +#
> > +if major >= 3:
> > +    sys.stderr.write('''WARNING: The kernel documentation build process
> > +	does not work correctly with Sphinx v3.0 and above.  Expect errors
> > +	in the generated output.  
> 
> Should we be converting the kernel-doc script to output 3.0-style markup
> for structs?
> 
> https://www.sphinx-doc.org/en/master/usage/restructuredtext/domains.html#c-roles

I wouldn't mind converting the media books to use 3.0 style if
they work as expected.

Yet, if we convert, we need to change the minimal version requirement
to follow it. 
Sphinx 3.x is still too new. I bet distros don't bring it yet.

Ok, the default procedure is to pick it using pip or venv. So,
no bit issue, IMHO.

Also, as Jon mentioned, it takes about twice the time for the
doc build.

Not sure if it is worth.


Thanks,
Mauro
