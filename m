Return-Path: <SRS0=XnAq=2G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217CAC43603
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 20:37:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F325A207FF
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 20:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726940AbfLPUhQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Dec 2019 15:37:16 -0500
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:49504 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726401AbfLPUhQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Dec 2019 15:37:16 -0500
Received: from callcc.thunk.org (guestnat-104-133-0-111.corp.google.com [104.133.0.111] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id xBGKat9W025315
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 16 Dec 2019 15:36:56 -0500
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id 47F0C420821; Mon, 16 Dec 2019 15:36:55 -0500 (EST)
Date:   Mon, 16 Dec 2019 15:36:55 -0500
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Document the Link: tag formally
Message-ID: <20191216203655.GB785904@mit.edu>
References: <20191216093859.9196-1-linus.walleij@linaro.org>
 <877e2w1kfj.fsf@intel.com>
 <20191216133322.GJ25745@shell.armlinux.org.uk>
 <874ky01i8z.fsf@intel.com>
 <20191216141611.GK25745@shell.armlinux.org.uk>
 <871rt41gvb.fsf@intel.com>
 <20191216144348.GL25745@shell.armlinux.org.uk>
 <87woawz4kv.fsf@intel.com>
 <20191216092255.3adb1202@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191216092255.3adb1202@lwn.net>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Dec 16, 2019 at 09:22:55AM -0700, Jonathan Corbet wrote:
> On Mon, 16 Dec 2019 17:13:20 +0200
> Jani Nikula <jani.nikula@linux.intel.com> wrote:
> 
> > The *only* question is, whether we should both use the tag Foo: for the
> > different meanings and different workflows, or whether one should use
> > Foo: and the other should use Bar:.
> 
> This is, of course, a part of the wider discussion on patch tracking IDs
> and such; I kind of doubt that this relatively small group can resolve
> it for the community as a whole.  It seems to be agreed that it's good
> for a patch submission to reference previous postings; I'm not sure that
> we've decided on Link: as the way to do that.

I believe that at least amongst the maintainers at the Maintainer's
Summit and on the follow-on workflows@vger.kernel.org, there is
general consensus for *maintainers* to add a

	Link: https://lore.kernel.org/r/...

tag to the patch that they are accepting into their trees.  There are
even some git hook scripts being circulated which automate this.

What there isn't consensus yet on is a way for patch *submitters* to
reference earler versions of a particular patch.  There is one school
of thought saying that you just match on subject lines, looking for
V<n-1>: commit description to find it.  There are others who don't
like this, because it requires manual searching work, and it doesn't
handle the case where a patch gets split, or merged, or where the
patch description is modified for clarity's sake.

Another school of thought is just keeping the V1, V2, V3, etc.,
versions of the patch as replies to earlier one, so they can be found
via e-mail chaining.  Some people believe this gets ugly, especially
for patches which go through a large number of revisions, and for
patch series with a large number of patches.


What *I've* been doing for ext4 is in the Vn+1 update of a patch, I've
been manually adding a:

Previous-Version-Link: https://lore.kernel.org/r/...

to the commit before mailing it out, and trusting that the maintainer
(me, myself, and I :-) will strip out the Previous-Version-Link: and
adding a Link: trailer to the final version on the mailing list.

This allows someone who is doing code archeology to find the mailing
list reference via the Link: tag in the git tree, and that version of
the patch in the mailing list archive will have a
Previous-Version-Link in the previous version of the commit, going all
the way back to the V1 version of the commit.  That is, the
Previous-Version-Link: trailer never appears in the git commit which
is pushed to Linus; but it *is* in all but the first version of the
patch in the mailing list.

I think this scheme is perfect, without flaw, and Solomonic in meeting
the needs for people to be able to find all of the various versions of
the patch and its discussions while not leaving extra hair in the git
commit found in the repository.  But, I'd also be the first to admit
that it's not general community consensus at this point.  :-)


> That creates a bit of a problem for me; I don't want to be trying to
> create community policy through the docs; I'd rather accept patches that
> I know reflect an existing consensus.

Yeah, I think it's too early at this point for anythig in
submitting-patches.  It may or may not be too early to put in the git
hook automation for automatically adding a pointer to the version of
the patch which the maintainer is actually pulling her repository
using "git am", though.

I'd also suggest redirecting discussions about how to annotate commits
to find previous versions of patches to the workflows@vger.kernel.org
list; that's where most of the discussions on this topic have taken
place since Lisbon.

Cheers,

					- Ted
