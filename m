Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B99067E22E
	for <lwn-linux-doc@archive.lwn.net>; Sun,  1 Apr 2018 21:59:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753935AbeDAV73 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 1 Apr 2018 17:59:29 -0400
Received: from mout01.posteo.de ([185.67.36.65]:52454 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753915AbeDAV73 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Sun, 1 Apr 2018 17:59:29 -0400
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 68F5420F91
        for <linux-doc@vger.kernel.org>; Sun,  1 Apr 2018 23:59:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
        t=1522619967; bh=l1XTm1ve16uqlW8Rq/wtJU6pD3yhxDbx+rrU1DCe44E=;
        h=From:To:Cc:Subject:Date:From;
        b=RITBptKO3F4t0EzN6GxenILDpcPWpH7IBP3DCTtMPuekegQRsVHfvtsmx3Z96s4M5
         HHEY/T6kk9j6SIpNI8olm6b1Cq/Gk//cLeHOnAhnqOZYMbekaWUDUT5t/jn8HEpv1P
         2/6L1s53fR3FuasPCkxNXkpiQs6+DauoenOATHlcT1/8Gx23mbWMOYTVdbTqwpoIRt
         NVKwotoAtbnV6g0kVG8D59dDk1PAwqvgmwbirZygez4+BmKXX+D4tufxS5NxjBhcUV
         hAEp0LvI6oOIlwbnlkitMw/dgJ/uuE09LbaJYCgBFxm3x8He3OcUtaE76WbWAuezjm
         6ndWbyCmGlVqQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 40Dq5B2bHBz9rxG;
        Sun,  1 Apr 2018 23:59:26 +0200 (CEST)
From:   Martin Kepplinger <martink@posteo.de>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Martin Kepplinger <martink@posteo.de>
Subject: [PATCH] Documentation: devices.rst: minor plural grammar fix
Date:   Sun,  1 Apr 2018 23:59:14 +0200
Message-Id: <20180401215914.32101-1-martink@posteo.de>
X-Mailer: git-send-email 2.16.2
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It's authors who request something here, no authors who requests. Let's
fix this.

Signed-off-by: Martin Kepplinger <martink@posteo.de>
---
 Documentation/admin-guide/devices.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/devices.rst b/Documentation/admin-guide/devices.rst
index 7fadc05330dd..f781e80f342d 100644
--- a/Documentation/admin-guide/devices.rst
+++ b/Documentation/admin-guide/devices.rst
@@ -22,7 +22,7 @@ Allocations marked (68k/Amiga) apply to Linux/68k on the Amiga
 platform only.	Allocations marked (68k/Atari) apply to Linux/68k on
 the Atari platform only.
 
-This document is in the public domain.	The authors requests, however,
+This document is in the public domain.	The authors request, however,
 that semantically altered versions are not distributed without
 permission of the authors, assuming the authors can be contacted without
 an unreasonable effort.
-- 
2.16.2

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
