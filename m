Return-Path: <SRS0=KUUv=ED=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1267C388F7
	for <linux-doc@archiver.kernel.org>; Wed, 28 Oct 2020 21:54:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A475246CD
	for <linux-doc@archiver.kernel.org>; Wed, 28 Oct 2020 21:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603922091;
	bh=QFs2Jd82B/duDQUbnrOcXLl4AkfxXTk1Jk6X3stA6do=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-ID:From;
	b=fv++J6UtSWH9kMYfxrBIcpgRh678W84so+rEXAAGkzIkcahx3U9sXtW+m0o/IseT/
	 fp/1knIPtKudNCZ22280FW8IwGKVM/pZUE/LFbSFRMFYG+NVQaq6hfMWV/lZ1F1rZu
	 cQHsEkJ2v06bft9RsXi7MAAlI+ezSwk8AmQdJJxs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727931AbgJ1Vyt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 17:54:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:45068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728316AbgJ1VwZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:52:25 -0400
Received: from coco.lan (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0CD7221F9;
        Wed, 28 Oct 2020 17:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603904574;
        bh=QFs2Jd82B/duDQUbnrOcXLl4AkfxXTk1Jk6X3stA6do=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=DDcyzrtNeRJq/mgcxRz/Qmm1osfamHDMFcWkQzvkzAQ/KMh0jLtZ9L2Zkun233Cl3
         KICdkhYyJCk/vV6k1Z5ZvM0yzJk8FmUzVg9VOZCCNUeFu5nvsGTGo74vsWVUMndbtO
         DaHHU/7+KyxGUXl4M0OIM3wUEuJGBQ++WQ3Uywp8=
Date:   Wed, 28 Oct 2020 18:02:47 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/33] docs: kernel_abi.py: add a script to parse ABI
 documentation
Message-ID: <20201028180247.14350c88@coco.lan>
In-Reply-To: <20201028102103.35884c91@lwn.net>
References: <cover.1603893146.git.mchehab+huawei@kernel.org>
        <fbc723a2c49bd928f7845cba08e4996b9eb73142.1603893146.git.mchehab+huawei@kernel.org>
        <20201028102103.35884c91@lwn.net>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 28 Oct 2020 10:21:03 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> So this is separate from the patch series itself in a way, but it brings a
> question to mind:
> 
> On Wed, 28 Oct 2020 15:23:10 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > +# We can't assume that six is installed
> > +PY3 = sys.version_info[0] == 3
> > +PY2 = sys.version_info[0] == 2
> > +if PY3:
> > +    # pylint: disable=C0103, W0622
> > +    unicode     = str
> > +    basestring  = str  
> 
> I wonder how much longer we really need to support any of:
> 
>  - Python < 3.n (where n=5 or 6 maybe)
>  - Sphinx < 1.7 or even some 2.x
> 
> We're carrying a certain and growing amount of cruft to handle these
> cases.  I might start putting together a series to clean this up for 5.11
> or so.

Good point!

Yeah, 5.11 seems to be OK to drop support for legacy versions. In the case
of Sphinx, Imagining that 5.11 would be released in about 4/5 months
from now[1], I would move to 2.4.4 as the minimal recommended version.



Yet, due to LTS distros, maybe it could make sense to support 1.7 versions
for a longer time.

That's said, hopefully, Sphinx 3.3 would also be there about the same
time, which should fix the remaining warnings with Sphinx 3.x.

So, maybe for 5.11 or 5.12 we can drop the warning about Sphinx 3.x
builds being experimental.

Btw, we should probably also update this file:

	Documentation/process/changes.rst

It still mentions Sphinx 1.3 as the minimal one, and doesn't even
mention the minimal Python version.

[1] It was released in March, 2020. So, it will have one about year old
    by the time 5.11 will be launched.

Thanks,
Mauro
