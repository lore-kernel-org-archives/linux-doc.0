Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 18B757D57F
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Sep 2018 10:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbeIGPKs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Sep 2018 11:10:48 -0400
Received: from sauhun.de ([88.99.104.3]:52742 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727651AbeIGPKr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Sep 2018 11:10:47 -0400
Received: from localhost (p54B3324C.dip0.t-ipconnect.de [84.179.50.76])
        by pokefinder.org (Postfix) with ESMTPSA id 01B902C28E9;
        Fri,  7 Sep 2018 12:30:27 +0200 (CEST)
From:   Wolfram Sang <wsa@the-dreams.de>
To:     linux-doc@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH 2/2] MAINTAINERS: add i2c to the excludes for Documentation
Date:   Fri,  7 Sep 2018 12:30:22 +0200
Message-Id: <20180907103022.2258-2-wsa@the-dreams.de>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180907103022.2258-1-wsa@the-dreams.de>
References: <20180907103022.2258-1-wsa@the-dreams.de>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I'll handle these myself but thanks for providing the fallback!

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2698ee553008..39c39dd6fba6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4487,6 +4487,7 @@ F:	scripts/kernel-doc
 X:	Documentation/ABI/
 X:	Documentation/acpi/
 X:	Documentation/devicetree/
+X:	Documentation/i2c/
 X:	Documentation/media/
 X:	Documentation/power/
 X:	Documentation/spi/
-- 
2.18.0

