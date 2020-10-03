Return-Path: <SRS0=Dt6R=DK=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEBAC41604
	for <linux-doc@archiver.kernel.org>; Sat,  3 Oct 2020 14:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86DF8206C3
	for <linux-doc@archiver.kernel.org>; Sat,  3 Oct 2020 14:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbgJCO7u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 3 Oct 2020 10:59:50 -0400
Received: from smtprelay0117.hostedemail.com ([216.40.44.117]:35260 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725747AbgJCO7u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 3 Oct 2020 10:59:50 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 1D589181D3026;
        Sat,  3 Oct 2020 14:59:49 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: songs04_3112f22271ad
X-Filterd-Recvd-Size: 2739
Received: from XPS-9350.home (unknown [47.151.133.149])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Sat,  3 Oct 2020 14:59:47 +0000 (UTC)
Message-ID: <b53b75451c7610ec74d15aaec65fb4959d9483b0.camel@perches.com>
Subject: Re: [PATCH V3 1/8] sysfs: Add sysfs_emit and sysfs_emit_at to
 format sysfs output
From:   Joe Perches <joe@perches.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Denis Efremov <efremov@linux.com>,
        Julia Lawall <julia.lawall@inria.fr>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Date:   Sat, 03 Oct 2020 07:59:46 -0700
In-Reply-To: <20201003135551.GA3187@kroah.com>
References: <cover.1600285923.git.joe@perches.com>
         <884235202216d464d61ee975f7465332c86f76b2.1600285923.git.joe@perches.com>
         <20200930115740.GA1611809@kroah.com> <202009302108.18B05CA38@keescook>
         <9b57d0d4896a91debc330a70a20ae0f240afbd3b.camel@perches.com>
         <202010021527.DF20CE0@keescook> <20201003135551.GA3187@kroah.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, 2020-10-03 at 15:55 +0200, Greg Kroah-Hartman wrote:
> On Fri, Oct 02, 2020 at 03:30:30PM -0700, Kees Cook wrote:
> > On Wed, Sep 30, 2020 at 09:22:19PM -0700, Joe Perches wrote:
> > > On Wed, 2020-09-30 at 21:17 -0700, Kees Cook wrote:
> > > > On Wed, Sep 30, 2020 at 01:57:40PM +0200, Greg Kroah-Hartman wrote:
> > > > > Kees, and Rafael, I don't know if you saw this proposal from Joe for
> > > > > sysfs files, questions below:
> > > > 
> > > > I'm a fan. I think the use of sprintf() in sysfs might have been one of
> > > > my earliest complaints about unsafe code patterns in the kernel. ;)
> > > []
> > > > > > +	if (WARN(!buf || offset_in_page(buf),
> > > > > > +		 "invalid sysfs_emit: buf:%p\n", buf))
> > > 
> > > The dump_stack() is also going to emit pointers
> > > so I don't see how it does anything but help
> > > show where the buffer was.  It is hashed...
> > 
> > dump_stack() is going to report symbols and register contents.
> > 
> > I was just pointing out that %p has no value here[1]. The interesting
> > states are: "was it NULL?" "how offset was it?". Its actual content
> > won't matter.
> 
> Ok, suggestions for a better error message are always welcome :)

For sysfs_emit, the offset_in_buf test also
effectively checks if buf not PAGE_SIZE so
it helps identify if it is being called from
a non _show function.

That's actually why %p can be somewhat valuable.


