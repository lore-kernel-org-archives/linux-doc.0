Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B581C433E6
	for <linux-doc@archiver.kernel.org>; Wed,  3 Feb 2021 23:54:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33E0164F64
	for <linux-doc@archiver.kernel.org>; Wed,  3 Feb 2021 23:54:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233793AbhBCXyH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Feb 2021 18:54:07 -0500
Received: from mail.v3.sk ([167.172.186.51]:51524 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233736AbhBCXyF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 3 Feb 2021 18:54:05 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id E3274E0B3C;
        Wed,  3 Feb 2021 23:49:10 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id WLfNKUZIRgnG; Wed,  3 Feb 2021 23:49:04 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id EED3FE07B5;
        Wed,  3 Feb 2021 23:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id mH9GjMUb8RYJ; Wed,  3 Feb 2021 23:49:03 +0000 (UTC)
Received: from localhost (unknown [109.183.109.54])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 8845CDF16D;
        Wed,  3 Feb 2021 23:49:03 +0000 (UTC)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Maen Suleiman <maen@marvell.com>, Lior Amsalem <alior@marvell.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Andrew Lunn <andrew@lunn.ch>, Nicolas Pitre <nico@fluxnic.net>,
        Eric Miao <eric.y.miao@gmail.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v2 4/5] docs: arm: marvell: clarify some unimportant Armada 6x0 details
Date:   Thu,  4 Feb 2021 00:53:04 +0100
Message-Id: <20210203235305.506528-5-lkundrak@v3.sk>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203235305.506528-1-lkundrak@v3.sk>
References: <20210203235305.506528-1-lkundrak@v3.sk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

MMP2 is used in XO-1.75 and MMP3 is now supported in mainline.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 Documentation/arm/marvel.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/arm/marvel.rst b/Documentation/arm/marvel.rst
index bcf3f4e3e8faf..d83917f226376 100644
--- a/Documentation/arm/marvel.rst
+++ b/Documentation/arm/marvel.rst
@@ -329,13 +329,12 @@ MMP/MMP2/MMP3 family (communication processor)
              - Product Brief        : https://archive.org/download/marve=
ll-pxa910-pb/Marvell_PXA910_Platform-001_PB.pdf
              - Application processor with Communication processor
              - Core: ARMv5 compatible Marvell PJ1 88sv331 (Mohawk)
-        - PXA688, a.k.a. MMP2, a.k.a Armada 610
+        - PXA688, a.k.a. MMP2, a.k.a Armada 610 (OLPC XO-1.75)
              - Product Brief        : https://web.archive.org/web/201111=
02023255/http://www.marvell.com/application-processors/armada-600/assets/=
armada610_pb.pdf
              - Application processor only
              - Core: ARMv7 compatible Sheeva PJ4 88sv581x core
-	- PXA2128, a.k.a. MMP3 (OLPC XO4, Linux support not upstream)
+	- PXA2128, a.k.a. MMP3, a.k.a Armada 620 (OLPC XO-4)
 	     - Product Brief	    : https://web.archive.org/web/20120824055155/h=
ttp://www.marvell.com/application-processors/armada/pxa2128/assets/Marvel=
l-ARMADA-PXA2128-SoC-PB.pdf
-
 	     - Application processor only
 	     - Core: Dual-core ARMv7 compatible Sheeva PJ4C core
 	- PXA960/PXA968/PXA978 (Linux support not upstream)
--=20
2.29.2

