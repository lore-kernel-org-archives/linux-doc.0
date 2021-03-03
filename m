Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD00BC433E9
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 00:30:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A342E64EEE
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 00:30:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351711AbhCDAaR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Mar 2021 19:30:17 -0500
Received: from comms.puri.sm ([159.203.221.185]:56318 "EHLO comms.puri.sm"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234981AbhCCLpY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 3 Mar 2021 06:45:24 -0500
Received: from localhost (localhost [127.0.0.1])
        by comms.puri.sm (Postfix) with ESMTP id 06028E0415;
        Wed,  3 Mar 2021 01:17:02 -0800 (PST)
Received: from comms.puri.sm ([127.0.0.1])
        by localhost (comms.puri.sm [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JZHkuqRt8frZ; Wed,  3 Mar 2021 01:17:01 -0800 (PST)
From:   Martin Kepplinger <martin.kepplinger@puri.sm>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH] Documentation: dynamic-debug-howto: fix example
Date:   Wed,  3 Mar 2021 10:16:46 +0100
Message-Id: <20210303091646.773111-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

dynamic debug is "expecting pairs of match-spec <value>" so the example
for all files of which the paths include "usb" there is "file" missing.

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 Documentation/admin-guide/dynamic-debug-howto.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 6c04aea8f4cd..b119b8277b3e 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -347,7 +347,7 @@ Examples
 				<debugfs>/dynamic_debug/control
 
   // enable messages in files of which the paths include string "usb"
-  nullarbor:~ # echo -n '*usb* +p' > <debugfs>/dynamic_debug/control
+  nullarbor:~ # echo -n 'file *usb* +p' > <debugfs>/dynamic_debug/control
 
   // enable all messages
   nullarbor:~ # echo -n '+p' > <debugfs>/dynamic_debug/control
-- 
2.30.1

