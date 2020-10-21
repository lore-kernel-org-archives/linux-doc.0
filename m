Return-Path: <SRS0=tqpN=D4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B73FAC4363A
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 11:28:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 442C821D43
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 11:28:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fVJCsOc6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439449AbgJUL2X (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Oct 2020 07:28:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439427AbgJUL2X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Oct 2020 07:28:23 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7680FC0613CE;
        Wed, 21 Oct 2020 04:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=O6S/Lhgm4OaWo3MftaMh85Wk8y0wiXZg9HHid68XYgU=; b=fVJCsOc6i/0EX4+CLIvaXC2Pwd
        flsQc1jsO9Gpk9AmO0y3WNcl6tJEkXVn9OH4iEPUmqXcVpCk0rW+bl1Wna4WkjfIGIpv1DZui86rK
        aIOzLb7+ZIGE8ZqoS+UUDk0+Jp6wNn8m/2vRzKvzvwEcWpidbImeajl3FbRVrKDoXc+4zVNoyMhUt
        TpJU/za81hk8LLeDEQiPAH4ncCV3eecYeiSqJ3MMOKxVUzohjHlcfWTyT0mexQ1+fltV6lwn8BZ2H
        JRRf0pn1NOOfZI/Ao4fbMtsrYGmxnyDbPe5rhsPYP44XUj9FLEnHicabu853LSzEkfKJQ7rgivSx6
        cH4CEMBA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kVCHz-0001w4-E4; Wed, 21 Oct 2020 11:28:19 +0000
Date:   Wed, 21 Oct 2020 12:28:19 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Andreas Gruenbacher <agruenba@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Guoqing Jiang <guoqing.jiang@cloud.ionos.com>,
        Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        William Kucharski <william.kucharski@oracle.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/24] mm: pagemap.h: fix two kernel-doc markups
Message-ID: <20201021112819.GJ20115@casper.infradead.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
 <54ea6dd0fc37c48aef3fc3ae454c54a80db313dc.1602590106.git.mchehab+huawei@kernel.org>
 <20201013122654.GE20115@casper.infradead.org>
 <20201021115557.24c83c35@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201021115557.24c83c35@coco.lan>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 21, 2020 at 11:55:57AM +0200, Mauro Carvalho Chehab wrote:
> Hi Matthew,
> 
> Em Tue, 13 Oct 2020 13:26:54 +0100
> Matthew Wilcox <willy@infradead.org> escreveu:
> 
> > On Tue, Oct 13, 2020 at 02:14:37PM +0200, Mauro Carvalho Chehab wrote:
> > > Changeset 6c8adf8446a3 ("mm: add find_lock_head") renamed the
> > > index parameter, but forgot to update the kernel-doc markups
> > > accordingly.  
> > 
> > The patch is correct (thank you!), but the description here references
> > a git commit id that's only found in the -next tree and is unstable.
> > 
> > Andrew, can you fold this into the offending commit?
> 
> Patch already reached upstream. So, it gained a stable reference.
> 
> So, I'm changing its description to:
> 
>   Author: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>   Date:   Thu Sep 10 08:38:07 2020 +0200
> 
>     locking/refcount: move kernel-doc markups to the proper place

This is the wrong changelog?

