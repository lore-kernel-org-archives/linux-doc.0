Return-Path: <SRS0=DKq9=3L=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4912C32771
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 23:22:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9CA8B24655
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jan 2020 23:22:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726164AbgAVXW0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jan 2020 18:22:26 -0500
Received: from ms.lwn.net ([45.79.88.28]:53444 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726049AbgAVXW0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 22 Jan 2020 18:22:26 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C5D136D9
        for <linux-doc@vger.kernel.org>; Wed, 22 Jan 2020 23:22:25 +0000 (UTC)
Date:   Wed, 22 Jan 2020 16:22:24 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Subject: [PATCH] docs: Keep up with the location of NoUri
Message-ID: <20200122162224.03a1c3d8@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx 2.1 moved sphinx.environment.NoUri into sphinx.errors; that produced
this warning in the docs build:

  /usr/lib/python3.7/site-packages/sphinx/registry.py:473:
    RemovedInSphinx30Warning: sphinx.environment.NoUri is deprecated.

Grab NoUri from the right place and make the warning go away.  That symbol
was only added to sphinx.errors in 2.1, so we must still import it from the
old location when running in older versions.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/sphinx/automarkup.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index 5b6119ff69f4..b18236370742 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -5,8 +5,13 @@
 # has been done.
 #
 from docutils import nodes
+import sphinx
 from sphinx import addnodes
-from sphinx.environment import NoUri
+if sphinx.version_info[0] < 2 or \
+   sphinx.version_info[0] == 2 and sphinx.version_info[1] < 1:
+    from sphinx.environment import NoUri
+else:
+    from sphinx.errors import NoUri
 import re
 
 #
-- 
2.24.1

