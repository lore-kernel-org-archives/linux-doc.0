Return-Path: <SRS0=XnAq=2G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CF3C43603
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 14:31:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 945BD2067C
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 14:31:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbfLPOb7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Dec 2019 09:31:59 -0500
Received: from mga09.intel.com ([134.134.136.24]:61862 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728014AbfLPOb7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 16 Dec 2019 09:31:59 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 06:31:58 -0800
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; 
   d="scan'208";a="205127363"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 06:31:55 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Document the Link: tag formally
In-Reply-To: <20191216141611.GK25745@shell.armlinux.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191216093859.9196-1-linus.walleij@linaro.org> <877e2w1kfj.fsf@intel.com> <20191216133322.GJ25745@shell.armlinux.org.uk> <874ky01i8z.fsf@intel.com> <20191216141611.GK25745@shell.armlinux.org.uk>
Date:   Mon, 16 Dec 2019 16:31:52 +0200
Message-ID: <871rt41gvb.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 16 Dec 2019, Russell King - ARM Linux admin <linux@armlinux.org.uk> wrote:
> On Mon, Dec 16, 2019 at 04:02:04PM +0200, Jani Nikula wrote:
>> On Mon, 16 Dec 2019, Russell King - ARM Linux admin <linux@armlinux.org.uk> wrote:
>> > On Mon, Dec 16, 2019 at 03:14:56PM +0200, Jani Nikula wrote:
>> >> On Mon, 16 Dec 2019, Linus Walleij <linus.walleij@linaro.org> wrote:
>> >> > We have a lot of Link: tags in commits these days and they are
>> >> > not formally defined in the kernel documentation. Let's put
>> >> > a separate paragraph about it in submitting-patches.rst where
>> >> > most other tags are defined.
>> >> >
>> >> > Cc: Jonathan Corbet <corbet@lwn.net>
>> >> > Cc: Russell King <linux@armlinux.org.uk>
>> >> > Reported-by: Russell King <linux@armlinux.org.uk>
>> >> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>> >> > ---
>> >> >  Documentation/process/submitting-patches.rst | 21 ++++++++++++++++----
>> >> >  1 file changed, 17 insertions(+), 4 deletions(-)
>> >> >
>> >> > diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
>> >> > index ba5e944c7a63..20ef984aa743 100644
>> >> > --- a/Documentation/process/submitting-patches.rst
>> >> > +++ b/Documentation/process/submitting-patches.rst
>> >> > @@ -643,9 +643,22 @@ which stable kernel versions should receive your fix. This is the preferred
>> >> >  method for indicating a bug fixed by the patch. See :ref:`describe_changes`
>> >> >  for more details.
>> >> >  
>> >> > +14) Link: tags
>> >> > +--------------
>> >> > +
>> >> > +A Link: attribute can be used to provide a link back to a protocol of a
>> >> > +discussion pertaining to the patch. A typical link looks like this:
>> >> > +
>> >> > +    Link: https://lore.kernel.org/r/<message-id>
>> >> > +
>> >> > +Any HTTP[S] links can be referenced. It is customary for maintainers to add
>> >> > +Link: tags to reference discussions on mailing lists, and this can be done
>> >> > +automatically with the git tool when applying patches in mailbox format, see
>> >> > +:ref:`Documentation/maintainer/configure-git.rst <configure git>`.
>> >> 
>> >> I'd like to emphasize even more strongly that it is applied by the
>> >> maintainer or committer, and should reference the patch that got
>> >> applied. And that the patch submitters shouldn't try to add it
>> >> themselves. (Which makes you wonder about the placement in
>> >> submitting-patches.rst.) IMO other references should use References:
>> >> that is already widely used.
>> >
>> > I'm the maintainer of phylink.  During discussions, I may propose a
>> > patch for someone to try.  When successful, I'll send a new email
>> > submitting the patch officially to davem as the networking maintainer
>> > as an entirely separate thread.
>> >
>> > Using Link: to the patch that was submitted officially is obviously
>> > impossible, but you would want to link to the discussion that resulted
>> > in the patch, rather than the official submission - which would
>> > generally be the submission plus an "applied" reply.
>> 
>> If there are N versions of the patch with discussion that eventually
>> lead to the final version that was applied, which one of the previous
>> patch versions or discussions do you think should be linked to? IMO the
>> only one that actually is unambiguous is the patch that got applied. IMO
>> only patches that were submitted to a mailing list should be applied.
>
> Even if it's just the patch submission and an "applied" reply.  To me,
> that seems to be just noise.
>
> My point with the above scenario is that the discussion that resulted
> in the patch being proposed is the relevant discussion that needs to
> be linked to the patch - which will include the context about why the
> patch was generated and its testing.  The official submission will
> contain none of that.
>
> I guess what this is highlighting is that different people have
> different ways of working, and trying to force one thing (Link:) to
> be used with one way of working doesn't scale across the whole kernel.
>
> So, stating that Link: should only be added by a maintainer or
> committer will have a detrimental effect on workflows that do not
> match the one you have in mind.

Basically this boils down to the question whether it is generally more
useful to have a Link: tag with a very specific meaning and potentially
*other* less specific additional tags for other purposes, or to not
define a specific meaning to the Link: tag at all.

I promote the former, with e.g. References: used for more free form
references. I'm really fine with either, but with the latter I'll just
filter out submitter added Link: tags and turn them to References: or
something in my corner of the kernel. (Meaning that lax Link: tags will
have a detrimental effect on workflows that do not match the one you
have in mind... ;)

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
