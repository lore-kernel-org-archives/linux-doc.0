Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 509C7C433F5
	for <linux-doc@archiver.kernel.org>; Sun, 27 Feb 2022 15:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbiB0PIT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 27 Feb 2022 10:08:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiB0PIS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 27 Feb 2022 10:08:18 -0500
X-Greylist: delayed 911 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 27 Feb 2022 07:07:39 PST
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A7815596
        for <linux-doc@vger.kernel.org>; Sun, 27 Feb 2022 07:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=46bdGwyMmjt7hkhN4U
        tSZ0HMhtQxFV5se7LXeOn/Ed0=; b=kCjiplKPSifKXrA/Vjq7yRDdgDp9SAHip7
        FzFNcyWFxXBNz7aN2+RkT8v8hiRKJvz+dZB+Gh8TjK+ETU0Cd1MePQY+11xMVS4p
        jHEWNdB87+fnFWkjsRDa2kSB7SWGvadlJxmgkiwXMkGvVUJzxDJNJFIz4p/ga3As
        HFFyYRPhg=
Received: from speak-pc.lan (unknown [111.197.234.168])
        by smtp3 (Coremail) with SMTP id G9xpCgDHFjQWkBti59hCEQ--.38437S2;
        Sun, 27 Feb 2022 22:52:06 +0800 (CST)
From:   SPeak Shen <speakshen@163.com>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, alsa-devel@alsa-project.org,
        Sunrisepeak <speakshen@163.com>
Subject: [PATCH] Documentation: sound: fix typo in control-names.rst
Date:   Sun, 27 Feb 2022 22:52:04 +0800
Message-Id: <20220227145204.16600-1-speakshen@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: G9xpCgDHFjQWkBti59hCEQ--.38437S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF47WFyfKw4rtr4rur1Dtrb_yoW3twbEqa
        n7XF4fZFWUXryxtr4qyF1rJF15Cw47Cw18GwsYqr17XFy0y39xGryqqw4kZr18WF1xuryr
        Wr4kGFW7Gr9rtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xREeHqPUUUUU==
X-Originating-IP: [111.197.234.168]
X-CM-SenderInfo: 5vshtyhvkh0qqrwthudrp/1tbi-Be0PGB0Js6OigAAsb
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sunrisepeak <speakshen@163.com>

change 'cannel' to 'channel'

Signed-off-by: Sunrisepeak <speakshen@163.com>
---
 Documentation/sound/designs/control-names.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/sound/designs/control-names.rst b/Documentation/sound/designs/control-names.rst
index 7fedd0f33..765ff9b5b 100644
--- a/Documentation/sound/designs/control-names.rst
+++ b/Documentation/sound/designs/control-names.rst
@@ -34,7 +34,7 @@ CHANNEL
 Front		front left/right channels
 Surround	rear left/right in 4.0/5.1 surround
 CLFE		C/LFE channels
-Center		center cannel
+Center		center channel
 LFE		LFE channel
 Side		side left/right for 7.1 surround
 ============	==================================================
-- 
2.17.1

