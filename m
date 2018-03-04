Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0221C7E244
	for <lwn-linux-doc@archive.lwn.net>; Sun,  4 Mar 2018 20:23:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932228AbeCDUXj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 4 Mar 2018 15:23:39 -0500
Received: from emh06.mail.saunalahti.fi ([62.142.5.116]:52164 "EHLO
        emh06.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932147AbeCDUXj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Mar 2018 15:23:39 -0500
X-Greylist: delayed 314 seconds by postgrey-1.27 at vger.kernel.org; Sun, 04 Mar 2018 15:23:39 EST
Received: from localhost.localdomain (85-76-69-67-nat.elisa-mobile.fi [85.76.69.67])
        by emh06.mail.saunalahti.fi (Postfix) with ESMTP id 68AC43017E;
        Sun,  4 Mar 2018 22:18:24 +0200 (EET)
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: [PATCH] documentation: add my name to kernel driver statement
Date:   Sun,  4 Mar 2018 22:18:14 +0200
Message-Id: <20180304201814.19641-1-aaro.koskinen@iki.fi>
X-Mailer: git-send-email 2.9.2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add my name to kernel driver statement.

Signed-off-by: Aaro Koskinen <aaro.koskinen@iki.fi>
---
 Documentation/process/kernel-driver-statement.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/process/kernel-driver-statement.rst b/Documentation/process/kernel-driver-statement.rst
index 60d9d86..e78452c2 100644
--- a/Documentation/process/kernel-driver-statement.rst
+++ b/Documentation/process/kernel-driver-statement.rst
@@ -103,6 +103,7 @@ today, have in the past, or will in the future.
  - Auke Kok
  - Peter Korsgaard
  - Jiri Kosina
+ - Aaro Koskinen
  - Mariusz Kozlowski
  - Greg Kroah-Hartman
  - Michael Krufky
-- 
2.9.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
