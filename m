Return-Path: <SRS0=YNrp=DQ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 865DFC433E7
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 15:47:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DE752225D
	for <linux-doc@archiver.kernel.org>; Fri,  9 Oct 2020 15:47:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387664AbgJIPrB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Oct 2020 11:47:01 -0400
Received: from ms.lwn.net ([45.79.88.28]:43018 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389144AbgJIPrA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Oct 2020 11:47:00 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 4025737C;
        Fri,  9 Oct 2020 15:47:00 +0000 (UTC)
Date:   Fri, 9 Oct 2020 09:46:58 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/1] docs: process: Submitting a patch for a single git
 commit.
Message-ID: <20201009094658.0d30b66c@lwn.net>
In-Reply-To: <20201001104724.3876-2-ingo.rohloff@lauterbach.com>
References: <20201001104724.3876-1-ingo.rohloff@lauterbach.com>
        <20201001104724.3876-2-ingo.rohloff@lauterbach.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  1 Oct 2020 12:47:24 +0200
Ingo Rohloff <ingo.rohloff@lauterbach.com> wrote:

> A short primer how to submit a single git commit as a patch via
> e-mail using git send-email.
> 
> Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
> ---
>  Documentation/process/submitting-patches.rst | 72 ++++++++++++++++++++
>  1 file changed, 72 insertions(+)

So I still don't think that this is appropriate for submitting-patches.rst,
which is already far too long.  It *might* be useful if it were filled out
and added as a separate tutorial document, though.

A few minor comments below...

> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 5219bf3cddfc..a73b94f677c8 100644
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
> @@ -419,6 +421,7 @@ and other kernel developers more easily distinguish patches from other
>  e-mail discussions.
>  
>  
> +.. _dev_cert_of_origin:
>  
>  11) Sign your work - the Developer's Certificate of Origin
>  ----------------------------------------------------------
> @@ -892,6 +895,75 @@ command like this will do the trick::
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

What is "too old"?  Somebody who needs a tutorial at this level is unlikely
to know that.

> + - You have ``git`` installed.
> + - You have the tools for ``git send-email`` installed.
> +   It seems many Linux distributions deliver this set of tools in a
> +   separate package. So make sure you have the appropriate package installed.
> +   ``git send-email`` is able to directly talk to an SMTP server; so you
> +   do not need a local mail transport agent or similar.
> + - You have configured ``git send-email``.
> +   You might set the properties describing how you would like to send e-mail
> +   via SMTP with the appropriate ``git config`` commands.
> +   In particular you might need to set the properties:
> +   ``sendemail.smtpserver``, ``sendemail.smtpserverport``,
> +   ``sendemail.smtpuser``, ``sendemail.smtpencryption``, ``sendemail.smtppass``

That's an awful lot of configuration that has just been skipped over...

> +Process:
> + - Clone the kernel source tree; see :ref:`get_source_tree`
> + - Use ``git config`` to configure the user name and e-mail address for
> +   yourself.

If we're going to make a tutorial, actually say how to do that.

> + - Create and checkout a git branch to work on your code modification.
> +   Use: ``git checkout -b <branch name>``
> + - Modify the code.
> + - Commit your code to your local git repository into your local branch with
> +   a single commit.
> +   Your commit message should start with a single line:
> +   ``<subsystem>: <summary phrase>``.
> +   The rest of the commit message should follow :ref:`describe_changes`
> + - Test your changes; they must compile and hopefully fix a problem.

Why on earth would you commit your changes before you test them?

> +   If there are problems, modify your commit.
> +   Use ``git commit --amend`` to modify your commit.
> + - You are now ready to generate a patch file suitable for sending via e-mail.
> +   Use::
> +
> +	git format-patch -1 -s
> +
> +   This command should create a patch file, which is close to what you need
> +   to send via e-mail.
> +   This command also adds a "Signed-off-by:" line; see
> +   :ref:`the_canonical_patch_format`, and :ref:`dev_cert_of_origin`.

Why wouldn't you put the signoff in the commit?

> + - Verify that your patch matches the required style::
> +
> +	./scripts/checkpatch.pl <patch file>
> +
> +   Also see :ref:`Documentation/process/coding-style.rst <codingstyle>`.
> +   If there are problems, modify your commit (``git commit --amend``)
> +   and subsequently your e-mail patch (``git format-patch``).
> + - Test if you are able to send the patch to yourself::
> +
> +	git send-email --to=<your email address> <patch file>
> +
> + - If sending the e-mail to yourself worked, inspect the e-mail you have
> +   received and check if it adheres to :ref:`the_canonical_patch_format`.

Haven't you already ensured that you've formatted it correctly?

> + - Find out to which people the e-mail should be send::
> +
> +	./scripts/get_maintainer.pl <patch file>
> +
> +   In general send the e-mail to the appropriate maintainer and put relevant
> +   mailing lists on CC.
> + - Finally send the patch e-mail with::
> +
> +	git send-email --to=<maintainer> --cc=<mail list 1> ... <patch file>
> +

Thanks,

jon
