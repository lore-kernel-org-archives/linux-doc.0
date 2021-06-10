Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1722CC47094
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 06:20:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ECA55613C8
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 06:20:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbhFJGWw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Jun 2021 02:22:52 -0400
Received: from lucky1.263xmail.com ([211.157.147.131]:36336 "EHLO
        lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbhFJGWw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 02:22:52 -0400
Received: from localhost (unknown [192.168.167.16])
        by lucky1.263xmail.com (Postfix) with ESMTP id DA17FBA7F6;
        Thu, 10 Jun 2021 14:20:43 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [113.57.152.160])
        by smtp.263.net (postfix) whith ESMTP id P32529T140357287958272S1623306042221794_;
        Thu, 10 Jun 2021 14:20:44 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <0a0ef2f2f4c7605f7bd6b05bff47d8d4>
X-RL-SENDER: huangjianghui@uniontech.com
X-SENDER: huangjianghui@uniontech.com
X-LOGIN-NAME: huangjianghui@uniontech.com
X-FST-TO: corbet@lwn.net
X-RCPT-COUNT: 7
X-SENDER-IP: 113.57.152.160
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From:   huangjianghui <huangjianghui@uniontech.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        huangjianghui <huangjianghui@uniontech.com>
Subject: [PATCH] Docs: hda: Fix spelling mistakes
Date:   Thu, 10 Jun 2021 14:20:36 +0800
Message-Id: <20210610062036.30300-1-huangjianghui@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

correct Reatek to Realtek

Signed-off-by: huangjianghui <huangjianghui@uniontech.com>
---
 Documentation/sound/hd-audio/controls.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/hd-audio/controls.rst b/Documentation/sound/hd-audio/controls.rst
index f2ebc4f79b44..dbe6483f4ff4 100644
--- a/Documentation/sound/hd-audio/controls.rst
+++ b/Documentation/sound/hd-audio/controls.rst
@@ -102,7 +102,7 @@ Conexant codecs
 ---------------
 
 Auto-Mute Mode
-  See Reatek codecs.
+  See Realtek codecs.
 
 
 Analog codecs
-- 
2.20.1



