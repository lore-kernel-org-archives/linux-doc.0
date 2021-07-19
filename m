Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA9B6C07E95
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 14:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99C32610D2
	for <linux-doc@archiver.kernel.org>; Mon, 19 Jul 2021 14:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232824AbhGSOON (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jul 2021 10:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbhGSOOM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jul 2021 10:14:12 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8094AC061574
        for <linux-doc@vger.kernel.org>; Mon, 19 Jul 2021 07:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:Message-ID:
        Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=RqBZmebH9ahnWaNu0uFoCHPBA/9wcLTQOnJeX5Cgk6Y=; b=mB8JwoQiA50YaeI7nis0tvICtC
        reZfbgFva4NNFOHUdZphrFBknY8xMz9F3kHhlfyQ97aabsJLP9Ls/ih2mmK66p5gHSXGEi/gobIgX
        HSYQPNij+F10YLtY+3H3GrTqS3672U/SaGDNTTBFGpYRcU84RX8ErAfH1s1peCvtAAmAaSdAG4sHO
        WS75tyfePQZo7HIc91qkyXGH6VL8rTwpwNLGPsaqFm8cNsovpHyz2B70DoLdw0sliZVmA4rBv4cvf
        a/FxSH1gspzRaKzx4WKPh91cc++iirGbtSPvP+yMtN5q2rvMKUWpxVG7fFexGhvj3hYlyOrD8EIpl
        Y53uCj5g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m5Ueo-006x5T-8J
        for linux-doc@vger.kernel.org; Mon, 19 Jul 2021 14:54:21 +0000
Date:   Mon, 19 Jul 2021 15:54:10 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     linux-doc@vger.kernel.org
Subject: Describing the type of an argument to a macro-function
Message-ID: <YPWSEq49pBjMf5ZP@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is the best I've been able to come up with:

/**
 * bio_for_each_folio_all - Iterate over each folio in a bio.
 * @fi: struct folio_iter which is updated for each folio.
 * @bio: struct bio to iterate over.
 */
#define bio_for_each_folio_all(fi, bio)                         \
        for (bio_first_folio(&fi, bio, 0); fi.folio; bio_next_folio(&fi, bio))

which produces html which renders as:


> bio_for_each_folio_all
> 
> bio_for_each_folio_all (fi, bio)
> 
>     Iterate over each folio in a bio.
> 
> Parameters
> 
> fi
> 
>     struct folio_iter which is updated for each folio.
> bio
> 
>     struct bio to iterate over.

... not too different from an actual function:

> Parameters
> 
> struct bio *bio
> 
>     bio to split
> int sectors
> 
>     number of sectors to split from the front of bio

but if anyone has a better suggestion, I'd love to hear it.  I'll also
update the doc-guide with the best practice for doing this.  (obviously
the best practice is just to use a function, but that doesn't work here.
and some macros are deliberately untyped, eg offset_in_page)

It'd be nice to improve the generated html here too to put the parameters
in the name of the macro and not repeat the name of the macro with
parameters on a second line.  But right now, I'm more concerned with
getting the kernel-doc comments right.
