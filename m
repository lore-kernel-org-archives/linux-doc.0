Return-Path: <SRS0=XnAq=2G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2150AC43603
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 14:43:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE517206EC
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 14:43:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="NhldL4qb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbfLPOn4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Dec 2019 09:43:56 -0500
Received: from pandora.armlinux.org.uk ([78.32.30.218]:40478 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728056AbfLPOn4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Dec 2019 09:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jy4x/kgGhRno21TIG0l1O8UFAlziIiXJTHGmZhDv5zE=; b=NhldL4qbw05vhdWynxivrs3CJ
        kqYJR67ti6fgwJKQTg9HPZqaGfc7zEtvAkHwau3Q4Q1HFplr43i7V+z9zjAlWclWkx3CiqrX2Rte4
        oQ/K4MTqKOcS6GVk4AVok4A8OX3mbjfTtAyrXjHqtzJhtP5I8J9DW7G8DakmU6tH9aILsJbS3OM3d
        zrakxrDH3drJQ/C0/86farEY7Zp20RslCTLwhgUxPrNGeobufD9kR3qvnqjnXiwXL7Lu/fGxAiDBJ
        GhU7ecFBY1FAWcgHLtIr+P182r+umM258iP41FyYH4Y2itBCkrcFDkC6+mMdNpGjD3pYOYv+Z1otG
        knph8csuA==;
Received: from shell.armlinux.org.uk ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:49668)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1igrbC-000878-A7; Mon, 16 Dec 2019 14:43:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1igrbA-0002UA-IJ; Mon, 16 Dec 2019 14:43:48 +0000
Date:   Mon, 16 Dec 2019 14:43:48 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Document the Link: tag formally
Message-ID: <20191216144348.GL25745@shell.armlinux.org.uk>
References: <20191216093859.9196-1-linus.walleij@linaro.org>
 <877e2w1kfj.fsf@intel.com>
 <20191216133322.GJ25745@shell.armlinux.org.uk>
 <874ky01i8z.fsf@intel.com>
 <20191216141611.GK25745@shell.armlinux.org.uk>
 <871rt41gvb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871rt41gvb.fsf@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 16, 2019 at 04:31:52PM +0200, Jani Nikula wrote:
> On Mon, 16 Dec 2019, Russell King - ARM Linux admin <linux@armlinux.org.uk> wrote:
> > On Mon, Dec 16, 2019 at 04:02:04PM +0200, Jani Nikula wrote:
> >> On Mon, 16 Dec 2019, Russell King - ARM Linux admin <linux@armlinux.org.uk> wrote:
> >> > On Mon, Dec 16, 2019 at 03:14:56PM +0200, Jani Nikula wrote:
> >> >> On Mon, 16 Dec 2019, Linus Walleij <linus.walleij@linaro.org> wrote:
> >> >> > We have a lot of Link: tags in commits these days and they are
> >> >> > not formally defined in the kernel documentation. Let's put
> >> >> > a separate paragraph about it in submitting-patches.rst where
> >> >> > most other tags are defined.
> >> >> >
> >> >> > Cc: Jonathan Corbet <corbet@lwn.net>
> >> >> > Cc: Russell King <linux@armlinux.org.uk>
> >> >> > Reported-by: Russell King <linux@armlinux.org.uk>
> >> >> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> >> >> > ---
> >> >> >  Documentation/process/submitting-patches.rst | 21 ++++++++++++++++----
> >> >> >  1 file changed, 17 insertions(+), 4 deletions(-)
> >> >> >
> >> >> > diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> >> >> > index ba5e944c7a63..20ef984aa743 100644
> >> >> > --- a/Documentation/process/submitting-patches.rst
> >> >> > +++ b/Documentation/process/submitting-patches.rst
> >> >> > @@ -643,9 +643,22 @@ which stable kernel versions should receive your fix. This is the preferred
> >> >> >  method for indicating a bug fixed by the patch. See :ref:`describe_changes`
> >> >> >  for more details.
> >> >> >  
> >> >> > +14) Link: tags
> >> >> > +--------------
> >> >> > +
> >> >> > +A Link: attribute can be used to provide a link back to a protocol of a
> >> >> > +discussion pertaining to the patch. A typical link looks like this:
> >> >> > +
> >> >> > +    Link: https://lore.kernel.org/r/<message-id>
> >> >> > +
> >> >> > +Any HTTP[S] links can be referenced. It is customary for maintainers to add
> >> >> > +Link: tags to reference discussions on mailing lists, and this can be done
> >> >> > +automatically with the git tool when applying patches in mailbox format, see
> >> >> > +:ref:`Documentation/maintainer/configure-git.rst <configure git>`.
> >> >> 
> >> >> I'd like to emphasize even more strongly that it is applied by the
> >> >> maintainer or committer, and should reference the patch that got
> >> >> applied. And that the patch submitters shouldn't try to add it
> >> >> themselves. (Which makes you wonder about the placement in
> >> >> submitting-patches.rst.) IMO other references should use References:
> >> >> that is already widely used.
> >> >
> >> > I'm the maintainer of phylink.  During discussions, I may propose a
> >> > patch for someone to try.  When successful, I'll send a new email
> >> > submitting the patch officially to davem as the networking maintainer
> >> > as an entirely separate thread.
> >> >
> >> > Using Link: to the patch that was submitted officially is obviously
> >> > impossible, but you would want to link to the discussion that resulted
> >> > in the patch, rather than the official submission - which would
> >> > generally be the submission plus an "applied" reply.
> >> 
> >> If there are N versions of the patch with discussion that eventually
> >> lead to the final version that was applied, which one of the previous
> >> patch versions or discussions do you think should be linked to? IMO the
> >> only one that actually is unambiguous is the patch that got applied. IMO
> >> only patches that were submitted to a mailing list should be applied.
> >
> > Even if it's just the patch submission and an "applied" reply.  To me,
> > that seems to be just noise.
> >
> > My point with the above scenario is that the discussion that resulted
> > in the patch being proposed is the relevant discussion that needs to
> > be linked to the patch - which will include the context about why the
> > patch was generated and its testing.  The official submission will
> > contain none of that.
> >
> > I guess what this is highlighting is that different people have
> > different ways of working, and trying to force one thing (Link:) to
> > be used with one way of working doesn't scale across the whole kernel.
> >
> > So, stating that Link: should only be added by a maintainer or
> > committer will have a detrimental effect on workflows that do not
> > match the one you have in mind.
> 
> Basically this boils down to the question whether it is generally more
> useful to have a Link: tag with a very specific meaning and potentially
> *other* less specific additional tags for other purposes, or to not
> define a specific meaning to the Link: tag at all.
> 
> I promote the former, with e.g. References: used for more free form
> references. I'm really fine with either, but with the latter I'll just
> filter out submitter added Link: tags and turn them to References: or
> something in my corner of the kernel. (Meaning that lax Link: tags will
> have a detrimental effect on workflows that do not match the one you
> have in mind... ;)

Well, I've just done it again:

- Patch submitted sends a patch series that uses some of my code
- I review the series, and spot deficiencies in it which can be
  solved by patching my code to add additional functionality.
- I create a patch for my code, and send it as a reply to that
  thread.  The discussion in the thread is entirely relevant to
  the patch.
- They review it and decide whether or not it solves their problem
  and whether they want to use that approach.
- If successful, I send it "officially" as an entirely separate
  thread.
- Maybe Andrew Lunn reviews it and sends a reviewed-by tag.
- DaveM applies it and sends an "applied" message.

With Link: pointing at the "official" submission, all the context
behind why the patch was necessary gets lost.

With Link: pointing at the email in the original discussion that
contained the patch proposal, the discussion for the patch (including
all the things that you're talking about) get properly linked to.
So, I would much rather have Link: pointing to this discussion rather
than a useless "it was reviewed and applied" set of emails, which we
know anyway from the attributation tags that are on the commit.

I guess with your workflow is along the lines of:

- Patch gets officially submitted
- Patch gets reviewed and some discussion happens
- Result of the discussion is to apply the patch
- Patch gets applied with Link: to the official submission

which does seem appropriate to ensure that the Link: tag is added
when the patch is applied.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
