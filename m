Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88162C433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 14:58:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54D6E6139B
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 14:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345804AbhDGO6Q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:58:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:59166 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348937AbhDGO6P (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 10:58:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D2EB16113D;
        Wed,  7 Apr 2021 14:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617807483;
        bh=siJkpUcD6mCFNMaKE6gxT+MWCGaL80N43ZT+j1EpZZc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UF3JhGnv3AE/QpcsNjwWD9yfEgfo83GxMxeebxv1AvU7JC3DrjbOjVtEiqHhtGwrU
         qyCzwVU2ePZl6YJackWQFy2Jk/ClOkjDpWep2FYexMRtvoasvZk8JlqOGRCtlob2R4
         QbdvKYSaQleLFhGQcqlW+caBbS29/Np5uBUwYWQ8=
Date:   Wed, 7 Apr 2021 16:58:00 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Thorsten Leemhuis <linux@leemhuis.info>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/2] docs: reporting-issues: make everyone CC the
 regressions list
Message-ID: <YG3IePOftDLd5W+d@kroah.com>
References: <cover.1617786974.git.linux@leemhuis.info>
 <813fc7b082a4b47ec6d34542971e9bba74fd4a51.1617786974.git.linux@leemhuis.info>
 <YG2CztxS4jTia8wM@kroah.com>
 <3df9566e-bb08-f1e2-7afb-a14a28d2d64f@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3df9566e-bb08-f1e2-7afb-a14a28d2d64f@leemhuis.info>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 07, 2021 at 01:21:28PM +0200, Thorsten Leemhuis wrote:
> 
> On 07.04.21 12:00, Greg KH wrote:
> > On Wed, Apr 07, 2021 at 11:21:56AM +0200, Thorsten Leemhuis wrote:
> >> Make people CC the recently created mailing list dedicated to Linux
> >> kernel regressions when reporting one. Some paragraphs had to be
> >> reshuffled and slightly rewritten during the process, as the text
> >> otherwise would have gotten unnecessarily hard to follow.
> >>
> >> The new text also makes reporters include a line useful for automatic
> >> regression tracking solution which does not exist yet, but is planned.
> >> The term "#regzb" (short for regression bot) is inspired by the "#syz"
> >> which can be used to communicate with syszbot (see
> >> https://github.com/google/syzkaller/blob/master/docs/syzbot.md).
> > 
> > While I understand the wish to automate things like this, the #syz
> > marking will actually cause something to go off and do some work, and is
> > only relevant for a very small number of developers, all of whom know to
> > look up the instructions before doing so.  But the #regzb marking will
> > be requested to be added by random users who never have submitted a
> > problem report before, OR from long-time kernel developers who are lucky
> > to ever remember to read the documentation as they "know" how to do
> > this.
> > 
> > So this increased workload by people on the two ends of experience is
> > going to be rough, I predict a very low rate of adoption :(
> 
> Yup, I'm aware of that. And also well aware that I will need to keep an
> eye on things and jump in and reply with mails to add such tags every
> time they are missing.
> But I think that direction it the best shot, as tying putting all the
> burden on one person (me) is likely to fail, as our history with
> regression tracking showed. And I think such tags with some bot in the
> background
> (as outlined roughly in
> https://linux-regtracking.leemhuis.info/post/hello-world/ ) have at
> least the best chance, as things are not out-of-band like tracking them
> in bugzilla would be – or do you think that would be a better approach
> together with its email-interface?

Ok, we can try it, I'm not going to say it's not going to work, just
that it's going to be a marketing effort to tell people how to do this
:)

> > What is the tag going to be good for?  The reports will need to be
> > handled by a person anyway and classified and tracked out-of-band from
> > the list somehow.  Will a tag do all that much here?
> 
> I think is has, as then a good regression report will make the
> still-to-be-written regression-bot create and entry that links to the
> report and send a reply with a unique ID; then that ID needs to end up
> in the commit that fixes the regression later (similar to how the IDs
> for issues found by syzbot are mentioned there, which afaics works quite
> well for people) and the regression-bot can close the entry automatically.

Ah, ok, that makes more sense, nevermind, no objection from me, sorry
for the noise.

thanks,

greg k-h
