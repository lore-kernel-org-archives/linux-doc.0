Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4AB0F7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon, 17 Jun 2019 14:34:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725983AbfFQOeE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 17 Jun 2019 10:34:04 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:60566 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728281AbfFQOeD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 Jun 2019 10:34:03 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id Rqa12000h3XaVaC01qa1h9; Mon, 17 Jun 2019 16:34:02 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcsht-0002I4-Sm; Mon, 17 Jun 2019 16:34:01 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcsht-0001CJ-RN; Mon, 17 Jun 2019 16:34:01 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] doc-rst: Add missing newline at end of file
Date:   Mon, 17 Jun 2019 16:34:00 +0200
Message-Id: <20190617143400.4559-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

"git diff" says:

    \ No newline at end of file

after modifying the file.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/docutils.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/docutils.conf b/Documentation/docutils.conf
index 2830772264c877ca..f1a180b97dec5cb3 100644
--- a/Documentation/docutils.conf
+++ b/Documentation/docutils.conf
@@ -4,4 +4,4 @@
 # http://docutils.sourceforge.net/docs/user/config.html
 
 [general]
-halt_level: severe
\ No newline at end of file
+halt_level: severe
-- 
2.17.1

