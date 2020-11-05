Return-Path: <SRS0=kdU1=EL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5E9C55179
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 15:21:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A66152074B
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 15:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604589668;
	bh=PVzV8RSCyjsTW4bwO+dadmNCZfv25T3pDwXzNyWa+98=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=S1KPfqz4v6sMKWjHLZE6UeXd+TLs6JI55WmEmrPz/QNxz0/s3TKYcMWO9G/Wt5KWl
	 6HRjEYmU471XdpVD23max+KtY0X3bv4uCKKZkTkDGq5D5EyrjKLNw6j757G0D4ALex
	 Zxvl3Bj/3wyPkwT/r0bKu75OiwnqnkEde0Y7wVQw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730906AbgKEPVI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Nov 2020 10:21:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:58670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730660AbgKEPVI (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 5 Nov 2020 10:21:08 -0500
Received: from coco.lan (ip5f5ad5d8.dynamic.kabel-deutschland.de [95.90.213.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0771F20715;
        Thu,  5 Nov 2020 15:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604589667;
        bh=PVzV8RSCyjsTW4bwO+dadmNCZfv25T3pDwXzNyWa+98=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=FyNfatrWi96kOs7jsmCKdPDyXVhzlnyUcdxWjpVXwPoz/7Xc1Is16CsqAbFzFlQtd
         z/0jqdiIh6zljv63zHsrbdO53wcxDXq0zK02+XwIS5hRi7Kl7AMgO6StSlVvndZlVe
         h+DmWv62FN83RHu0TBdugjzD8oc08H25KRdsbNBc=
Date:   Thu, 5 Nov 2020 16:20:59 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 56/56] scrpits: kernel-doc: validate kernel-doc
 markup with the actual names
Message-ID: <20201105162059.366b44bc@coco.lan>
In-Reply-To: <20201105150017.GL17076@casper.infradead.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
        <a21343a7012c87391c4850bf3151ebd82add8d1c.1603469755.git.mchehab+huawei@kernel.org>
        <20201105150017.GL17076@casper.infradead.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Thu, 5 Nov 2020 15:00:17 +0000
Matthew Wilcox <willy@infradead.org> escreveu:

> On Fri, Oct 23, 2020 at 06:33:43PM +0200, Mauro Carvalho Chehab wrote:
> > Kernel-doc currently expects that the kernel-doc markup to come
> > just before the function/enum/struct/union/typedef prototype.
> > 
> > Yet, if it find things like:
> > 
> > 	/**
> > 	 * refcount_add - add a value to a refcount
> > 	 * @i: the value to add to the refcount
> > 	 * @r: the refcount
> > 	 */
> > 	static inline void __refcount_add(int i, refcount_t *r, int *oldp);
> > 	static inline void refcount_add(int i, refcount_t *r);
> > 
> > Kernel-doc will do the wrong thing:  
> 
> I wonder if we could change kernel-doc to be (optionally) less verbose.
> If we allowed people to write:
> 
> /**
>  * Add a value to a refcount.
>  * @i: The value to add to the refcount
>  * @r: The refcount
>  */
> 
> and had the kernel-doc script pick up the name of the following function
> automatically, would that be an improvement we could all agree on?

Matthew,

As patches are usually generated with -U3, the context lines are
not enough to show if a comment preceding a function is a kernel-doc
markup or a normal comment.

In practice, on some patches at this series, I found real issues
because something else was added between the kernel-doc markup 
and the documented function. 

So, for me, it sounds a bad idea to remove the function name, as
this can be used to detect such issues.

Thanks,
Mauro
