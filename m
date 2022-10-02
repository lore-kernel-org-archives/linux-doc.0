Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D502CC433FE
	for <linux-doc@archiver.kernel.org>; Sun,  2 Oct 2022 12:58:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229814AbiJBM6z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 2 Oct 2022 08:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbiJBM6x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 2 Oct 2022 08:58:53 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FF953A171
        for <linux-doc@vger.kernel.org>; Sun,  2 Oct 2022 05:58:52 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <afa@pengutronix.de>)
        id 1oeyYA-0007qG-4G; Sun, 02 Oct 2022 14:58:30 +0200
Received: from [2a0a:edc0:0:1101:1d::ac] (helo=dude04.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <afa@pengutronix.de>)
        id 1oeyY9-004BTN-WC; Sun, 02 Oct 2022 14:58:28 +0200
Received: from afa by dude04.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <afa@pengutronix.de>)
        id 1oeyY7-00EGj3-O0; Sun, 02 Oct 2022 14:58:27 +0200
From:   Ahmad Fatoum <a.fatoum@pengutronix.de>
To:     hpa@zytor.com, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Cc:     barebox@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v2] Documentation: x86: boot: reserve type_of_loader=13 for barebox
Date:   Sun,  2 Oct 2022 14:57:53 +0200
Message-Id: <20221002125752.3400831-1-a.fatoum@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: afa@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-doc@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

barebox[1], a bootloader for mostly ARM and MIPS embedded systems,
can also be built as EFI payload for x86[2] to provide redundant
power-fail safe, watchdog-supervised boot up.

Since its v2015.09.0 release, it has been booting Linux on x86 with
type_of_loader=0xff[3]. Reserve 13, the next free id, so that can be
used instead in the future.

[1]: https://www.barebox.org/
[2]: https://www.barebox.org/doc/latest/boards/efi.html
[3]: https://elixir.bootlin.com/barebox/v2022.09.0/source/common/efi/payload/image.c#L217

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
v1 -> v2:
  - elaborate on what barebox is and add some links to commit
    message (Boris)

v1 was here:
https://lore.kernel.org/all/20220513143039.2065756-1-a.fatoum@pengutronix.de/
---
 Documentation/x86/boot.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/x86/boot.rst b/Documentation/x86/boot.rst
index 894a19897005..240d084782a6 100644
--- a/Documentation/x86/boot.rst
+++ b/Documentation/x86/boot.rst
@@ -455,6 +455,7 @@ Protocol:	2.00+
 	11 Minimal Linux Bootloader
 	   <http://sebastian-plotz.blogspot.de>
 	12 OVMF UEFI virtualization stack
+	13 barebox
 	== =======================================
 
   Please contact <hpa@zytor.com> if you need a bootloader ID value assigned.
-- 
2.30.2

