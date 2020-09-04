Return-Path: <SRS0=2c8a=CN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0F9C43461
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 16:29:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D54742074D
	for <linux-doc@archiver.kernel.org>; Fri,  4 Sep 2020 16:29:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgIDQ3d (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Sep 2020 12:29:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbgIDQ3c (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Sep 2020 12:29:32 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE95DC061245
        for <linux-doc@vger.kernel.org>; Fri,  4 Sep 2020 09:29:32 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DD11E44A;
        Fri,  4 Sep 2020 16:29:26 +0000 (UTC)
Date:   Fri, 4 Sep 2020 10:29:25 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@infradead.org>,
        Markus Heiser <markus.heiser@darmarit.de>
Subject: [PATCH RFC] Make the docs build "work" with Sphinx 3.x
Message-ID: <20200904102925.52fcd2a1@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The Sphinx 3.x upgrade broke a number of things in our special "cdomain"
module that are not easy to fix.  For now, just disable that module for the
3.x build and put out a warning that the build will not be perfect.  The
problems affect primarily the media documentation where :name: is used.

This is not a great solution, but it at least allows the docs build to
proceed on systems running 3.x until somebody has the time to put together
a proper fix.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
It seems that much of what we have in cdomain.cpy isn't needed with 3.x,
though that has to be verified.  But the :name: extension is problematic.
That needs a hard look, it's guaranteed to be a hard thing to maintain
going forward and it would be nice if we could find a way to do without it.

Meanwhile, building the docs with Sphinx 3.2.1 takes nearly twice as long
as with 2.2.2.  Given that the process was not exactly fast before, this
is not a welcome change.  Sigh.

 Documentation/conf.py | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index c503188880d9..0a102d57437d 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -36,10 +36,23 @@ needs_sphinx = '1.3'
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include', 'cdomain',
+extensions = ['kerneldoc', 'rstFlatTable', 'kernel_include',
               'kfigure', 'sphinx.ext.ifconfig', 'automarkup',
               'maintainers_include', 'sphinx.ext.autosectionlabel' ]
 
+#
+# cdomain is badly broken in Sphinx 3+.  Leaving it out generates *most*
+# of the docs correctly, but not all.  Scream bloody murder but allow
+# the process to proceed; hopefully somebody will fix this properly soon.
+#
+if major >= 3:
+    sys.stderr.write('''WARNING: The kernel documentation build process
+	does not work correctly with Sphinx v3.0 and above.  Expect errors
+	in the generated output.
+	''')
+else:
+    extensions.append('cdomain')
+
 # Ensure that autosectionlabel will produce unique names
 autosectionlabel_prefix_document = True
 autosectionlabel_maxdepth = 2
-- 
2.26.2

