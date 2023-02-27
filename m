Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14FD2C7EE2D
	for <linux-doc@archiver.kernel.org>; Mon, 27 Feb 2023 18:41:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjB0SlV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Feb 2023 13:41:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbjB0SlU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Feb 2023 13:41:20 -0500
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8898025BA0
        for <linux-doc@vger.kernel.org>; Mon, 27 Feb 2023 10:41:18 -0800 (PST)
Received: by mail-qv1-xf2e.google.com with SMTP id nf5so5124825qvb.5
        for <linux-doc@vger.kernel.org>; Mon, 27 Feb 2023 10:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=efficientek-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A/ulrwzIZworYzpsVbD55851xLgzvV7G5hrKbS1T2G8=;
        b=IbvZeAIiHHVHbpQ2DAC4KkKBVmBL4vsQW7CGtp6pPwV5YMCJjtP72xR7TaLNtapAg5
         hVZl64CYzSAwncUX2umFsIoSh5M3TZzD32G3hlwlT+6h9DoPf0OMwg/0vk3wmGCQeIk0
         E37ULciG/82PrXrswWg/4mj71Sa9svhDHmg5d+QBbVo7WsVM8besbHtDSE4WufhxQHmd
         4POVCVeH5tXhpW4UO3arKSZbPCIljBWeqLwzRKPawyzR0wMnK8zxhjNZfVT0kXDDt2/6
         26f/SqQ9yO4PKvLaG0w2C0u+VcOemXUwCYWDKgqD4QkUWxm1vrixiXuR9t0cxwqnin4W
         x2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/ulrwzIZworYzpsVbD55851xLgzvV7G5hrKbS1T2G8=;
        b=EypRdIlO6YhfTRPRVJzkaFs5l+SPBX55fpIB0k5F63KK6qCCzxwHwjN3EcKcDesJ8Y
         8nGPPO6N+9ZF2tGTQQH1hRPvbdZ2c9OJZXBq5K5o6z4Ws3gOMqFHwNdkRTVQWciJoaTP
         xtXngEcOj+kaR+/tdqIf6uyoxwbEdnxMY5rZfUmHrm+W+hWYyKsRN9A/uFad7HO/Ebtm
         ntwdIukWoGotf5w2ziMLW9JceiBK7PQjyZzxMD6UpXvpXEBWaXCq6P0M8AjJlmgJeqs/
         y30khjoDF0x+33o7b18Vop2P3JSq++0r7xJ56MorNgDrTB3QXrIIPUGjaKDUXTue2A2C
         YCIg==
X-Gm-Message-State: AO0yUKVNaZWxHRTGmjJCRXppiW66N0K70aqjpAS/9luMpSnPGjSQGKvx
        pos0kqC19veDn/lJYuAv3A28AzZWFHC1j4Qo
X-Google-Smtp-Source: AK7set/LuVuasIVGB6lWomVJu25FMp222NzwbdwPoY2fFQ8GTwHs2oMIIQxlhbK7QXO0UDzEOpA6JQ==
X-Received: by 2002:a05:6214:d49:b0:56e:c00c:bf5c with SMTP id 9-20020a0562140d4900b0056ec00cbf5cmr808386qvr.31.1677523277734;
        Mon, 27 Feb 2023 10:41:17 -0800 (PST)
Received: from localhost.localdomain ([37.218.244.251])
        by smtp.gmail.com with ESMTPSA id d184-20020a37b4c1000000b0073b3316bbd0sm5392861qkf.29.2023.02.27.10.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:41:16 -0800 (PST)
From:   Glenn Washburn <development@efficientek.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Glenn Washburn <development@efficientek.com>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        "Tobin C. Harding" <tobin@kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs: Correct missing "d_" prefix for dentry_operations member d_weak_revalidate
Date:   Mon, 27 Feb 2023 12:40:42 -0600
Message-Id: <20230227184042.2375235-1-development@efficientek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The details for struct dentry_operations member d_weak_revalidate is
missing a "d_" prefix.

Fixes: af96c1e304f7 (docs: filesystems: vfs: Convert vfs.txt to RST)
Signed-off-by: Glenn Washburn <development@efficientek.com>
---
 Documentation/filesystems/vfs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
index c53f30251a66..f3b344f0c0a4 100644
--- a/Documentation/filesystems/vfs.rst
+++ b/Documentation/filesystems/vfs.rst
@@ -1222,7 +1222,7 @@ defined:
 	return
 	-ECHILD and it will be called again in ref-walk mode.
 
-``_weak_revalidate``
+``d_weak_revalidate``
 	called when the VFS needs to revalidate a "jumped" dentry.  This
 	is called when a path-walk ends at dentry that was not acquired
 	by doing a lookup in the parent directory.  This includes "/",

base-commit: 7fa08de735e41001a70c8ca869b2b159d74c2339
-- 
2.30.2

