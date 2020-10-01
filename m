Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09912C4727C
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 10:47:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6F12207DE
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 10:47:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731888AbgJAKrn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 06:47:43 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:59937 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731131AbgJAKrn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Oct 2020 06:47:43 -0400
Received: (qmail 26687 invoked by uid 484); 1 Oct 2020 10:47:41 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.10.44 by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.381376 secs); 01 Oct 2020 10:47:41 -0000
Received: from unknown (HELO ingpc2.intern.lauterbach.com) (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <corbet@lwn.net>; 1 Oct 2020 10:47:40 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH 1/1] docs: process: Submitting a patch for a single git commit.
Date:   Thu,  1 Oct 2020 12:47:24 +0200
Message-Id: <20201001104724.3876-2-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201001104724.3876-1-ingo.rohloff@lauterbach.com>
References: <20201001104724.3876-1-ingo.rohloff@lauterbach.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A short primer how to submit a single git commit as a patch via
e-mail using git send-email.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
 Documentation/process/submitting-patches.rst | 72 ++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 5219bf3cddfc..a73b94f677c8 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -24,6 +24,8 @@ of the mechanical work done for you, though you'll still need to prepare
 and document a sensible set of patches.  In general, use of ``git`` will make
 your life as a kernel developer easier.
 
+.. _get_source_tree:
+
 0) Obtain a current source tree
 -------------------------------
 
@@ -419,6 +421,7 @@ and other kernel developers more easily distinguish patches from other
 e-mail discussions.
 
 
+.. _dev_cert_of_origin:
 
 11) Sign your work - the Developer's Certificate of Origin
 ----------------------------------------------------------
@@ -892,6 +895,75 @@ command like this will do the trick::
 
   git request-pull master git://my.public.tree/linux.git my-signed-tag
 
+17) A simple use case: Submitting a single git commit with ``git send-email``
+-----------------------------------------------------------------------------
+
+The scenario:
+You have a small code modification which sensibly fits into
+a single commit. You want to get this modification into the kernel.
+
+Assumptions:
+ - You are running a not too old Linux installation.
+ - You have ``git`` installed.
+ - You have the tools for ``git send-email`` installed.
+   It seems many Linux distributions deliver this set of tools in a
+   separate package. So make sure you have the appropriate package installed.
+   ``git send-email`` is able to directly talk to an SMTP server; so you
+   do not need a local mail transport agent or similar.
+ - You have configured ``git send-email``.
+   You might set the properties describing how you would like to send e-mail
+   via SMTP with the appropriate ``git config`` commands.
+   In particular you might need to set the properties:
+   ``sendemail.smtpserver``, ``sendemail.smtpserverport``,
+   ``sendemail.smtpuser``, ``sendemail.smtpencryption``, ``sendemail.smtppass``
+
+Process:
+ - Clone the kernel source tree; see :ref:`get_source_tree`
+ - Use ``git config`` to configure the user name and e-mail address for
+   yourself.
+ - Create and checkout a git branch to work on your code modification.
+   Use: ``git checkout -b <branch name>``
+ - Modify the code.
+ - Commit your code to your local git repository into your local branch with
+   a single commit.
+   Your commit message should start with a single line:
+   ``<subsystem>: <summary phrase>``.
+   The rest of the commit message should follow :ref:`describe_changes`
+ - Test your changes; they must compile and hopefully fix a problem.
+   If there are problems, modify your commit.
+   Use ``git commit --amend`` to modify your commit.
+ - You are now ready to generate a patch file suitable for sending via e-mail.
+   Use::
+
+	git format-patch -1 -s
+
+   This command should create a patch file, which is close to what you need
+   to send via e-mail.
+   This command also adds a "Signed-off-by:" line; see
+   :ref:`the_canonical_patch_format`, and :ref:`dev_cert_of_origin`.
+ - Verify that your patch matches the required style::
+
+	./scripts/checkpatch.pl <patch file>
+
+   Also see :ref:`Documentation/process/coding-style.rst <codingstyle>`.
+   If there are problems, modify your commit (``git commit --amend``)
+   and subsequently your e-mail patch (``git format-patch``).
+ - Test if you are able to send the patch to yourself::
+
+	git send-email --to=<your email address> <patch file>
+
+ - If sending the e-mail to yourself worked, inspect the e-mail you have
+   received and check if it adheres to :ref:`the_canonical_patch_format`.
+ - Find out to which people the e-mail should be send::
+
+	./scripts/get_maintainer.pl <patch file>
+
+   In general send the e-mail to the appropriate maintainer and put relevant
+   mailing lists on CC.
+ - Finally send the patch e-mail with::
+
+	git send-email --to=<maintainer> --cc=<mail list 1> ... <patch file>
+
 
 References
 ----------
-- 
2.17.1

