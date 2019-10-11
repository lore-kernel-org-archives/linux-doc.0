Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E6B887D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Oct 2019 19:37:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728851AbfJKThg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 Oct 2019 15:37:36 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:34163 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728799AbfJKThg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Oct 2019 15:37:36 -0400
Received: (qmail 24279 invoked by uid 484); 11 Oct 2019 19:37:34 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.10.40 by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.40):. 
 Processed in 0.08584 secs); 11 Oct 2019 19:37:34 -0000
Received: from unknown (HELO ingpc3.intern.lauterbach.com) (Authenticated_SSL:irohloff@[10.2.10.40])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <corbet@lwn.net>; 11 Oct 2019 19:37:33 -0000
Date:   Fri, 11 Oct 2019 21:37:33 +0200
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [RFC][PATCH] docs: process: Submitting a patch for a single git
 commit.
Message-ID: <20191011213724.63510d15@ingpc3.intern.lauterbach.com>
In-Reply-To: <20191011112357.7c3863cd@lwn.net>
References: <20191011163358.17667-1-ingo.rohloff@lauterbach.com>
        <20191011112357.7c3863cd@lwn.net>
Organization: Lauterbach GmbH
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 11 Oct 2019 11:23:57 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> On Fri, 11 Oct 2019 18:33:58 +0200
> Ingo Rohloff <ingo.rohloff@lauterbach.com> wrote:
> 
> ...
> 
> I think we should find a place for this kind of information, but I don't
> think submitting-patches.rst is it.  That's meant to be a comprehensive set
> of rules and guidelines; it's already far too long as it is.  A separate
> document with introductory tutorials might be a good idea.
> 

Could you make a suggestion where to put it ?

I did not really explain my intention:
This was not intended as an introductory tutorial.

The intention is to provide a "Quick Start" for people
who know what they are doing in general, but simply do not
have any knowledge about the particular process involved
in submitting a Linux kernel patch.

I fully expect that someone who reads this at least knows:

- How to use git
- How to modify/configure/compile/test a kernel
- Has an idea what an SMTP server is
- ...

My personal problem was that I wanted to submit a patch.
I have no trouble compiling Linux kernels and working with git etc.
But I for sure did not have any idea at all how to convert a 
git commit into a patch for submission into the Linux kernel.

So the problem was only about what exactly should be send in
which format where.

I did not know about "git send-email"; I read about it somewhere.
I tried it and got "unknown command", because it seems most 
Linux distributions have that in a separate package.
I was wondering if I needed an extra special version of git.
After I found that I need to install an extra package,
I was wondering next if I need other software too
(like "exim" or "postfix" or "sendmail" or ...)

The intended audience of this primer are people who are
proficient with computers (they know about SMTP/MTAs/git ...)
but simply never submitted a Linux patch before.

I myself ended up sending the same patch at least three times
and I am still slightly embarrassed.

I think I actually did some small stuff on the  Linux kernel 
20 years ago maybe ?
Boy have things changed ;-) 
git did not exist back then, and I do not think "Signed-off-by",
was mentioned anywhere.

with best regards
  Ingo Rohloff
