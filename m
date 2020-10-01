Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A30C4727E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 20:50:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0B75D207FB
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 20:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601585429;
	bh=tkftAJJw4eHQVipuxbLGrDEWsKQk8VPMXCHg34fOM/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=B6yEEtKmS3uJ+LptMqTPUXBThqf/+fcJGk9i0xixLu4Tf8ichLKeExeFfjLbw36LM
	 S2uKUTL8WfeKwyYU30hkIVuKI5AEQi4INYWcMN/49JdJ620B8QPmy5cLZkGVxSheKQ
	 tbxgEBf0gqmucz9zOvHADuu/yrDscyGM2ptpS+80=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727143AbgJAUu2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 16:50:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:41740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726581AbgJAUu2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Oct 2020 16:50:28 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A47A120738;
        Thu,  1 Oct 2020 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601585428;
        bh=tkftAJJw4eHQVipuxbLGrDEWsKQk8VPMXCHg34fOM/Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sUQDBWR994orJZ2Ogvh5Bk7s23V9UNKAk1A+SY9j0ShN2y/O9UsXUCbkEvs1Xoch9
         6Oswz/7CHuDRVysLAp2KmaWnsG3IUyg64nTdGNGhnitZDeluy0TQ7+AMZ0IVZeR2Po
         k04krle85Z2vFyUmi9GduHDe1tlwNg7Z3/FJIv1s=
Date:   Thu, 1 Oct 2020 22:50:29 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Joe Perches <joe@perches.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Denis Efremov <efremov@linux.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH V3 1/8] sysfs: Add sysfs_emit and sysfs_emit_at to format
 sysfs output
Message-ID: <20201001205029.GC915579@kroah.com>
References: <cover.1600285923.git.joe@perches.com>
 <884235202216d464d61ee975f7465332c86f76b2.1600285923.git.joe@perches.com>
 <20200930115740.GA1611809@kroah.com>
 <202009302108.18B05CA38@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202009302108.18B05CA38@keescook>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 30, 2020 at 09:17:03PM -0700, Kees Cook wrote:
> On Wed, Sep 30, 2020 at 01:57:40PM +0200, Greg Kroah-Hartman wrote:
> > Kees, and Rafael, I don't know if you saw this proposal from Joe for
> > sysfs files, questions below:
> 
> I'm a fan. I think the use of sprintf() in sysfs might have been one of
> my earliest complaints about unsafe code patterns in the kernel. ;)

Ok, great.

> > > +/**
> > > + *	sysfs_emit - scnprintf equivalent, aware of PAGE_SIZE buffer.
> > > + *	@buf:	start of PAGE_SIZE buffer.
> > > + *	@fmt:	format
> > > + *	@...:	optional arguments to @format
> > > + *
> > > + *
> > > + * Returns number of characters written to @buf.
> > > + */
> > > +int sysfs_emit(char *buf, const char *fmt, ...)
> > > +{
> > > +	va_list args;
> > > +	int len;
> > > +
> > > +	if (WARN(!buf || offset_in_page(buf),
> > > +		 "invalid sysfs_emit: buf:%p\n", buf))
> 
> I don't want the %p here, but otherwise, sure. I'd also make it a _ONCE
> variant:
> 
> 	if (WARN_ONCE(!buf || offset_in_page(buf),
> 		 "invalid sysfs_emit: offset_in_page(buf):%zd\n",
> 		  buf ? offset_in_page(buf) : 0))

As Joe points out, _ONCE doesn't work because this happens from all
sysfs files, not just one.

thanks,

greg k-h
