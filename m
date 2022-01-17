Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3499BC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 17 Jan 2022 23:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238478AbiAQXPg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 Jan 2022 18:15:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234551AbiAQXPg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jan 2022 18:15:36 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A83C061574
        for <linux-doc@vger.kernel.org>; Mon, 17 Jan 2022 15:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=xFMxiDhWKIKr6FlkhVPSud7R7NRbS+l9hdSGge97uNk=; b=p8LCYQ9qbXkb2AU70mog+cxDlr
        0mT0HZakvVobgTC7279CNMjeZshk0m1gqucrEMFC19ldJh2QFf8q7lPDI93AHWSeSBKfDT6Nh++o8
        +ZZF0wtKyiwDrSVmR8UXU1u2YGktW2yfCgsd0IF18gTJdh0k8GRe/Rgcay6/fp3LbongnH8RmQhr7
        +mKed3HsvduHhv+b5ZUAy/V+JcXa7uGHYSfwByjbOpD8+led5sITXbHPke6dSJ9BIpXNqCrxCbCcJ
        dVZaHwcIbBDub/Ml814I2vllQsVwkKEeAFuD8M/w2ABD+YzY4K+294uvKVFQH5P1OBEbtNZCLOg9H
        PZQO7W2Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1n9bDp-008gNw-R1; Mon, 17 Jan 2022 23:15:33 +0000
Date:   Mon, 17 Jan 2022 23:15:33 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Hunter Chasens <admin@hunterchasens.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: process/2.Process.rst: fixes five general
 grammatical errors
Message-ID: <YeX4lfbcrpYbn+nT@casper.infradead.org>
References: <20220115223040.GA2414610@gaming1-ncf-edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220115223040.GA2414610@gaming1-ncf-edu>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Jan 15, 2022 at 05:30:40PM -0500, Hunter Chasens wrote:

You actually need a changelog here, not just a subject.

> -At that point the whole process starts over again.
> +At that point, the whole process starts over again.

This change is good.

>     those requirements will be met - are laid out.  Design work is often
>     done without involving the community, but it is better to do this work
> -   in the open if at all possible; it can save a lot of time redesigning
> +   in the open, if at all possible; it can save a lot of time redesigning
>     things later.

This is arguable.  I would prefer it without the comma.

> - - Wider review.  When the patch is getting close to ready for mainline
> + - Wider review.  When the patch is getting close to being ready for mainline
>     inclusion, it should be accepted by a relevant subsystem maintainer -

Again, I don't really see the point of this change.

>     though this acceptance is not a guarantee that the patch will make it
>     all the way to the mainline.  The patch will show up in the maintainer's
>     subsystem tree and into the -next trees (described below).  When the
> -   process works, this step leads to more extensive review of the patch and
> +   process works, this step leads to a more extensive review of the patch and
>     the discovery of any problems resulting from the integration of this
>     patch with work being done by others.

You're taking "review" as a noun, but if you take it as a verb, the
sentence is gramatically correct.

> @@ -408,7 +408,7 @@ There are lists hosted elsewhere, though; a number of them are at
>  redhat.com/mailman/listinfo.
>  
>  The core mailing list for kernel development is, of course, linux-kernel.
> -This list is an intimidating place to be; volume can reach 500 messages per
> +This list is an intimidating place to be; the volume can reach 500 messages per
>  day, the amount of noise is high, the conversation can be severely

This change is fine.

Overall, I wouldn't encourage you to send more nitpicking patches
like this.  The cost of review is more than the value of correctness.
By all means correct documentation that's misleading or fix obvious
spelling mistakes, but grammatical errors aren't worth it.
