Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E9F8C7E22F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  2 Mar 2018 15:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1422734AbeCBP2i (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 2 Mar 2018 10:28:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:40727 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1422665AbeCBP2h (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 2 Mar 2018 10:28:37 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id A0393ACE5;
        Fri,  2 Mar 2018 15:28:35 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jani Nikula <jani.nikula@intel.com>, Jiri Slaby <jslaby@suse.cz>,
        Matthew Wilcox <willy@infradead.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] Documentation/sphinx: Fix Directive import error
Date:   Fri,  2 Mar 2018 16:28:31 +0100
Message-Id: <20180302152831.11510-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The sphinx.util.compat for Directive stuff was deprecated in the
recent Sphinx version, and now we get a build error.

Let's import from the new place, docutils.parsers.rst, while keeping
the old sphinx.util.compat as fallback.

Bugzilla: https://bugzilla.opensuse.org/show_bug.cgi?id=1083694
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
v1->v2: Change the fallback order as Matthew suggested, the new one at first

 Documentation/sphinx/kerneldoc.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index 39aa9e8697cc..34396976eb0a 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -37,7 +37,10 @@ import glob
 from docutils import nodes, statemachine
 from docutils.statemachine import ViewList
 from docutils.parsers.rst import directives
-from sphinx.util.compat import Directive
+try:
+    from docutils.parsers.rst import directives, Directive
+except ImportError:
+    from sphinx.util.compat import Directive
 from sphinx.ext.autodoc import AutodocReporter
 
 __version__  = '1.0'
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
