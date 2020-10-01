Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAAAC47423
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 04:22:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DEB2521D92
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 04:22:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725892AbgJAEWX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 00:22:23 -0400
Received: from smtprelay0025.hostedemail.com ([216.40.44.25]:53216 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725800AbgJAEWX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 00:22:23 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id 60A7C182CED34;
        Thu,  1 Oct 2020 04:22:22 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: owl02_1c06edc27198
X-Filterd-Recvd-Size: 2148
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf04.hostedemail.com (Postfix) with ESMTPA;
        Thu,  1 Oct 2020 04:22:20 +0000 (UTC)
Message-ID: <9b57d0d4896a91debc330a70a20ae0f240afbd3b.camel@perches.com>
Subject: Re: [PATCH V3 1/8] sysfs: Add sysfs_emit and sysfs_emit_at to
 format sysfs output
From:   Joe Perches <joe@perches.com>
To:     Kees Cook <keescook@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Denis Efremov <efremov@linux.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Date:   Wed, 30 Sep 2020 21:22:19 -0700
In-Reply-To: <202009302108.18B05CA38@keescook>
References: <cover.1600285923.git.joe@perches.com>
         <884235202216d464d61ee975f7465332c86f76b2.1600285923.git.joe@perches.com>
         <20200930115740.GA1611809@kroah.com> <202009302108.18B05CA38@keescook>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2020-09-30 at 21:17 -0700, Kees Cook wrote:
> On Wed, Sep 30, 2020 at 01:57:40PM +0200, Greg Kroah-Hartman wrote:
> > Kees, and Rafael, I don't know if you saw this proposal from Joe for
> > sysfs files, questions below:
> 
> I'm a fan. I think the use of sprintf() in sysfs might have been one of
> my earliest complaints about unsafe code patterns in the kernel. ;)
[]
> > > +	if (WARN(!buf || offset_in_page(buf),
> > > +		 "invalid sysfs_emit: buf:%p\n", buf))

The dump_stack() is also going to emit pointers
so I don't see how it does anything but help
show where the buffer was.  It is hashed...

> I don't want the %p here, but otherwise, sure. I'd also make it a _ONCE
> variant:
> 
> 	if (WARN_ONCE(!buf || offset_in_page(buf),
> 		 "invalid sysfs_emit: offset_in_page(buf):%zd\n",
> 		  buf ? offset_in_page(buf) : 0))

I don't think that helps as multiple defects can easily
exist.  Log spam in this case isn't horrible either.


