Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 06F7F7D08A
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Nov 2018 13:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbeKGXQq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Nov 2018 18:16:46 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:39136 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727151AbeKGXQq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Nov 2018 18:16:46 -0500
Received: from ramsan.of.borg ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id x1mJ1y00K3XaVaC011mJaz; Wed, 07 Nov 2018 14:46:18 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.86_2)
        (envelope-from <geert@linux-m68k.org>)
        id 1gKO9y-0005D3-96; Wed, 07 Nov 2018 14:46:18 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gKO9y-0003g1-7Z; Wed, 07 Nov 2018 14:46:18 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>
Cc:     linux-edac@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [trivial] Documentation/ras: Typo s/use use/use/
Date:   Wed,  7 Nov 2018 14:46:17 +0100
Message-Id: <20181107134617.14092-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/admin-guide/ras.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/ras.rst b/Documentation/admin-guide/ras.rst
index 197896718f813036..c7495e42e6f48bcb 100644
--- a/Documentation/admin-guide/ras.rst
+++ b/Documentation/admin-guide/ras.rst
@@ -54,7 +54,7 @@ those errors are correctable.
 Types of errors
 ---------------
 
-Most mechanisms used on modern systems use use technologies like Hamming
+Most mechanisms used on modern systems use technologies like Hamming
 Codes that allow error correction when the number of errors on a bit packet
 is below a threshold. If the number of errors is above, those mechanisms
 can indicate with a high degree of confidence that an error happened, but
-- 
2.17.1

