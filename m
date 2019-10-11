Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D41947D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Oct 2019 17:24:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbfJKRYA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 Oct 2019 13:24:00 -0400
Received: from ms.lwn.net ([45.79.88.28]:39646 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728086AbfJKRYA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 11 Oct 2019 13:24:00 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0E6422E6;
        Fri, 11 Oct 2019 17:23:59 +0000 (UTC)
Date:   Fri, 11 Oct 2019 11:23:57 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [RFC][PATCH] docs: process: Submitting a patch for a single git
 commit.
Message-ID: <20191011112357.7c3863cd@lwn.net>
In-Reply-To: <20191011163358.17667-1-ingo.rohloff@lauterbach.com>
References: <20191011163358.17667-1-ingo.rohloff@lauterbach.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 11 Oct 2019 18:33:58 +0200
Ingo Rohloff <ingo.rohloff@lauterbach.com> wrote:

> A short primer how to submit a single git commit as a patch via
> e-mail using git send-email.
> 
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> ---
> 
> Notes:
>     I just went through this process and did a lot of mistakes,
>     because I was confused how git commits translate to patches via e-mail.
>     
>     So I thought maybe writing down a very small primer how to submit
>     a single git commit via e-mail employing "git send-email" might
>     be a good idea.
>     
>     I probably still have no clue how to do that correctly; so the primer
>     might have wrong information. Additionally I am not an English native
>     speaker so the language might be less than optimal.
>     
>     What do you think ?
> 
>  Documentation/process/submitting-patches.rst | 63 ++++++++++++++++++++
>  1 file changed, 63 insertions(+)

I think we should find a place for this kind of information, but I don't
think submitting-patches.rst is it.  That's meant to be a comprehensive set
of rules and guidelines; it's already far too long as it is.  A separate
document with introductory tutorials might be a good idea.

> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index fb56297f70dc..b00518584810 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -24,6 +24,8 @@ of the mechanical work done for you, though you'll still need to prepare
>  and document a sensible set of patches.  In general, use of ``git`` will make
>  your life as a kernel developer easier.
>  
> +.. _get_source_tree:
> +
>  0) Obtain a current source tree
>  -------------------------------
>  
> @@ -836,6 +838,67 @@ command like this will do the trick::
>  
>    git request-pull master git://my.public.tree/linux.git my-signed-tag
>  
> +17) A simple use case: Submitting a single git commit with ``git send-email``
> +-----------------------------------------------------------------------------
> +
> +The scenario:
> +You have a small code modification which sensibly fits into
> +a single commit. You want to get this modification into the kernel.
> +
> +Assumptions:
> + - You are running a not too old Linux installation.

What's "not too old"?  A reader who needs documentation at this level will
not have an answer to that question.

> + - You have ``git`` installed.
> + - You have the tools for ``git send-email`` installed.
> +   It seems many Linux distributions deliver this set of tools in a
> +   separate package. So make sure you have the appropriate package installed.
> +   ``git send-email`` is able to directly talk to an SMTP server; so you
> +   do not need a local mail transport agent or similar.
> + - You have configured ``git send-email``.

This, too, will not be helpful to somebody needing this kind of
documentation.  We should actually tell them how to do this configuration. 

> +   You might set the properties describing how you would like to send e-mail
> +   via SMTP with the appropriate ``git config`` commands.
> +   In particular you might need to set the properties:
> +   ``sendemail.smtpserver``, ``sendemail.smtpserverport``, ``sendemail.smtpuser``,
> +   ``sendemail.smtpencryption``, ``sendemail.smtppass``

This is a start, but many readers at this level won't really know what this
means.  

> +Process:
> + - Clone the kernel source tree; see :ref:`get_source_tree`
> + - Use ``git config`` to configure the user name and e-mail address for yourself.

Examples are good for this kind of thing.

Also, watch your line lengths; there's no reason to go over 80 columns for
this kind of text.  You tell people to run checkpatch but didn't do it :)

> + - Create and checkout a git branch to work on your code modification. Use: ``git checkout -b <branch name>``
> + - Modify the code.
> + - Commit your code to your local git repository into your local branch with a single commit.
> +   Your commit message should start with a single line: ``<subsystem>: <summary phrase>``.
> +   The rest of the commit message should follow :ref:`describe_changes`

So much of this would work better with an example.

> + - Test your changes; they must compile and hopefully fix a problem.

"hopefully"?

Honestly, you probably want to test your changes before you start
committing things and writing changelogs.

> +   If there are problems, modify your commit.
> +   Use ``git commit --amend`` to modify your commit.

...again...  why would you commit untested changes?

> + - You are now ready to generate a patch file suitable for sending via e-mail. Use::
> +
> +	git format-patch -1 -s
> +
> +   This command should create a patch file, which is close to what you need
> +   to send via e-mail.
> +   This command also adds a "Signed-off-by:" line; see :ref:`the_canonical_patch_format`

Normally one adds the signoff when committing.

> + - Verify that your patch matches the required style::
> +
> +	./scripts/checkpatch.pl <patch file>
> +
> +   If there are problems, modify your commit and subsequently your e-mail patch.
> + - Test if you are able to send the patch to yourself::
> +
> +	git send-email --to=<your email address> <patch file>
> +
> + - If sending the e-mail to yourself worked, inspect the e-mail you have received
> +   and check if it adheres to :ref:`the_canonical_patch_format`.

This is late to be sure you have your changelog formatted correctly.

It can be good advice to tell people to ensure that the patch can be
applied.  git send-email shouldn't corrupt patches, though.

> + - Find out to which people the e-mail should be send::
> +
> +	./scripts/get_maintainer.pl <patch file>
> +
> +   In general send the e-mail to the appropriate maintainer and put relevant
> +   mailing lists on CC.
> + - Finally send the patch e-mail with::
> +
> +	git send-email --to=<maintainer> --cc=<mailing list 1> --cc=<mailing list 2> ...
> +
>  
>  References
>  ----------

Thanks for working to improve our documentation!  I think there can be
value in something like this, once it gets into shape.

jon
