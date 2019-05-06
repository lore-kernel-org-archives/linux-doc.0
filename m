Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EF1357D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon,  6 May 2019 09:00:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfEFJAv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 6 May 2019 05:00:51 -0400
Received: from laurent.telenet-ops.be ([195.130.137.89]:44644 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbfEFJAv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 May 2019 05:00:51 -0400
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id 8x0o2000F3XaVaC01x0oH8; Mon, 06 May 2019 11:00:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hNZUO-0002B2-76; Mon, 06 May 2019 11:00:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hNZUO-0000nQ-3r; Mon, 06 May 2019 11:00:48 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Jonathan Corbet <corbet@lwn.net>, Guo Ren <ren_guo@c-sky.com>,
        Andrea Parri <andrea.parri@amarulasolutions.com>,
        linux-doc@vger.kernel.org, linux-m68k@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2] Documentation/features/time: Mark m68k having modern-timekeeping
Date:   Mon,  6 May 2019 11:00:46 +0200
Message-Id: <20190506090046.3016-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

M68k no longer uses arch_gettimeoffset.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v2:
  - Enhance one-line summary.

Queueing in m68k-for-v5.2, on top of the clocksource conversion.
Sorry for missing this before.

 Documentation/features/time/modern-timekeeping/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/time/modern-timekeeping/arch-support.txt b/Documentation/features/time/modern-timekeeping/arch-support.txt
index 2855dfe2464d4a34..1d46da165b75e127 100644
--- a/Documentation/features/time/modern-timekeeping/arch-support.txt
+++ b/Documentation/features/time/modern-timekeeping/arch-support.txt
@@ -15,7 +15,7 @@
     |       h8300: |  ok  |
     |     hexagon: |  ok  |
     |        ia64: |  ok  |
-    |        m68k: | TODO |
+    |        m68k: |  ok  |
     |  microblaze: |  ok  |
     |        mips: |  ok  |
     |       nds32: |  ok  |
-- 
2.17.1

