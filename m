Return-Path: <SRS0=Pt5A=DH=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	GUARANTEED_100_PERCENT,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D16C4727C
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 16:09:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A95C2207FB
	for <linux-doc@archiver.kernel.org>; Wed, 30 Sep 2020 16:09:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbgI3QJY convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:09:24 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:33001 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgI3QJY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Sep 2020 12:09:24 -0400
X-Greylist: delayed 401 seconds by postgrey-1.27 at vger.kernel.org; Wed, 30 Sep 2020 12:09:22 EDT
Received: (qmail 6009 invoked by uid 484); 30 Sep 2020 16:02:40 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.10.40 by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.40):. 
 Processed in 0.403163 secs); 30 Sep 2020 16:02:40 -0000
Received: from unknown (HELO ingpc3.intern.lauterbach.com) (Authenticated_SSL:irohloff@[10.2.10.40])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <corbet@lwn.net>; 30 Sep 2020 16:02:38 -0000
Date:   Wed, 30 Sep 2020 18:02:38 +0200
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [RFC][PATCH] docs: process: Submitting a patch for a single git
 commit.
Message-ID: <20200930180238.1c25692e@ingpc3.intern.lauterbach.com>
In-Reply-To: <20191011112357.7c3863cd@lwn.net>
References: <20191011163358.17667-1-ingo.rohloff@lauterbach.com>
        <20191011112357.7c3863cd@lwn.net>
Organization: Lauterbach GmbH
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi, 

it's been quite a long time, but I really want to try again,
because the last 5 times I tried to send in a patch,
the information I wrote down here is EXACTLY what I needed (5 times...)

I cleaned up the patch a little bit (only very minor modifications),
but before I send this again, let me try to comment on the original
critique.

Additionally I am not even sure how to post a modified patch
to this mailing list :-).
(I need to look that up again).

Summary: I really really think the information I wrote down
is highly useful for someone who:
* knows about git
* knows about e-mail
* in general knows about computers

and just wonders 

    How do I submit a patch for the Linux Kernel source code ?

The text I wrote IS NOT meant for:
* People who do not know about git
* People who do not know about the general workings of E-Mail
* People who in general are working 1st time on a programming project.


With that preface,  referring to the last E-Mail (long time ago...)

On Fri, 11 Oct 2019 11:23:57 -0600
Jonathan Corbet <corbet@lwn.net> wrote:

> On Fri, 11 Oct 2019 18:33:58 +0200
> Ingo Rohloff <ingo.rohloff@lauterbach.com> wrote:
> 
> > A short primer how to submit a single git commit as a patch via
> > e-mail using git send-email.
> > 
> 
> I think we should find a place for this kind of information, but I don't
> think submitting-patches.rst is it.  That's meant to be a comprehensive set
> of rules and guidelines; it's already far too long as it is.  A separate
> document with introductory tutorials might be a good idea.

What my patch tries to provide is explicitly what it says in the commit message

   A primer how to submit a single git commit...

This is not meant to be "introductory".
I expect people who read this to have a working knowledge of:

* Compiling the Linux kernel
* Using git
* Good background knowledge about IT technology in general (like E-Mail ...)

I was in exactly this position; so I googled for 

    linux kernel submit patch

and "submitting-patches" is the one document which stands out.
Note: My code modification was already finished; it compiled, it worked,
I just didn't know how to publish that modification.

I did not google for "an introduction to the Linux Kernel", 
"an introduction how to write a Linux driver", etc.
I did not need an "introduction" to anything. I had the concrete question 

  How exactly do I submit a patch for the Linux Kernel source code?

I think the current "submitting-patches.rst" answers this pretty vaguely.

> That's meant to be a comprehensive set
> of rules and guidelines; it's already far too long as it is.

If you want to get this document shorter, my suggestion would be:
Move all the "comprehensive" part to somewhere else.

I think the document tells you as a side note how to submit a patch;
especially if it's just a minor bug-fix.

So why is this document labeled "submitting-patches" ?

As far as I can tell at least half of the document talks 
about how to write your code modifications so that they are acceptable.
But that's more about "coding style" or 
"general guidelines for writing Linux Kernel source code" 
and not about the process how to submit a patch.

The document currently tells you:
  * 1) Use "diff -up"
    I think this is completely outdated. 
    No one using git will use "diff -up".
    I guess 99% of the people working on the Linux Kernel use git

  * 2) Describe your changes
    That's interesting for someone who has some major work done.
    It's completely irrelevant for someone who wants to send in a minor fix.

  * 3) Separate your Changes
    Again completely irrelevant for someone who wants to send in a minor fix.

  * 5) Select the recipients for your patch
    Unfortunately this section does not tell you about 
       ./scripts/get_maintainer.pl
    which is what you really need.
etc,...

All of this information is useful if someone wants to send in some major modification, 
split over several files and many commits; 
but that's not really about "submitting a patch"; it is more about how to work 
together with other kernel developers to get your contribution into a state,
where it will be accepted.

Additionally it seems the document focuses on how to send a patch via 
a regular E-Mail client (outlook/thunderbird ...); there also is a 
separate document for this (process/email-clients.rst).

My personal experience: Do not use any of these E-Mail clients 
at all; they make life 100% more complicated...
and that's exactly what "process/email-clients.rst" tells you too.





> > +Assumptions:
> > + - You are running a not too old Linux installation.  
> 
> What's "not too old"?  A reader who needs documentation at this level will
> not have an answer to that question.
> 

This sentence means: 
Don't try this on a 20 year old machine which runs a Linux 2.6 kernel.
That's anyway a bad idea, because compiling and testing your patch
will take ages.
What "too old" means is subjective in this sentence.
As long as you (as a developer) are satisfied, then the machine
is obviously not "too old".

> > + - You have ``git`` installed.
> > + - You have the tools for ``git send-email`` installed.
> > +   It seems many Linux distributions deliver this set of tools in a
> > +   separate package. So make sure you have the appropriate package installed.
> > +   ``git send-email`` is able to directly talk to an SMTP server; so you
> > +   do not need a local mail transport agent or similar.
> > + - You have configured ``git send-email``.  
> 
> This, too, will not be helpful to somebody needing this kind of
> documentation.  

I disagree: This is unbelievable helpful.

Let me try to explain:
My biggest problem was to find out that "git send-email" exists.
So far "git send-email" is only mentioned as a side note 
in "submitting-patches.rst" under the section 
  15) Explicit In-Reply-To headers

I already was using git quite a lot, but there never was any need 
to use "git send-email", because nowadays lots of projects use "github"
or if it's inside a company "gitea" or whatever.
This means most of the time, patches are NOT send via E-Mail.

Not that I find anything wrong with E-Mail; 
it's just not used for that many projects.


So then I found out that "git send-email" exists.
So the first thing I tried was to execute
   git send-email ...
and my git tells me it doesn't know this command. 
Huh ?
Oh it turns out "git send-email" is NOT installed per default,
when you install "git". 
"git send-email" is installed as a separate package...
I think "gentoo" might have it directly in the "git" package,
but even there I am not sure.

Next question: Do I have to setup my Mail Transport Agent in a specific
way to use "git send-email" ? 

I know enough about E-Mail etc, to know what an MTA is in principle.

It turns out I do not need to do anything here because "git send-email"
already does it all (because it directly talks to an SMTP server).

Good to know.

I and probably tons of other computer affine people understand
what this means, because we know how E-Mail works in principle.



> We should actually tell them how to do this configuration. 

The next three sentences:

> 
> > +   You might set the properties describing how you would like to send e-mail
> > +   via SMTP with the appropriate ``git config`` commands.
> > +   In particular you might need to set the properties:
> > +   ``sendemail.smtpserver``, ``sendemail.smtpserverport``, ``sendemail.smtpuser``,
> > +   ``sendemail.smtpencryption``, ``sendemail.smtppass``  
> 
> This is a start, but many readers at this level won't really know what this
> means.  

I disagree: 
The target for this primer are people who do understand computers
and Internet and E-Mail and so on.

The target are people, who just don't know how to send in a patch for
the Linux Kernel source code.

If I know what I have to put in the configuration of an E-Mail client
(instead of clicking "auto-detect" or "Wizard"), I very well know what
"smtpserver", "smtpserverport" etc means, because that's exactly
what I need to put into the configuration of my E-Mail client too.

Also: I expect someone reading this to use google and search for

    git send-email configuration


> 
> > +Process:
> > + - Clone the kernel source tree; see :ref:`get_source_tree`
> > + - Use ``git config`` to configure the user name and e-mail address for yourself.  
> 
> Examples are good for this kind of thing.

I expect someone reading this to use google and search for

   git config email

Well thinking more about this sentence :-)
I actually expect someone reading this to already
have executed these commands. 
So you might completely leave this out.


> 
> Also, watch your line lengths; there's no reason to go over 80 columns for
> this kind of text.  You tell people to run checkpatch but didn't do it :)

I tried to fix this (not published yet).

Does "checkpatch" work for ".rst" files ?
I was not aware...

Because you mentioned line lengths:
I would find it quite useful to enforce line breaks at the
output of the ".rst" files, so what you get displayed here:

  https://www.kernel.org/doc/html/v4.17/process/submitting-patches.html

It really helps to have short paragraphs which do not span over the
whole width of my huge 16:9 display.
Is that possible and allowed for the ".rst" files, or this a "no no" ?


> 
> > + - Create and checkout a git branch to work on your code modification. Use: ``git checkout -b <branch
> > name>``
> > + - Modify the code.
> > + - Commit your code to your local git repository into your local branch with a single commit.
> > +   Your commit message should start with a single line: ``<subsystem>: <summary phrase>``.
> > +   The rest of the commit message should follow :ref:`describe_changes`  
> 
> So much of this would work better with an example.

I don't agree:
I basically expect that people who want to send in a patch for the 
Linux Kernel source code to be able to use git anyway.

What's specific for the Linux Kernel is what's expected for the commit message.
Looking at other projects on github: There are a lot of them who use different
suggestions how your commit message should look like; many many many projects
are simply too small to start of with "<subsystem>:".



> 
> > + - Test your changes; they must compile and hopefully fix a problem.  
> 
> "hopefully"?
> 
> Honestly, you probably want to test your changes before you start
> committing things and writing changelogs.
> 

I strongly disagree.

We are talking about your *local* git repository here.
Of course you should start to create commits in 
your *local* git repository.
That's the whole point of using git.

The test phase is about to get your local commits into such 
a shape that you are confident to publish them via E-Mail.

Even with testing it's not 100% guaranteed, that what you publish 
is completely correct. That's why I wrote "hopefully":
It's entirely possible that you publish your change and someone
else (or even yourself) tells you:
    What happens if ...
and then it turns out you overlooked something and you created 
a problem instead of fixing one.

Maybe I should rephrase that to say
   Test your changes; they must compile. Do your best to ensure
   that your changes are fixing a problem and not creating a new one.

?

> > +   If there are problems, modify your commit.
> > +   Use ``git commit --amend`` to modify your commit.  
> 
> ...again...  why would you commit untested changes?
> 

Because this is in your *local* repository.
With git,  "commit" does not mean "publish".
You should not *publish* untested changes;
but it totally makes sense to "commit" them locally, ...
and repeat this several times until you are satisfied.

> > + - You are now ready to generate a patch file suitable for sending via e-mail. Use::
> > +
> > +	git format-patch -1 -s
> > +
> > +   This command should create a patch file, which is close to what you need
> > +   to send via e-mail.
> > +   This command also adds a "Signed-off-by:" line; see :ref:`the_canonical_patch_format`  
> 
> Normally one adds the signoff when committing.

I do it differently:
I expect to run "git commit" several times
(see above, we are talking about your local git repository).

I don't want to run
  git commit -s
every time (I might forget it at least once).

So I do that once, when I am ready to publish the patch.
Of course other people might have different preferences;
I just don't see why I should always enforce a 
sign-off line in my *local* (not published) commits.

> 
> > + - Verify that your patch matches the required style::
> > +
> > +	./scripts/checkpatch.pl <patch file>
> > +
> > +   If there are problems, modify your commit and subsequently your e-mail patch.
> > + - Test if you are able to send the patch to yourself::
> > +
> > +	git send-email --to=<your email address> <patch file>
> > +
> > + - If sending the e-mail to yourself worked, inspect the e-mail you have received
> > +   and check if it adheres to :ref:`the_canonical_patch_format`.  
> 
> This is late to be sure you have your changelog formatted correctly.

I disagree.
It's right before you are ready to publish your code modification.
What you did in the meantime is completely irrelevant (except for yourself),
because none of that is published.

> 
> It can be good advice to tell people to ensure that the patch can be
> applied.  git send-email shouldn't corrupt patches, though.
> 

Yes exactly: That's why my commit message says "... using git send-email".

That's why I so strongly focus on "git send-email"; 
using other E-Mail clients is a nightmare IMHO.

so long
  Ingo


-- 
Dipl.-Inform.
Ingo ROHLOFF
System Engineer/Debug & Trace Tools

Lauterbach Engineering GmbH & Co KG
Altlaufstraße 40
85635 Höhenkirchen-Siegertsbrunn
GERMANY
phone +49 8102 9876-142
mailto:ingo.rohloff@lauterbach.com
https://www.lauterbach.com

Registered Office: Höhenkirchen-Siegertsbrunn, Germany, Local Court: Munich, HRB 87406, VAT ID: DE246770537
Managing Directors: Lothar Lauterbach, Stephan Lauterbach, Dr. Thomas Ullmann
