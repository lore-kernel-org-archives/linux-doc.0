Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72593C64E90
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 22:45:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14AC42073C
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 22:45:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388630AbgK3Wpl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 17:45:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388616AbgK3Wpl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 17:45:41 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 894EAC0613D2
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 14:45:01 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5C090844
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 22:45:01 +0000 (UTC)
Date:   Mon, 30 Nov 2020 15:45:00 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Subject: [PATCH RFC] docs: Note that sphinx 1.7 will be required soon
Message-ID: <20201130154500.0c8caccc@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The time has come to drop support for some truly ancient versions of
sphinx; put in a warning now.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
This is pretty conservative; I think we could make an honest case for
pushing things forward to 2.4 but ... one step at a time...  

I'd also like to think about dropping Python 2, but that's a separate
subject.

 Documentation/conf.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/conf.py b/Documentation/conf.py
index ed2b43ec7754..d76270cfa37f 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -112,6 +112,9 @@ if major >= 3:
 
 else:
     extensions.append('cdomain')
+    if major == 1 and minor < 7:
+        sys.stderr.write('WARNING: Sphinx 1.7 or greater will be required as of '
+                         'the 5.12 release\n')
 
 # Ensure that autosectionlabel will produce unique names
 autosectionlabel_prefix_document = True
-- 
2.28.0

