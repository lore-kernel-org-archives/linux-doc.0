Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D04EB64DA
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jul 2023 19:34:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbjGJTe1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jul 2023 15:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjGJTe0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jul 2023 15:34:26 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C65CB115
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 12:34:24 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1b8ad356f03so31307635ad.1
        for <linux-doc@vger.kernel.org>; Mon, 10 Jul 2023 12:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689017664; x=1691609664;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=X4CI5+SmtveArFRq79zdeBAZUIe4gvMt0iRwnhpBO+M=;
        b=O6OqaAAANi7fc6p016B8JcM8A4oTjbmBOcLJ18LWH7Ur+1YH4r3uQOvtPDwBv5c5Ve
         bhRMQo1LxCQTDbf3WXDKXxgdDn+hvmPpDvzcVIzxSbePdddl0sjfwbRfkLHyC6278ySz
         uWZVNrkq/0pjZEOTp4rGGfR/OO5dbH3NheQmO4G6aIf9KdYQFPisYzLgXIIEL1d98w9M
         xu/r68NDudVA5qEIPpmM0AHG6utlBJKdpxgVX5SeT7CxN/JpEhphL0uxQuu1Ecjtza9p
         VpWs06f8OHxl1eWuqueYzrJUGRXHMDHJLDuym0WBDPdiu3gPo4bE7Yc0kcjlDWDQ4L8u
         ppQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689017664; x=1691609664;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X4CI5+SmtveArFRq79zdeBAZUIe4gvMt0iRwnhpBO+M=;
        b=a20b5WP8WcGuJF0B2YmI0G8+PRy9N4r7AvjDRWrEOcWjk0brpTDyzG4Wievmpu9UZE
         27m6WsLjOafui814XuQAOiNcIjzQhavFUgg7rWFOSwwH5TgDbM89PzHlIYdWeuzR/CR5
         wZ9NZm0NMU3zTbB1ykDVOAhUwR5OXt9B5CeR4MC57dAF5K13ZmjVd30DSMDuHrCxe22I
         HpOFcT36JPdgh38Hd7dgI+TD+uOIPblNfF89rckGi3UVp0Jj7dy+nRPAauJPBuiFFt2O
         Wi6eeNJSRdoCn17JOnGUe6FX2b555iVY1JNillpnaOd1Q9MxX1SUrvZtipBGsBBpQaPk
         1yzA==
X-Gm-Message-State: ABy/qLZFT0lG4Omrv6ThRKHjDYmXj2yDKn7p+pqiPnsixQWPYzG6Fg/A
        xMBjdkxvehpBrA6HBknwtXTfzA==
X-Google-Smtp-Source: APBJJlGZJoofWbuCDQO4c7uLwyw5Yl/UFAKfGuF0ww5KD7pI79rJwkvqu+sjqOGXfBR/I4jWcXqlzw==
X-Received: by 2002:a17:902:eac4:b0:1b8:9002:c9ee with SMTP id p4-20020a170902eac400b001b89002c9eemr10551533pld.1.1689017664209;
        Mon, 10 Jul 2023 12:34:24 -0700 (PDT)
Received: from localhost ([50.38.6.230])
        by smtp.gmail.com with ESMTPSA id p15-20020a170902e74f00b001b39ffff838sm276606plf.25.2023.07.10.12.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 12:34:23 -0700 (PDT)
Subject: [PATCH] Documentation: RISC-V: hwprobe: Fix a formatting error
Date:   Mon, 10 Jul 2023 12:33:30 -0700
Message-Id: <20230710193329.2742-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc:     corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
        Conor Dooley <conor.dooley@microchip.com>,
        Evan Green <evan@rivosinc.com>, heiko@sntech.de,
        andy.chiu@sifive.com, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:         linux-riscv@lists.infradead.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Palmer Dabbelt <palmer@rivosinc.com>

I'm not sure what I was trying to do with the ':'s, but they're just
rendered to HTML which looks odd.   This makes "fence.i" look like
"mvendorid" and such, which is seems reasonable to me.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/hwprobe.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 19165ebd82ba..933c715065d6 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -49,7 +49,7 @@ The following keys are defined:
     privileged ISA, with the following known exceptions (more exceptions may be
     added, but only if it can be demonstrated that the user ABI is not broken):
 
-    * The :fence.i: instruction cannot be directly executed by userspace
+    * The ``fence.i`` instruction cannot be directly executed by userspace
       programs (it may still be executed in userspace via a
       kernel-controlled mechanism such as the vDSO).
 
-- 
2.40.1

