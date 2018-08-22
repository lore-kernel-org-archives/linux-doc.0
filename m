Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 096EF7D581
	for <lwn-linux-doc@archive.lwn.net>; Wed, 22 Aug 2018 19:46:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727821AbeHVXMb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 22 Aug 2018 19:12:31 -0400
Received: from mail.linuxfoundation.org ([140.211.169.12]:37078 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727687AbeHVXMb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Aug 2018 19:12:31 -0400
Received: from localhost (5355525A.cm-6-6b.dynamic.ziggo.nl [83.85.82.90])
        by mail.linuxfoundation.org (Postfix) with ESMTPSA id 418C1CDD;
        Wed, 22 Aug 2018 19:46:16 +0000 (UTC)
Date:   Wed, 22 Aug 2018 21:46:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Joe Perches <joe@perches.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Rob Herring <rob.herring@linaro.org>,
        Jonas Oberg <jonas@fsfe.org>,
        Andrew Morton <akpm@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH V2] license-rules.rst and LICENSES: Use only spdx version
 3 with -only and -or-later
Message-ID: <20180822194613.GB3457@kroah.com>
References: <9f90ed3678d32bdde88d63e877880dcb08a97e15.1534519501.git.joe@perches.com>
 <7275a821f20ba080b6a262089ceeaf8fa94d4bab.camel@perches.com>
 <CA+55aFyd5D9Rj2Wm+rP9QnZg2Jd_LKqPTKTmPv+doYN=JXra=w@mail.gmail.com>
 <alpine.DEB.2.21.1808222115050.1652@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.1808222115050.1652@nanos.tec.linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 22, 2018 at 09:17:42PM +0200, Thomas Gleixner wrote:
> On Wed, 22 Aug 2018, Linus Torvalds wrote:
> > On Wed, Aug 22, 2018 at 11:01 AM Joe Perches <joe@perches.com> wrote:
> > >
> > > How likely is it that this is applied at rc1?
> > 
> > I'm staying out of the crazy license name bikeshedding, so it's going
> > to be up to the people who have decided they care.
> > 
> > I think whoever *did* care and argued for the change to the SPDX
> > format is a hopeless wanker. "GPL-2.0{-only,-or-later}" is in no ways
> > better than the "GPL-2.0{,+}" that was in an earlier version of the
> > SPDX spec
> > 
> > So I want nothing at all to do with pointless patches. Life is too
> > short to deal with this.
> > 
> > Other people disagree, so I expect I will get these kinds of stupid
> > noise patches through the usual channels.
> 
> I'm not a great fan of that change either. We have settled on a well
> documented and machine readable format. External tools have to be able to
> deal with SPDX versions anyway and if we do this now, then we have the next
> round of pointless churn in a year when the SPDX folks decide to rename yet
> another license identifier which is used in the kernel.

I too agree with Thomas, the SPDX change was crazy, what we have now is
fine and we should stick with it.

thanks,

greg k-h
