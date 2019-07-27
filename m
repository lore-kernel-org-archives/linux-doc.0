Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 488F97D2F0
	for <lwn-linux-doc@archive.lwn.net>; Sat, 27 Jul 2019 19:49:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388099AbfG0Tta (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 27 Jul 2019 15:49:30 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:46378 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387999AbfG0Tt3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 27 Jul 2019 15:49:29 -0400
Received: by mail-qk1-f194.google.com with SMTP id r4so41460610qkm.13
        for <linux-doc@vger.kernel.org>; Sat, 27 Jul 2019 12:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=MLshReDkYuv6FydwbDI/5u0SStZzmu3eRSUwofEi1c8=;
        b=KoPbzQD9PlwrCccSFdsZKevyCr6HA0txjn1/ZTGoVuMO4mq2k/BvUdeAj2i5NWVCOL
         cyPFAmwDqyGt4EzhjjAi2rZxzoUMaddGsvnmoVXvFWzpfZ7Pp2EEyhMaL3zLhjEJ3Dxh
         KX8Tst6bJbFqP6FUAtcUXG8Vyl0/vACXs3ajERZOEX4OssqQo97hKyV0GYin/LG7+wpx
         sTvjGVUFtmBp0Ar2ksf5gcgdQfhIRdQuMiNqf6aBvlYgW/RW0P9GCCw9s13ibCWSFi+q
         b+pWaZ1aU6jRG27Y+PKiaNeD0z+PCwFX4R1h/kpjAf/3XTnmN2yrypbkVgSp+/Byk4uk
         cpcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=MLshReDkYuv6FydwbDI/5u0SStZzmu3eRSUwofEi1c8=;
        b=lmDCmkNIIS/mTYm+WETtt9jeAbc3r5aIgslS1x20ZZyAJ1lH5Q3sbL9xixDOwl99b+
         v9o66RKOwbv0zYItiMf93ELWDT1JOSW+x9YWBu0EIM4ig9t1n/QIioI0xYvVOjCh3GCJ
         BT6JvyBH06FsXBrF0OdIL7IfUAT9VsQUazL21Ugn2MiaDT+Tb01Cuu+oZizumKfKUUj1
         oRT5++avbZC8b2mniDoOuNwrCp7l2VA0t6lRL5UMwIHBO02f4IOQJ++fdFO83MyizIQV
         fBhWpgNJ9BqkaOMVbhOGS1JVqMAcNjn307sYteUUVGc9lqtkxeok52xf9twhDy1Gt2Wq
         +Eyw==
X-Gm-Message-State: APjAAAXf3i8IjgRf30pd1+8mqUCBHkXzwo7UxTqQjnMmFW4xY7w2yaxR
        0vuXHwzErF/I2C7uH/Uuit/cAVAo
X-Google-Smtp-Source: APXvYqwYuOaEqSRjxIubfVGN0TFTYjMw5AXspC5h/bfuTmYjn5wfcB5dlpL7Unxty9yRmxM8bfw+0Q==
X-Received: by 2002:ae9:de05:: with SMTP id s5mr69903948qkf.184.1564256968684;
        Sat, 27 Jul 2019 12:49:28 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:22a:18a2:7b63:4439:1287])
        by smtp.gmail.com with ESMTPSA id r5sm25172442qkc.42.2019.07.27.12.49.25
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 27 Jul 2019 12:49:27 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     akpm@linux-foundation.org
Cc:     sfr@canb.auug.org.au, corbet@lwn.net, mchehab+samsung@kernel.org,
        linux-doc@vger.kernel.org, dima@arista.com,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2] docs: admin-guide: Adjust title underline length
Date:   Sat, 27 Jul 2019 16:49:33 -0300
Message-Id: <20190727194933.28270-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The following warning is seen when building 'make htmldocs':

Documentation/admin-guide/sysctl/kernel.rst:397: WARNING: Title underline too short.

Fix it by adjusting the title underline length appropriately.

Fixes: 725d8c9a2cc5 ("hung_task: allow printing warnings every check interval")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Added Fixes tag
- Sent to Andrew as the commit that generates the warning comes
from his tree (Jonathan)

 Documentation/admin-guide/sysctl/kernel.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 2e36620ec1e4..8af424dd0364 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -394,7 +394,7 @@ This file shows up if CONFIG_DETECT_HUNG_TASK is enabled.
 
 
 hung_task_interval_warnings:
-===================
+============================
 
 The same as hung_task_warnings, but set the number of interval
 warnings to be issued about detected hung tasks during check
-- 
2.17.1

