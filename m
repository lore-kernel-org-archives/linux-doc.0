Return-Path: <SRS0=NxQi=CL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440E0C433E7
	for <linux-doc@archiver.kernel.org>; Wed,  2 Sep 2020 15:58:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21699208B3
	for <linux-doc@archiver.kernel.org>; Wed,  2 Sep 2020 15:58:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="hFyFUs+g"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgIBP6F (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Sep 2020 11:58:05 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:36968 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727895AbgIBP6D (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 2 Sep 2020 11:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1599062281; bh=P5SuJSn8oGcSTrizuMdx7LCk4OYQFWUZ1iIbTbqkkaY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=hFyFUs+gWYqFOVFTN85KE63kHBINxxw7ok96w4+Gbw3iiku4Q/8E1Yh1ruW2dYx95
         Yjc/uNCIH/L0BF65TKsmJYlw7fX6CEuYQx0hjK0qEJAgU9UjRi0EzkrODDjoPFMnoh
         22skD9ddmYJ5ie/ks2HyuXIjT3JFZbGb//s+w/Zw=
From:   Drew DeVault <sir@cmpwn.com>
To:     linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>
Cc:     Drew DeVault <sir@cmpwn.com>
Subject: [PATCH 1/4] submitting-patches.rst: remove heading numbering
Date:   Wed,  2 Sep 2020 11:57:56 -0400
Message-Id: <20200902155759.55895-2-sir@cmpwn.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902155759.55895-1-sir@cmpwn.com>
References: <20200902155759.55895-1-sir@cmpwn.com>
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
 Documentation/process/submitting-patches.rst | 30 ++++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 5219bf3cddfc..f205753ae3d8 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -24,7 +24,7 @@ of the mechanical work done for you, though you'll still need to prepare
 and document a sensible set of patches.  In general, use of ``git`` will make
 your life as a kernel developer easier.
 
-0) Obtain a current source tree
+Obtain a current source tree
 -------------------------------
 
 If you do not have a repository with the current kernel source handy, use
@@ -99,7 +99,7 @@ is another popular alternative.
 
 .. _describe_changes:
 
-2) Describe your changes
+Describe your changes
 ------------------------
 
 Describe your problem.  Whether your patch is a one-line bug fix or
@@ -203,7 +203,7 @@ An example call::
 
 .. _split_changes:
 
-3) Separate your changes
+Separate your changes
 ------------------------
 
 Separate each **logical change** into a separate patch.
@@ -236,7 +236,7 @@ then only post say 15 or so at a time and wait for review and integration.
 
 
 
-4) Style-check your changes
+Style-check your changes
 ---------------------------
 
 Check your patch for basic style violations, details of which can be
@@ -267,7 +267,7 @@ You should be able to justify all violations that remain in your
 patch.
 
 
-5) Select the recipients for your patch
+Select the recipients for your patch
 ---------------------------------------
 
 You should always copy the appropriate subsystem maintainer(s) on any patch
@@ -342,7 +342,7 @@ Trivial patches must qualify for one of the following rules:
 
 
 
-6) No MIME, no links, no compression, no attachments.  Just plain text
+No MIME, no links, no compression, no attachments.  Just plain text
 ----------------------------------------------------------------------
 
 Linus and other kernel developers need to be able to read and comment
@@ -370,7 +370,7 @@ See :ref:`Documentation/process/email-clients.rst <email_clients>`
 for hints about configuring your e-mail client so that it sends your patches
 untouched.
 
-7) E-mail size
+E-mail size
 --------------
 
 Large changes are not appropriate for mailing lists, and some
@@ -396,7 +396,7 @@ reviewers sometimes get grumpy.  Even in that case, though, respond
 politely and address the problems they have pointed out.
 
 
-9) Don't get discouraged - or impatient
+Don't get discouraged - or impatient
 ---------------------------------------
 
 After you have submitted your change, be patient and wait.  Reviewers are
@@ -410,7 +410,7 @@ one week before resubmitting or pinging reviewers - possibly longer during
 busy times like merge windows.
 
 
-10) Include PATCH in the subject
+Include PATCH in the subject
 --------------------------------
 
 Due to high e-mail traffic to Linus, and to linux-kernel, it is common
@@ -420,7 +420,7 @@ e-mail discussions.
 
 
 
-11) Sign your work - the Developer's Certificate of Origin
+Sign your work - the Developer's Certificate of Origin
 ----------------------------------------------------------
 
 To improve tracking of who did what, especially with patches that can
@@ -586,7 +586,7 @@ Example of a patch submitted by a Co-developed-by: author::
 	Signed-off-by: Submitting Co-Author <sub@coauthor.example.org>
 
 
-13) Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:
+Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:
 --------------------------------------------------------------------------
 
 The Reported-by tag gives credit to people who find bugs and report them and it
@@ -650,7 +650,7 @@ for more details.
 
 .. _the_canonical_patch_format:
 
-14) The canonical patch format
+The canonical patch format
 ------------------------------
 
 This section describes how the patch itself should be formatted.  Note
@@ -773,7 +773,7 @@ references.
 
 .. _explicit_in_reply_to:
 
-15) Explicit In-Reply-To headers
+Explicit In-Reply-To headers
 --------------------------------
 
 It can be helpful to manually add In-Reply-To: headers to a patch
@@ -787,7 +787,7 @@ helpful, you can use the https://lkml.kernel.org/ redirector (e.g., in
 the cover email text) to link to an earlier version of the patch series.
 
 
-16) Providing base tree information
+Providing base tree information
 -----------------------------------
 
 When other developers receive your patches and start the review process,
@@ -838,7 +838,7 @@ either below the ``---`` line or at the very bottom of all other
 content, right before your email signature.
 
 
-17) Sending ``git pull`` requests
+Sending ``git pull`` requests
 ---------------------------------
 
 If you have a series of patches, it may be most convenient to have the
-- 
2.28.0

