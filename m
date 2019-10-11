Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9AC977D90D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Oct 2019 16:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726982AbfJKQkn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 Oct 2019 12:40:43 -0400
Received: from smtp1.lauterbach.com ([62.154.241.196]:59473 "EHLO
        smtp1.lauterbach.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726331AbfJKQkn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Oct 2019 12:40:43 -0400
X-Greylist: delayed 401 seconds by postgrey-1.27 at vger.kernel.org; Fri, 11 Oct 2019 12:40:42 EDT
Received: (qmail 14558 invoked by uid 484); 11 Oct 2019 16:34:00 -0000
X-Qmail-Scanner-Diagnostics: from 10.2.10.44 by smtp1.lauterbach.com (envelope-from <ingo.rohloff@lauterbach.com>, uid 484) with qmail-scanner-2.11 
 (mhr: 1.0. clamdscan: 0.99/21437. spamassassin: 3.4.0.  
 Clear:RC:1(10.2.10.44):. 
 Processed in 0.126236 secs); 11 Oct 2019 16:34:00 -0000
Received: from unknown (HELO ingpc2.intern.lauterbach.com) (Authenticated_SSL:irohloff@[10.2.10.44])
          (envelope-sender <ingo.rohloff@lauterbach.com>)
          by smtp1.lauterbach.com (qmail-ldap-1.03) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <corbet@lwn.net>; 11 Oct 2019 16:33:59 -0000
From:   Ingo Rohloff <ingo.rohloff@lauterbach.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org,
        Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [RFC][PATCH] docs: process: Submitting a patch for a single git commit.
Date:   Fri, 11 Oct 2019 18:33:58 +0200
Message-Id: <20191011163358.17667-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A short primer how to submit a single git commit as a patch via
e-mail using git send-email.

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---

Notes:
    I just went through this process and did a lot of mistakes,
    because I was confused how git commits translate to patches via e-mail.
    
    So I thought maybe writing down a very small primer how to submit
    a single git commit via e-mail employing "git send-email" might
    be a good idea.
    
    I probably still have no clue how to do that correctly; so the primer
    might have wrong information. Additionally I am not an English native
    speaker so the language might be less than optimal.
    
    What do you think ?

 Documentation/process/submitting-patches.rst | 63 ++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index fb56297f70dc..b00518584810 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -24,6 +24,8 @@ of the mechanical work done for you, though you'll still need to prepare
 and document a sensible set of patches.  In general, use of ``git`` will make
 your life as a kernel developer easier.
 
+.. _get_source_tree:
+
 0) Obtain a current source tree
 -------------------------------
 
@@ -836,6 +838,67 @@ command like this will do the trick::
 
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
+   ``sendemail.smtpserver``, ``sendemail.smtpserverport``, ``sendemail.smtpuser``,
+   ``sendemail.smtpencryption``, ``sendemail.smtppass``
+
+Process:
+ - Clone the kernel source tree; see :ref:`get_source_tree`
+ - Use ``git config`` to configure the user name and e-mail address for yourself.
+ - Create and checkout a git branch to work on your code modification. Use: ``git checkout -b <branch name>``
+ - Modify the code.
+ - Commit your code to your local git repository into your local branch with a single commit.
+   Your commit message should start with a single line: ``<subsystem>: <summary phrase>``.
+   The rest of the commit message should follow :ref:`describe_changes`
+ - Test your changes; they must compile and hopefully fix a problem.
+   If there are problems, modify your commit.
+   Use ``git commit --amend`` to modify your commit.
+ - You are now ready to generate a patch file suitable for sending via e-mail. Use::
+
+	git format-patch -1 -s
+
+   This command should create a patch file, which is close to what you need
+   to send via e-mail.
+   This command also adds a "Signed-off-by:" line; see :ref:`the_canonical_patch_format`
+ - Verify that your patch matches the required style::
+
+	./scripts/checkpatch.pl <patch file>
+
+   If there are problems, modify your commit and subsequently your e-mail patch.
+ - Test if you are able to send the patch to yourself::
+
+	git send-email --to=<your email address> <patch file>
+
+ - If sending the e-mail to yourself worked, inspect the e-mail you have received
+   and check if it adheres to :ref:`the_canonical_patch_format`.
+ - Find out to which people the e-mail should be send::
+
+	./scripts/get_maintainer.pl <patch file>
+
+   In general send the e-mail to the appropriate maintainer and put relevant
+   mailing lists on CC.
+ - Finally send the patch e-mail with::
+
+	git send-email --to=<maintainer> --cc=<mailing list 1> --cc=<mailing list 2> ...
+
 
 References
 ----------
-- 
2.17.1

