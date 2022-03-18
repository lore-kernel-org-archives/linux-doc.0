Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9821C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 18 Mar 2022 10:09:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234850AbiCRKKo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Mar 2022 06:10:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234871AbiCRKKn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Mar 2022 06:10:43 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434CC1FAA21
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 03:09:25 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id o8so4734730pgf.9
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 03:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VeiakI6ZdfDqy26wAEKtPtiKSfYNO4Hqsr8Ua8hMV6s=;
        b=RDQVX1ZRVvaucfFOAP3mBrB+koiw+26bwZKvIYeeTs9vsVtInLLnzToEhxEYTdN3ut
         ktUd0StaxKeGjBvUjKB7VKrY/VDc3VFbPXOe0TGBIKu5UEG1v0lvtubKLYNMaa75In78
         xcs7Or2qQHTGxd4TttERqtkqxUQlMfb5qHJkMA5Fp9fBFxYUU7uuu55o7C7GwZcjQsRQ
         DLsXM42iBnB84MxvsJvE9jmVZYgtVZiG02+14Twn5UBcdG2qUx6trWh2k2eZKX9PLq/G
         l4iQpMy3PEelpVzA5kUBnDvgDu0Gs0NYhJz+c5WRLndFcTXsyrArxFXPGyHUVfCAlJxg
         yv8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VeiakI6ZdfDqy26wAEKtPtiKSfYNO4Hqsr8Ua8hMV6s=;
        b=IvQBbCT85kDfRwbUcbyDoT9/foPhYJVZ3jqZuzhheFGCcljnsQ0Mmf6s+0n9blN2yk
         hXbB/3wcRWRAbI7A2yv3XmhLvIdi6q0Axh+R8GZvkB8tud2z1q0uiEDhP1uAMwBfNxGR
         Etjv6hDZ5SfublNGDbC6W89TERHItOOXNVH8kyD3Bl0GO6U5tiAou4M1f5l3Nh4EoCot
         ExHjgr3RMb13r0zM2fwUxzM4sfD8FQ9kWAcutwrx6fb3Qjzh3Zhovu/7fN5wplZZ6Cu3
         Mi5BFxw+1g6b8bdEmtJ3jOZvO4eAbpuy8N325qxWa1A2NtgQxRsqrz24ZqmctTPKLPkt
         OG0g==
X-Gm-Message-State: AOAM533CZr9DMz0CMs4aHa4aJCJhLJHu2wdOkyrCzABFZZ+8ahKM+tS7
        gdBSSqYagM/gDvSnuaKOEjRtYg==
X-Google-Smtp-Source: ABdhPJxCCJnh1IXzUQpPAo1+tedl1QUehfYAAocuezbBd0A4UaNgvcR+Z92fhQTN/b1bZhBXA8y/uw==
X-Received: by 2002:a65:418b:0:b0:382:250b:4dda with SMTP id a11-20020a65418b000000b00382250b4ddamr3508780pgq.428.1647598164788;
        Fri, 18 Mar 2022 03:09:24 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id j3-20020a056a00234300b004fa042e8216sm9541252pfj.2.2022.03.18.03.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 03:09:24 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 3/4] sysctl: allow to set extra1 to SYSCTL_ONE
Date:   Fri, 18 Mar 2022 18:07:19 +0800
Message-Id: <20220318100720.14524-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220318100720.14524-1-songmuchun@bytedance.com>
References: <20220318100720.14524-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

proc_do_static_key() does not consider the situation where a sysctl is only
allowed to be enabled and cannot be disabled under certain circumstances
since it set "->extra1" to SYSCTL_ZERO unconditionally.  This patch add the
functionality to set "->extra1" accordingly.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 kernel/sysctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 770d5f7c7ae4..1e89c3e428ad 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -1638,7 +1638,7 @@ int proc_do_static_key(struct ctl_table *table, int write,
 		.data   = &val,
 		.maxlen = sizeof(val),
 		.mode   = table->mode,
-		.extra1 = SYSCTL_ZERO,
+		.extra1 = table->extra1 == SYSCTL_ONE ? SYSCTL_ONE : SYSCTL_ZERO,
 		.extra2 = SYSCTL_ONE,
 	};
 
-- 
2.11.0

