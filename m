Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863B2ECAA2A
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 16:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243078AbiHYQns (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 12:43:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243104AbiHYQnS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 12:43:18 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8D7DBA163
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 09:42:46 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id x26so3071687pfo.8
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 09:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=HEbBlNE74XAOeDaqxFIrSXJjdeTVN4APARuNyd0Kkrc=;
        b=cIO/d1BGqL6fFstMorhflZg+vJ9obx8pMQqBtB2zXIPXvMogHPeMsu0jrMv3o/VTJZ
         IBkJf62+3rnapmZ4QtajmqxNiCKCoJpFUWP5Aj+4N2faq+JVYEs0jc7ZNWjuyG1nRM4X
         bG+zNO+sE24Jhpk3TgvTfkthoBCFGUujC2Zb58e5p7FLK/XotEpTJEWCcKgLCmbqgujF
         2omehs8EXzqBUnztnRg0Tg4+J3IhJW7PuV1Uhz8xpCunXu90C2TIFPpCGuP+8zZtnPgn
         eqzv/Ei/WX+oIjQ+VhIURYRrhU3nKqOCCdinlLLYeuDtRbLKy3hIv9MJ/xYh3I+q5Cwx
         epJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=HEbBlNE74XAOeDaqxFIrSXJjdeTVN4APARuNyd0Kkrc=;
        b=ayPyLYRyxJjP39ChMi6rg2xKOP7QVLUyza3FS77cB33TCYOus0HRm/jin8vaETFK/z
         oh1ipjv+mJ8jEWI82Pw0ed8qDYKz69JZPYrNMS2OLDfuyk+TutSZPGqDSBZjvzvEW7e5
         Hun6O+oyUXR+WVr3ZWZ1b5YMaoKwXH8myRLvANqwc52wPpI7gfhEX7N6D5zUKkivswJa
         A1oVQ789HSghEpoOuiGQbMgiKg29isFu5s2xk08oOV5TLCR1/vs/P4y/5LlLy7YMD4A6
         5OODN+/oh2GiZ57pUZ1B24Iz+m5Ohki+ms4YMyPaQLTQS5vbTnU3CRSchyk6YbKbYNSU
         MZsQ==
X-Gm-Message-State: ACgBeo0lUCIzbAAyRRp5RD0v1kUSDwwMmvR//tOgPFEo0m5Mw8AxG+6E
        FDEDwY8UD4h9uNXpDeh8IciDgQ==
X-Google-Smtp-Source: AA6agR7DaINFBPuM/7F9bdN/GnJGUkNZ1zOAW5PM+T8a3FN4i4YkOwbmC4mTqFPVZ4HbR+7ywDSOhg==
X-Received: by 2002:a62:17c8:0:b0:537:b287:3ef8 with SMTP id 191-20020a6217c8000000b00537b2873ef8mr623736pfx.40.1661445765140;
        Thu, 25 Aug 2022 09:42:45 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.236])
        by smtp.gmail.com with ESMTPSA id b18-20020a62a112000000b005362314bf80sm12779408pff.67.2022.08.25.09.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 09:42:44 -0700 (PDT)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     hannes@cmpxchg.org, tj@kernel.org, mkoutny@suse.com,
        surenb@google.com
Cc:     mingo@redhat.com, peterz@infradead.org, gregkh@linuxfoundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com,
        Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH v4 02/10] sched/psi: don't create cgroup PSI files when psi_disabled
Date:   Fri, 26 Aug 2022 00:41:03 +0800
Message-Id: <20220825164111.29534-3-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220825164111.29534-1-zhouchengming@bytedance.com>
References: <20220825164111.29534-1-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

commit 3958e2d0c34e ("cgroup: make per-cgroup pressure stall tracking configurable")
make PSI can be configured to skip per-cgroup stall accounting. And
doesn't expose PSI files in cgroup hierarchy.

This patch do the same thing when psi_disabled.

Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
---
 kernel/cgroup/cgroup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 03dbbf8a8c28..2f79ddf9a85d 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -3748,6 +3748,9 @@ static void cgroup_pressure_release(struct kernfs_open_file *of)
 
 bool cgroup_psi_enabled(void)
 {
+	if (static_branch_likely(&psi_disabled))
+		return false;
+
 	return (cgroup_feature_disable_mask & (1 << OPT_FEATURE_PRESSURE)) == 0;
 }
 
-- 
2.37.2

