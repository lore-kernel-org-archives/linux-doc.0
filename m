Return-Path: <SRS0=8YJ4=CM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515A3C433E2
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 16:05:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17C1A20716
	for <linux-doc@archiver.kernel.org>; Thu,  3 Sep 2020 16:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cmpwn.com header.i=@cmpwn.com header.b="JePE3pyN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgICQFy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Sep 2020 12:05:54 -0400
Received: from mail.cmpwn.com ([45.56.77.53]:39292 "EHLO mail.cmpwn.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728688AbgICQFu (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Sep 2020 12:05:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=cmpwn.com; s=cmpwn;
        t=1599149148; bh=+EbIdq8hJHXfvYX2sngd3h8J0Ap7ALEpyKJiLPT6/JI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=JePE3pyNdqRRdtI4EO69djTtr4oTxDHuDlIwSYJGL8lN++I2YHJ+pmFkuBsinNgZ8
         rRCO0Lc6v/1Fw/7Yr7zKIDyOo0zQ9ahFPcNe+t4TKNBTOyA92MZRvIts62V1dlyi7W
         8LJ/vSIEyOLI2P3HJFB9Ypw5AqZhRWeWqYRP5S7E=
From:   Drew DeVault <sir@cmpwn.com>
To:     "Jonathan Corbet" <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Drew DeVault <sir@cmpwn.com>
Subject: [PATCH v3 2/4] Documentation/process: expand plain-text advice
Date:   Thu,  3 Sep 2020 12:05:43 -0400
Message-Id: <20200903160545.83185-3-sir@cmpwn.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903160545.83185-1-sir@cmpwn.com>
References: <20200903160545.83185-1-sir@cmpwn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds a link to https://useplaintext.email to email-clients.rst,
which is a more exhaustive resource on configuring various mail clients
for plain text use. submitting-patches.rst is also updated to direct
readers to email-clients.rst to equip new contributors with the
requisite knowledge to become a good participant on the mailing lists.

Signed-off-by: Drew DeVault <sir@cmpwn.com>
---
 Documentation/process/email-clients.rst      | 5 +++++
 Documentation/process/submitting-patches.rst | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/Documentation/process/email-clients.rst b/Documentation/process/email-clients.rst
index c9e4ce2613c0..16586f6cc888 100644
--- a/Documentation/process/email-clients.rst
+++ b/Documentation/process/email-clients.rst
@@ -25,6 +25,11 @@ attachments, but then the attachments should have content-type
 it makes quoting portions of the patch more difficult in the patch
 review process.
 
+It's also strongly recommended that you use plain text in your email body,
+for patches and other emails alike. https://useplaintext.email may be useful
+for information on how to configure your preferred email client, as well as
+listing recommended email clients should you not already have a preference.
+
 Email clients that are used for Linux kernel patches should send the
 patch text untouched.  For example, they should not modify or delete tabs
 or spaces, even at the beginning or end of lines.
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 648113e94281..f9baa46b9424 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -395,6 +395,9 @@ for their time.  Code review is a tiring and time-consuming process, and
 reviewers sometimes get grumpy.  Even in that case, though, respond
 politely and address the problems they have pointed out.
 
+See :ref:`Documentation/process/email-clients.rst` for recommendations on email
+clients and mailing list etiquette.
+
 
 Don't get discouraged - or impatient
 ------------------------------------
-- 
2.28.0

