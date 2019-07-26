Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1A5877D2F0
	for <lwn-linux-doc@archive.lwn.net>; Fri, 26 Jul 2019 09:55:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbfGZJzg (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 26 Jul 2019 05:55:36 -0400
Received: from honk.sigxcpu.org ([24.134.29.49]:60256 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725815AbfGZJzg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 26 Jul 2019 05:55:36 -0400
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 30FD3FB03;
        Fri, 26 Jul 2019 11:55:35 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id KjqHBg3sjT4T; Fri, 26 Jul 2019 11:55:34 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 2240D46AA1; Fri, 26 Jul 2019 11:55:34 +0200 (CEST)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: phy: Drop duplicate 'be made'
Date:   Fri, 26 Jul 2019 11:55:34 +0200
Message-Id: <37eecffe6ecd9d64bfdb57a32f34b2c0805dd754.1564134855.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix duplicate words.

Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
Noticed on next-20190725.

 Documentation/driver-api/phy/phy.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index 457c3e0f86d6..8fc1ce0bb905 100644
--- a/Documentation/driver-api/phy/phy.rst
+++ b/Documentation/driver-api/phy/phy.rst
@@ -179,8 +179,8 @@ PHY Mappings
 
 In order to get reference to a PHY without help from DeviceTree, the framework
 offers lookups which can be compared to clkdev that allow clk structures to be
-bound to devices. A lookup can be made be made during runtime when a handle to
-the struct phy already exists.
+bound to devices. A lookup can be made during runtime when a handle to the
+struct phy already exists.
 
 The framework offers the following API for registering and unregistering the
 lookups::
-- 
2.20.1

