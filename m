Return-Path: <SRS0=n+aG=DT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7E6C43457
	for <linux-doc@archiver.kernel.org>; Mon, 12 Oct 2020 10:00:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6CE2208D5
	for <linux-doc@archiver.kernel.org>; Mon, 12 Oct 2020 10:00:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgJLKAa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Oct 2020 06:00:30 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:55149 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbgJLKAa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Oct 2020 06:00:30 -0400
Received: (qmail 26032 invoked by uid 484); 12 Oct 2020 10:00:27 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.10.40 by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.40):. 
 Processed in 0.175292 secs); 12 Oct 2020 10:00:27 -0000
Received: from unknown (HELO ingpc3.intern.lauterbach.com) (Authenticated_SSL:irohloff@[10.2.10.40])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <corbet@lwn.net>; 12 Oct 2020 10:00:25 -0000
Date:   Mon, 12 Oct 2020 12:00:25 +0200
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: process: Submitting a patch for a single git
 commit.
Message-ID: <20201012120025.452df494@ingpc3.intern.lauterbach.com>
In-Reply-To: <20201009094658.0d30b66c@lwn.net>
References: <20201001104724.3876-1-ingo.rohloff@lauterbach.com>
        <20201001104724.3876-2-ingo.rohloff@lauterbach.com>
        <20201009094658.0d30b66c@lwn.net>
Organization: Lauterbach GmbH
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello,

On Fri, 9 Oct 2020 09:46:58 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> On Thu,  1 Oct 2020 12:47:24 +0200
> Ingo Rohloff <ingo.rohloff@lauterbach.com> wrote:
> 
> > A short primer how to submit a single git commit as a patch via
> > e-mail using git send-email.
> > 
> > Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> > ---
> >  Documentation/process/submitting-patches.rst | 72 ++++++++++++++++++++
> >  1 file changed, 72 insertions(+)  
> 
> So I still don't think that this is appropriate for submitting-patches.rst,
> which is already far too long.  It *might* be useful if it were filled out
> and added as a separate tutorial document, though.

"submitting-patches.rst" does not answer "how to submit a patch ?".
70% of the material is about how a patch should look like and how
to react once you have submitted a patch.
The most important tool for *submitting* a patch (git send-email)
is missing completely (only mentioned in a side note).

If you want to get "submitting-patches.rst" shorter, move the material, 
which does not deal with "how to submit a patch", to somewhere else.

> > +Assumptions:
> > + - You are running a not too old Linux installation.  
> 
> What is "too old"?  Somebody who needs a tutorial at this level is unlikely
> to know that.
> 

It means *YOU* are able to work with the machine comfortably
( == you are able to use git, you are able to edit the source code,
you are able to compile the kernel, ...)
This probably will not be the case for a 10 year old computer running a 2.6 kernel.
But this is subjective; hence why I wrote "not too old" (== not too old for YOU).


> > + - You have configured ``git send-email``.
> > +   You might set the properties describing how you would like to send e-mail
> > +   via SMTP with the appropriate ``git config`` commands.
> > +   In particular you might need to set the properties:
> > +   ``sendemail.smtpserver``, ``sendemail.smtpserverport``,
> > +   ``sendemail.smtpuser``, ``sendemail.smtpencryption``, ``sendemail.smtppass``  
> 
> That's an awful lot of configuration that has just been skipped over...
> 

That's exactly the same kind of configuration I need when setting up 
any other E-Mail client without using a wizard.
"submitting-patches.rst" assumes that you are able to setup your E-Mail client.

"git send-email" needs less configuration than setting up a regular E-Mail client,
because the configuration for receiving Mail is not needed.


> > +Process:
> > + - Clone the kernel source tree; see :ref:`get_source_tree`
> > + - Use ``git config`` to configure the user name and e-mail address for
> > +   yourself.  
> 
> If we're going to make a tutorial, actually say how to do that.
> 

This is *NOT* a tutorial.
The text I wrote is trying to answer the question "how to submit a patch ?".
I expect readers to be able to type
  git configure e-mail address
into Google.

As contrast: Right now if I type
  linux kernel submit patch
into Google I get "submitting-patches.rst" as first hit;
and I get no information at all that "git send-email" is 
the right tool to submit a patch.

> > + - Commit your code to your local git repository into your local branch with
> > +   a single commit.
> > +   Your commit message should start with a single line:
> > +   ``<subsystem>: <summary phrase>``.
> > +   The rest of the commit message should follow :ref:`describe_changes`
> > + - Test your changes; they must compile and hopefully fix a problem.  
> 
> Why on earth would you commit your changes before you test them?
> 

Because this is a local git repository.
The whole point in using git is to be able to save
intermediate steps (via "git commit").
You have to cleanup the code modifications before you *publish* them;
but not while you are creating them.

> > + - You are now ready to generate a patch file suitable for sending via e-mail.
> > +   Use::
> > +
> > +	git format-patch -1 -s
> > +
> > +   This command should create a patch file, which is close to what you need
> > +   to send via e-mail.
> > +   This command also adds a "Signed-off-by:" line; see
> > +   :ref:`the_canonical_patch_format`, and :ref:`dev_cert_of_origin`.  
> 
> Why wouldn't you put the signoff in the commit?
> 

Because this is a local git repository.
I expect to have a few iterations, before I am satisfied with the modification.
I do not want to put a sign-off on each local iteration, because that's a waste of time.
I add the sign-off once I am ready to publish (via "git format-patch").

> > + - If sending the e-mail to yourself worked, inspect the e-mail you have
> > +   received and check if it adheres to :ref:`the_canonical_patch_format`.  
> 
> Haven't you already ensured that you've formatted it correctly?
> 

E-Mail programs tend to garble E-Mails (which is already mentioned
in "submitting-patches.rst").
If you want to make sure, that the ASCII content is completely 
unmodified, the only way to find out if that works is to send 
an E-Mail to yourself and inspect it.

That's also why I think "git send-email" is the only reliable
approach to submit a patch; all the other well-known E-Mail programs
are painful, if you want to make sure the ASCII content is not touched
(maybe "mutt" is one of the few exceptions).
If you are behind a corporate SMTP server, then I guess the SMTP server 
itself might STILL modify your E-Mail :-(
(like adding a mandatory "signature"...)

"git send-email" knows how to translate the output
of "git format-patch" into an E-Mail.

In "submitting-patches.rst" it says:
  proper patch formatting can be had with git format-patch

This is misleading.
For sure you *should not* paste or attach the output of 
"git format-patch" into your E-Mail program verbatim.


so long
  Ingo
