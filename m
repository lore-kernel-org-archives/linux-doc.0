Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0263C433FE
	for <linux-doc@archiver.kernel.org>; Sat,  5 Nov 2022 08:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiKEIHC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Nov 2022 04:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiKEIHC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Nov 2022 04:07:02 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B69082AE39
        for <linux-doc@vger.kernel.org>; Sat,  5 Nov 2022 01:06:59 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d20so5796858plr.10
        for <linux-doc@vger.kernel.org>; Sat, 05 Nov 2022 01:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sTlB8wj0tFfos6UZyCf/juPl/y9MUjAg547NPw7lYQg=;
        b=icD1SUKd9gaBEnjkGd5RMOyYtBTzc3ameT5pqFvxJobY3TanpM+3ZL9KEqxCtEubJs
         C4N7u1Ti7ZLt0HIXhY67iWqyA+hdq0ITMBSHIaHn0t8eCxg0vjCcmYa+CjOdAYTBqJhX
         TQRlr66Ns2bZuhjgGYFdgSBdyqqa3gwGh+Of1AGKCyQe1ef08c+iSHmbefg8eEeWnnmZ
         ZREgG9OuGVLnxVAEBKjRzRm1wdX8xksCLv803aUNPhV5/a4ZRVjJtb29+/0PQolb22qD
         0fMbmAq36THACP9L78ybK78Q8L0LzXMZLNb9m4Cm5AptvREz49Av+9FUdmW0Jq1M/2C7
         pOaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sTlB8wj0tFfos6UZyCf/juPl/y9MUjAg547NPw7lYQg=;
        b=7hfs0OQGtVVtHRkgaCFMaUQj7iJxk2NP0PdOEiGVqeH7ORfwfqSW3VXI/ipM0yhiuV
         0HLxgfxQzCvVoV6ZWK3GVTwqBFnMajC0ROtZwE0t6gex1lBMqAdfvhbXpK5eC1RMyXlQ
         eB6is02uPRK1BEesMK1I2x3WXb7qF8xloxyW/4FvUSIPC4yKKc56xZiBpCfOrtWi5tz/
         hG4yFBMnk1gyRcxuDNX8a4ycIAhmCU+AJ+Md55OHpRKavFJbK5ic2x4m1iuaeelFOtPh
         I54M/c1yltA+q1vfkEmh6jTuSyAxEU2PjbaSf58cSfY1vkQJxuBHlEXEBv9nCbO0kUql
         oB0g==
X-Gm-Message-State: ACrzQf3/7RGCF0/ACbEPz9nhq6Qd+EOq4orD1V9hjzSW//FBIzKUiE9R
        Liq104PNlU78lmSCo/k6cYjSRZtwLpI=
X-Google-Smtp-Source: AMsMyM4ujwAaHi5gjpY4KQqcpUYYUx/XxThH5pbjV5MUnzonYV+oTzwPbujpng8uKCbz0uDH8m8kQg==
X-Received: by 2002:a17:902:b788:b0:186:a810:4072 with SMTP id e8-20020a170902b78800b00186a8104072mr39623358pls.86.1667635619206;
        Sat, 05 Nov 2022 01:06:59 -0700 (PDT)
Received: from albert-XPS-13-9360.. ([2405:6e00:492:32d2:bb4:da0c:7dae:af1e])
        by smtp.gmail.com with ESMTPSA id a24-20020a170902b59800b001788ccecbf5sm1056718pls.31.2022.11.05.01.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Nov 2022 01:06:58 -0700 (PDT)
From:   Albert Zhou <albert.zhou.50@gmail.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, Albert Zhou <albert.zhou.50@gmail.com>
Subject: [PATCH] Documentation: eisa: Fix typo
Date:   Sat,  5 Nov 2022 19:06:53 +1100
Message-Id: <20221105080653.4741-1-albert.zhou.50@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix a typo in the description of the kernel parameter
eisa_bus.disable_dev within eisa.rst.

Signed-off-by: Albert Zhou <albert.zhou.50@gmail.com>
---
 Documentation/driver-api/eisa.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/eisa.rst b/Documentation/driver-api/eisa.rst
index c07565ba57da..3eac11b7eb01 100644
--- a/Documentation/driver-api/eisa.rst
+++ b/Documentation/driver-api/eisa.rst
@@ -189,7 +189,7 @@ eisa_bus.enable_dev
 	initialize the device in such conditions.
 
 eisa_bus.disable_dev
-	A comma-separated list of slots to be enabled, even if the firmware
+	A comma-separated list of slots to be disabled, even if the firmware
 	set the card as enabled. The driver won't be called to handle this
 	device.
 

base-commit: ee6050c8af96bba2f81e8b0793a1fc2f998fcd20
-- 
2.34.1

