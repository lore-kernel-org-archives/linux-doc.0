Return-Path: <SRS0=8YJ4=CM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E9BC43461
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 16:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6058A208FE
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 16:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="odQTDSLo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbgICQFy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Sep 2020 12:05:54 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:39288 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728642AbgICQFv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:05:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1599149148; bh=73iEA4BN1pJucn3XKwl/1Ksv2Qqdoo+w+A+hAs4FGbg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=odQTDSLou+ha+OIAu/6inmjmugirWuGPhVJBjWJX1JvdW+aRuQPIaX8+0r5jKKJlV
         s45wlWQx2/VG98a7LjFP4FJvxQgVyCgrXn9cXNWA6YE7cslqsfDDVcewn9z4nLtvPF
         u6jMQ6gk5+AO4ETFsbV0BrTrP+TfhqxbBQqp75Hw=
From:   Drew DeVault <sir@cmpwn.com>
To:     "Jonathan Corbet" <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Drew DeVault <sir@cmpwn.com>
Subject: [PATCH v3 1/4] submitting-patches.rst: remove heading numbering
Date:   Thu,  3 Sep 2020 12:05:42 -0400
Message-Id: <20200903160545.83185-2-sir@cmpwn.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903160545.83185-1-sir@cmpwn.com>
References: <20200903160545.83185-1-sir@cmpwn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This follows similar changes throughout Documentation; these numbers
tend to get outdated and are not especially useful.

Signed-off-by: Drew DeVault <sir@cmpwn.com>
---
 Documentation/process/submitting-patches.rst | 68 ++++++++++----------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 5219bf3cddfc..648113e94281 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -24,8 +24,8 @@ of the mechanical work done for you, though you'll still need to prepare
 and document a sensible set of patches.  In general, use of ``git`` will make
 your life as a kernel developer easier.
 
-0) Obtain a current source tree
--------------------------------
+Obtain a current source tree
+----------------------------
 
 If you do not have a repository with the current kernel source handy, use
 ``git`` to obtain one.  You'll want to start with the mainline repository,
@@ -99,8 +99,8 @@ is another popular alternative.
 
 .. _describe_changes:
 
-2) Describe your changes
-------------------------
+Describe your changes
+---------------------
 
 Describe your problem.  Whether your patch is a one-line bug fix or
 5000 lines of a new feature, there must be an underlying problem that
@@ -203,8 +203,8 @@ An example call::
 
 .. _split_changes:
 
-3) Separate your changes
-------------------------
+Separate your changes
+---------------------
 
 Separate each **logical change** into a separate patch.
 
@@ -236,8 +236,8 @@ then only post say 15 or so at a time and wait for review and integration.
 
 
 
-4) Style-check your changes
----------------------------
+Style-check your changes
+------------------------
 
 Check your patch for basic style violations, details of which can be
 found in
@@ -267,8 +267,8 @@ You should be able to justify all violations that remain in your
 patch.
 
 
-5) Select the recipients for your patch
----------------------------------------
+Select the recipients for your patch
+------------------------------------
 
 You should always copy the appropriate subsystem maintainer(s) on any patch
 to code that they maintain; look through the MAINTAINERS file and the
@@ -342,8 +342,8 @@ Trivial patches must qualify for one of the following rules:
 
 
 
-6) No MIME, no links, no compression, no attachments.  Just plain text
-----------------------------------------------------------------------
+No MIME, no links, no compression, no attachments.  Just plain text
+-------------------------------------------------------------------
 
 Linus and other kernel developers need to be able to read and comment
 on the changes you are submitting.  It is important for a kernel
@@ -370,8 +370,8 @@ See :ref:`Documentation/process/email-clients.rst <email_clients>`
 for hints about configuring your e-mail client so that it sends your patches
 untouched.
 
-7) E-mail size
---------------
+E-mail size
+-----------
 
 Large changes are not appropriate for mailing lists, and some
 maintainers.  If your patch, uncompressed, exceeds 300 kB in size,
@@ -380,8 +380,8 @@ server, and provide instead a URL (link) pointing to your patch.  But note
 that if your patch exceeds 300 kB, it almost certainly needs to be broken up
 anyway.
 
-8) Respond to review comments
------------------------------
+Respond to review comments
+--------------------------
 
 Your patch will almost certainly get comments from reviewers on ways in
 which the patch can be improved.  You must respond to those comments;
@@ -396,8 +396,8 @@ reviewers sometimes get grumpy.  Even in that case, though, respond
 politely and address the problems they have pointed out.
 
 
-9) Don't get discouraged - or impatient
----------------------------------------
+Don't get discouraged - or impatient
+------------------------------------
 
 After you have submitted your change, be patient and wait.  Reviewers are
 busy people and may not get to your patch right away.
@@ -410,8 +410,8 @@ one week before resubmitting or pinging reviewers - possibly longer during
 busy times like merge windows.
 
 
-10) Include PATCH in the subject
---------------------------------
+Include PATCH in the subject
+-----------------------------
 
 Due to high e-mail traffic to Linus, and to linux-kernel, it is common
 convention to prefix your subject line with [PATCH].  This lets Linus
@@ -420,8 +420,8 @@ e-mail discussions.
 
 
 
-11) Sign your work - the Developer's Certificate of Origin
-----------------------------------------------------------
+Sign your work - the Developer's Certificate of Origin
+------------------------------------------------------
 
 To improve tracking of who did what, especially with patches that can
 percolate to their final resting place in the kernel through several
@@ -517,8 +517,8 @@ tracking your trees, and to people trying to troubleshoot bugs in your
 tree.
 
 
-12) When to use Acked-by:, Cc:, and Co-developed-by:
--------------------------------------------------------
+When to use Acked-by:, Cc:, and Co-developed-by:
+------------------------------------------------
 
 The Signed-off-by: tag indicates that the signer was involved in the
 development of the patch, or that he/she was in the patch's delivery path.
@@ -586,8 +586,8 @@ Example of a patch submitted by a Co-developed-by: author::
 	Signed-off-by: Submitting Co-Author <sub@coauthor.example.org>
 
 
-13) Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:
---------------------------------------------------------------------------
+Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:
+----------------------------------------------------------------------
 
 The Reported-by tag gives credit to people who find bugs and report them and it
 hopefully inspires them to help us again in the future.  Please note that if
@@ -650,8 +650,8 @@ for more details.
 
 .. _the_canonical_patch_format:
 
-14) The canonical patch format
-------------------------------
+The canonical patch format
+--------------------------
 
 This section describes how the patch itself should be formatted.  Note
 that, if you have your patches stored in a ``git`` repository, proper patch
@@ -773,8 +773,8 @@ references.
 
 .. _explicit_in_reply_to:
 
-15) Explicit In-Reply-To headers
---------------------------------
+Explicit In-Reply-To headers
+----------------------------
 
 It can be helpful to manually add In-Reply-To: headers to a patch
 (e.g., when using ``git send-email``) to associate the patch with
@@ -787,8 +787,8 @@ helpful, you can use the https://lkml.kernel.org/ redirector (e.g., in
 the cover email text) to link to an earlier version of the patch series.
 
 
-16) Providing base tree information
------------------------------------
+Providing base tree information
+-------------------------------
 
 When other developers receive your patches and start the review process,
 it is often useful for them to know where in the tree history they
@@ -838,8 +838,8 @@ either below the ``---`` line or at the very bottom of all other
 content, right before your email signature.
 
 
-17) Sending ``git pull`` requests
----------------------------------
+Sending ``git pull`` requests
+-----------------------------
 
 If you have a series of patches, it may be most convenient to have the
 maintainer pull them directly into the subsystem repository with a
-- 
2.28.0

