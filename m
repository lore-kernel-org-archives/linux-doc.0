Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9F78A7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 19 Jun 2019 05:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfFSFjr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 19 Jun 2019 01:39:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:47540 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725854AbfFSFjr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 19 Jun 2019 01:39:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 22F7AAD35;
        Wed, 19 Jun 2019 05:39:46 +0000 (UTC)
From:   Takashi Iwai <tiwai@suse.de>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs: fb: Add TER16x32 to the available font names
Date:   Wed, 19 Jun 2019 07:39:43 +0200
Message-Id: <20190619053943.6320-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The new font is available since recently.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/fb/fbcon.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/fb/fbcon.rst b/Documentation/fb/fbcon.rst
index cfb9f7c38f18..1da65b9000de 100644
--- a/Documentation/fb/fbcon.rst
+++ b/Documentation/fb/fbcon.rst
@@ -82,7 +82,7 @@ C. Boot options
 
 	Select the initial font to use. The value 'name' can be any of the
 	compiled-in fonts: 10x18, 6x10, 7x14, Acorn8x8, MINI4x6,
-	PEARL8x8, ProFont6x11, SUN12x22, SUN8x16, VGA8x16, VGA8x8.
+	PEARL8x8, ProFont6x11, SUN12x22, SUN8x16, TER16x32, VGA8x16, VGA8x8.
 
 	Note, not all drivers can handle font with widths not divisible by 8,
 	such as vga16fb.
-- 
2.16.4

