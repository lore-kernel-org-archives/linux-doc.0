Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C63C4321E
	for <linux-doc@archiver.kernel.org>; Mon,  6 Dec 2021 15:43:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356555AbhLFPqx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Dec 2021 10:46:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390069AbhLFPlv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Dec 2021 10:41:51 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77A3C0698CB
        for <linux-doc@vger.kernel.org>; Mon,  6 Dec 2021 07:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=9zaj0vvOAuaqeJVKcN9fLCO3atOJhN+jBhvKBL3Oadw=; b=C3AzfweDa/y0Nuk6n5G7NXTZSs
        SEdzwVUvoKfEX/FyKuHovFA7pPrVuTXvBOyb69l67bprCli9x1DFRS5kWcRfu3sZaj7KSbSKhF6Lo
        2UhiziWZ2nSHbvKXwE8MmSsOeJojkmSX6SVPc845jRZyPHga9SKVHjj/JMTeyHXnXZRhOrV9/WQyt
        /pMCOsn0AsYrmL0pOdt71e0ChU8v+0K8IXEM5FR2bBEpL8/spXoTMKBBceLds4VlFSrGuhaYYyk+n
        wmxxcjTYAKN/bT9wXHzyZ9trEh5WocTYMR857vdyJiR24E+2+1RgUHKN9Id0zJDBmCsfLznjRL2Hu
        3+gF6Nrg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1muFrx-00545o-Qz; Mon, 06 Dec 2021 15:25:33 +0000
Date:   Mon, 6 Dec 2021 15:25:33 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Subject: Re: css missing
Message-ID: <Ya4rbTf5fZm6xG7o@casper.infradead.org>
References: <Ya4YvBcsxXLhjwRj@casper.infradead.org>
 <b4db5978-c6cd-edf0-fcd8-bb20aa0e2cbf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4db5978-c6cd-edf0-fcd8-bb20aa0e2cbf@gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Dec 07, 2021 at 12:08:44AM +0900, Akira Yokosawa wrote:
> Hi,
> 
> On Mon, 6 Dec 2021 14:05:48 +0000, Matthew Wilcox wrote:
> > I don't know what changed to cause this (could be something in Debian,
> > could be something in the kernel).
> > 
> > On August 16th, I generated a 'make htmldocs' that looks fine.
> > Yesterday, I generated one and it's missing these two crucial lines
> > (there are many other changes, but restoring these two lines to any
> > given file makes it look fine):
> > 
> >    <link rel="stylesheet" href="../_static/css/theme.css" type="text/css" />
> >    <link rel="stylesheet" href="../_static/pygments.css" type="text/css" />
> > 
> > I can't find any commits that look relevant.  I have sphinx 4.3.1-1
> > installed.  I also tried with 4.2.0-5 with the same result.
> 
> I guess you have sphinx-rtd-theme 1.0.0 installed along the way.

I do!

Package: python3-sphinx-rtd-theme
Source: sphinx-rtd-theme
Version: 1.0.0+dfsg-1

> It lost compatibility with Documentation/conf.py.
> 
> It has been fixed by commit d69dab7de208 ("docs: conf.py: fix support
> for Readthedocs v 1.0.0") in docs-next branch of the -doc tree.
> It is not merged upstream yet, though.

Thanks!  Tried it and the css are indeed back:

      <link rel="stylesheet" href="_static/pygments.css" type="text/css" />
      <link rel="stylesheet" href="_static/css/theme.css" type="text/css" />
      <link rel="stylesheet" href="_static/theme_overrides.css" type="text/css" />

Jon, do you want to hurry that patch into Linus' tree before 5.17?
