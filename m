Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C60C4338F
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 11:28:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6578D619F8
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 11:28:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236414AbhG0L2I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jul 2021 07:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231781AbhG0L2H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 07:28:07 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E36C061757
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 04:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=9uNazdZqTnM5ne/FDKvszK/fLUy1t89Mlgubekvh4To=; b=ofpt9APqwqG5l5EKo2hxumBIQ7
        sSVvdYlhdvJPYKDX0KInGIwHjysf3tCsh4hsHd0RdJ1UzCoSX6IKjGjIW1lvluv98sVWN5N9ufI+C
        2rqTnNye64I1k+vnrhJk7Go29f8gWYrFS+SMcPR+QKIj3+oc6txr9v2IKC9jRpE7a5zN5tJRYNwef
        qsbA/NPEAXsDtI60VXNRTfMSMOyBIRlDfWdDMDOO5AGpTVkCU/pPHblWQjjhnkweRwmaDtwCMqTV7
        hszzRKlCUXeuiusIvCgzv2dAAKODAhWjtxL5uJyxQVg3ifhbmQBAhHcej9ZfBRG++YOMDyhkJsVVK
        Fztt4s9Q==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m8LDL-00ExQf-0q; Tue, 27 Jul 2021 11:26:01 +0000
Date:   Tue, 27 Jul 2021 12:25:34 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        pioneer695 <pioneer695@protonmail.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: make cleandocs issue: rm -rf /output when obj not defined
Message-ID: <YP/tLnwb86RTTiRf@casper.infradead.org>
References: <hMV_L3bAsgmBToxsfiYBJDxTBoLHll-1BOk7FvqialjmZFNDp14Bq69ddTVagVH49yViCM43-yFpZ39Kfr6geVK7ota0QhCDA4MaC_5vILY=@protonmail.com>
 <875ywyw3ui.fsf@meer.lwn.net>
 <5e93f77f-79a5-7dc9-287e-a48865afd133@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5e93f77f-79a5-7dc9-287e-a48865afd133@infradead.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Jul 25, 2021 at 01:53:30PM -0700, Randy Dunlap wrote:
> On 7/25/21 1:11 PM, Jonathan Corbet wrote:
> > pioneer695 <pioneer695@protonmail.com> writes:
> > 
> >> In an attempt to get some readable documentation I cloned the git repository
> >> to check how the PDF format is.
> >>
> >> Entered Documentation and proceeded with:
> >>
> >> 	make pdfdocs
> 
> Hi,
> I'm curious about this part above. Are you saying that you did:
> 
> cd Documentation
> make pdfdocs
> 
> I've never tried that and don't expect it to be done that way.
> 
> I do (from the top of the kernel source tree):
> 
> make pdfdocs
> or
> make htmldocs
> 
> with no problems, other than I may not have all of the latex
> tools installed.

Perhaps we should rename Documentation/Makefile to Documentation/Kbuild
to prevent this confusion?
