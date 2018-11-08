Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E057E7D08A
	for <lwn-linux-doc@archive.lwn.net>; Thu,  8 Nov 2018 17:15:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727377AbeKICwD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 8 Nov 2018 21:52:03 -0500
Received: from smtprelay.synopsys.com ([198.182.47.9]:39164 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727253AbeKICwD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Nov 2018 21:52:03 -0500
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
        by smtprelay.synopsys.com (Postfix) with ESMTP id 184A124E0B36;
        Thu,  8 Nov 2018 09:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1541697336; bh=YMV2EFBoLYhOoKnOkwbzZ1n4tuSmXuF/10Wz9MAagG0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aCYQCjm/6bYsV6EwP5uqYY0zdkGzSUS0js26+8TIRyybfjWUTy/q3JG+sjGfcESbL
         Ugdu9mAbxRs8jEcomku9fx55ulBsQOUKXi5slZ18J11dX1liRQ4jtCgdJDyph3195e
         U2b47FjCVecUgkZN8HPz+MCwxqJjAb3V5pZZHNe91+x9EI0YAckkfEX2X+CKYdKqVp
         skCdogRCais9jS88wAqOhZPPqt+2dhaWe72R7LcMvfA93L/UVqj/6GcgSkSAVpE4Sb
         6dZRiuNc6y3pEH4pvORebhKsIGPQ97O/Qtd+dp2EHLSFTVsv21Ek0rjtck4MT7A96m
         yQvIV68RWwNVw==
Received: from vitor-VirtualBox.internal.synopsys.com (soares-e7470.internal.synopsys.com [10.107.19.145])
        by mailhost.synopsys.com (Postfix) with ESMTP id CCD9657F7;
        Thu,  8 Nov 2018 09:15:28 -0800 (PST)
From:   Vitor soares <vitor.soares@synopsys.com>
To:     boris.brezillon@bootlin.com, wsa@the-dreams.de,
        linux-i2c@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, gregkh@linuxfoundation.org,
        arnd@arndb.de
Cc:     psroka@cadence.com, agolec@cadence.com, adouglas@cadence.com,
        bfolta@cadence.com, dkos@cadence.com, alicja@cadence.com,
        cwronka@cadence.com, sureshp@cadence.com, rafalc@cadence.com,
        thomas.petazzoni@bootlin.com, nm@ti.com, robh+dt@kernel.org,
        pawel.moll@arm.com, mark.rutland@arm.com,
        ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vitor.soares@synopsys.com, geert@linux-m68k.org,
        linus.walleij@linaro.org, Xiang.Lin@synaptics.com,
        linux-gpio@vger.kernel.org, nsekhar@ti.com, pgaj@cadence.com,
        peda@axentia.se, mshettel@codeaurora.org, swboyd@chromium.org,
        joao.pinto@synopsys.com
Subject: [PATCH v3 3/3] MAINTAINERS: Add myself as the dw-i3c-master module maintainer
Date:   Thu,  8 Nov 2018 17:14:11 +0000
Message-Id: <1541697251-20392-4-git-send-email-soares@synopsys.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541697251-20392-1-git-send-email-soares@synopsys.com>
References: <1541697251-20392-1-git-send-email-soares@synopsys.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Vitor soares <soares@synopsys.com>
---
Change in v3:
- Remove dummy characters

Change in v2:
- None

 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 293c863..39910b3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6930,6 +6930,12 @@ F:	drivers/i3c/
 F:	include/linux/i3c/
 F:	include/dt-bindings/i3c/
 
+I3C DRIVER FOR SYNOPSYS DESIGNWARE
+M:	Vitor Soares <soares@synopsys.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
+F:	drivers/i3c/master/dw*
+
 IA64 (Itanium) PLATFORM
 M:	Tony Luck <tony.luck@intel.com>
 M:	Fenghua Yu <fenghua.yu@intel.com>
-- 
2.7.4


