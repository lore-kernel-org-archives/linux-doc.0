Return-Path: <SRS0=ymn6=A2=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5668C433E2
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jul 2020 17:30:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0ECC2065E
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jul 2020 17:30:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbgGORaX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jul 2020 13:30:23 -0400
Received: from ipmail04.adl3.internode.on.net ([150.101.137.10]:51320 "EHLO
        ipmail04.adl3.internode.on.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725861AbgGORaX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Jul 2020 13:30:23 -0400
X-Greylist: delayed 302 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Jul 2020 13:30:21 EDT
X-SMTP-MATCH: 0
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2BLBACVOw9f/5UxyQ5gHgE8DAILHIF?=
 =?us-ascii?q?Dg21fjTSGAJ4ZCwE8AQIEAQGERgQCggwlNwYOAhABAQYBAQEBAQYEhlSGKAE?=
 =?us-ascii?q?jI08BgQGDJoJ8qT+CKIVRg1SBQIE4iAOFCYIAhF+FCoUpBJsemhGCZ4ELmEE?=
 =?us-ascii?q?wgQueLgGzAYF7MxoIKAg7gmlQGQ2cdTQwNwIGCAEBAwlXAY9RAQE?=
Received: from 14-201-49-149.tpgi.com.au (HELO silver.lan) ([14.201.49.149])
  by ipmail04.adl3.internode.on.net with ESMTP; 16 Jul 2020 02:55:17 +0930
From:   Paul Schulz <paul@mawsonlakes.org>
To:     linux-doc@vger.kernel.org
Cc:     Paul Schulz <paul@mawsonlakes.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] coding-style: Adds examples for alternatives to 'blacklist'
Date:   Thu, 16 Jul 2020 02:55:10 +0930
Message-Id: <20200715172510.126542-1-paul@mawsonlakes.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Replacing the term 'blacklist' with a term that better describes
a lists functionality or it's use makes its usage more understandable,
rather than a generic 'denylist' or 'blocklist'

eg. 'quirklist' for hardware cards what behave differently
    'invalidlist' for a list of invalid hardware strings

Signed-off-by: Paul Schulz <paul@mawsonlakes.org>
---
 Documentation/process/coding-style.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 1bee6f8affdb..3e5ca93a4443 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -334,6 +334,10 @@ Recommended replacements for 'blacklist/whitelist' are:
     'denylist / allowlist'
     'blocklist / passlist'
 
+Specific reasons for a lists functionality should also be considered. eg
+    'quirklist'
+    'invalidlist'
+
 Exceptions for introducing new usage is to maintain a userspace ABI/API,
 or when updating code for an existing (as of 2020) hardware or protocol
 specification that mandates those terms. For new specifications
-- 
2.25.1

