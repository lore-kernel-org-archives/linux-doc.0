Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A0D1C433C1
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 18:18:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1625E61A25
	for <linux-doc@archiver.kernel.org>; Wed, 24 Mar 2021 18:18:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237269AbhCXSRp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Mar 2021 14:17:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:42086 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237126AbhCXSR2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 24 Mar 2021 14:17:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF59D61A1B;
        Wed, 24 Mar 2021 18:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616609847;
        bh=4pdlq11RIrLWbal0eLSrsoU2qpVHCmm//Uxr7uO5jvY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=m4ZteAYgWR/1D3ZZHoKlmFU8fZ9uGhlBkHWDVijMGwlEwP4cdW4LHOMl5OTYImHsM
         UxN0lOUM2It6Ru9uOC2U10xE1fdtUcMANlzlQa7ip9xRqltkKQxeAUktdHrJ4OKXeQ
         4xfKOAYm44hLmcFofEsoUVv8sKEdtY3kgcEwt6vbhOISILYqt79sUlsz5MvZ44Lzbf
         9TwteNfuj6a42CcB7cSUo3oFmf8bmiahbDOId5wsdIiVkDwBk14eFIKd9Q/7f4QdWb
         NOLSw1zasUbceiBB6GNB5iKkx+5PASQ81MwcaPH8xnnhXEu3aS/bgL22S6BDtXCF1f
         Y+kBgdtx6uAJA==
Date:   Wed, 24 Mar 2021 19:17:22 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Finn Behrens <me@kloenk.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] script: get_abi.pl: escape "<" and ">" characters
Message-ID: <20210324191722.08d352e4@coco.lan>
In-Reply-To: <87sg4kcw6y.fsf@meer.lwn.net>
References: <20210317142238.228fb1e8@coco.lan>
        <e02449ee86d89cd45313627b52500a6892ea37ae.1616605512.git.mchehab+huawei@kernel.org>
        <87sg4kcw6y.fsf@meer.lwn.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 24 Mar 2021 11:12:37 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > After merging the akpm-current tree, today's linux-next build (htmldocs)
> > produced this warning:
> >
> > 	Documentation/ABI/testing/sysfs-kernel-mm-cma:2: WARNING: Inline interpreted text or phrase reference start-string without end-string.
> >
> > Introduced by commit 439d477342a3 ("mm: cma: support sysfs")
> >
> > As pointed by Jonathan, the problem is this text in
> > sysfs-kernel-mm-cma:
> >
> > 	Each CMA heap subdirectory (that is, each
> > 	/sys/kernel/mm/cma/<cma-heap-name> directory) contains the
> > 	following items:
> >
> > Is not parsed well, becase the major/minor signs need to be
> > escaped, when converted into cross-references.  
> 
> Sorry, I kind of dropped the ball on this, and everything else really; a
> bit of a challenging time here.
> 
> This makes the warning go away, but I have to wonder if it's the right
> fix 

There's indeed an issue on another part of the script. I'm testing 
a second version using a better and more generic regex set.

> - wouldn't it be better to avoid trying to create a cross-reference
> entirely in cases where it clearly won't work?  Or am I missing
> something here?

The cross-reference logic on this script is somewhat smart: it
will only create cross-references if the symbol exists. If not,
it keeps the symbol as-is.

The problem was actually on another part of the logic: there is
a symbol "/sys/kernel/mm/cma". The script is currently thinking
that the "<" character at:
	/sys/kernel/mm/cma/<cma-heap-name> 

is a bondary. So, it ended converting the first part 
("/sys/kernel/mm/cma/") into a cross reference.

This patch fixed it by dropping the reference for the non-existent 
symbol "/sys/kernel/mm/cma/" (the reference should be, instead,
to /sys/kernel/mm/cma/<cma-heap-name>/foo), but there's still
a hidden bug, which causes that a reference for
/sys/kernel/mm/cma/<cma-heap-name>/alloc_pages_success to be
broken.

I have already a new patch. I'm checking right now if everything
is ok after the regex change. I should be sending a version 2
probably in a few.

Thanks,
Mauro
