Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47286C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  9 May 2022 06:39:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229802AbiEIGmf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 May 2022 02:42:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234696AbiEIGdn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 02:33:43 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A873818A6BC
        for <linux-doc@vger.kernel.org>; Sun,  8 May 2022 23:29:50 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id w17-20020a17090a529100b001db302efed6so11934850pjh.4
        for <linux-doc@vger.kernel.org>; Sun, 08 May 2022 23:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NyzkOphQ+s3WVfI9qZfbl6Rk93jtvh1L9Nek6U2DnhA=;
        b=MAi1RD94OdpjwH1pi8YbdqfTnkUKhdIKyjN/91Iiop2H2NF4JDF3N5PanHUWjP88F1
         fUcAqUykTqgJo80i3V/4pawA8SeixCYIwVsOt+YS97K7cBVFe6m8Bt6eovF7+rmv3Sh1
         I70dZyLpAuCmziwAXdrz8QrbyLP79Fb7laHzZ8WE3bN2ooDGxsBQ4XCvj1YAVJjcTVz1
         sZWHPm1Treje0k0lQSyJ5RKtLLtaTs+wEKfjknWRbarWvd0zVZljThZWlCdPDV+7j4mQ
         GaBv2VEhB6F6AdWxIM3Vqe2XkbD8Ias/esGjM9ITPdVc2SZFTXoFrmeSAQvLe8X1mSd6
         yX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NyzkOphQ+s3WVfI9qZfbl6Rk93jtvh1L9Nek6U2DnhA=;
        b=N8NJsHrj5jurzdZ3oVdGNW4vfX3Yrm+n88tlNSJZ9o3KsbTkoqG7J3H6M2RZ25RXZy
         BRVBZzflgg+NHtpf3YG7AQGlNriwdEcLMLyZtD/SOLEvFsLR5jlStwoZAZT6UDAedxjA
         sSrHuDNuBWp627u+V/QyagHmyhl0s09N4FOIU9iFjQCrb8fw8m5/tHdEfrqsqqsLxaga
         PCj2D1LeYKx2aLXjKJKULwyMA2SrWyrX0htMRRFsoBCQywmge/Rzp7VWxWYArdqcMr27
         L4ItyedkcP94RaKHWIDovGkvV1+LtkAqSs8P4/Nc+oopwfVXMlIl697aaC+/bShK5Sfd
         lkMQ==
X-Gm-Message-State: AOAM532Xj+OK9kXc40eWbhGrVHSpWfsJIZE4Kyd/DI6K8QczKcbpX0Jc
        Jp2e6eZDC88URrYo8MX0sWEaBg==
X-Google-Smtp-Source: ABdhPJyUeNp5lyUBRQZydy9WfLbxkuPhlCBdpMAI02q3YSVfY3kMmne5Gx42MkLs4yh2Hehx52YfiA==
X-Received: by 2002:a17:903:31d1:b0:159:804:e852 with SMTP id v17-20020a17090331d100b001590804e852mr15083698ple.19.1652077773702;
        Sun, 08 May 2022 23:29:33 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.250])
        by smtp.gmail.com with ESMTPSA id k17-20020a170902ba9100b0015e8d4eb2c2sm6162001pls.268.2022.05.08.23.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 May 2022 23:29:33 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v10 3/4] mm: hugetlb_vmemmap: use kstrtobool for hugetlb_vmemmap param parsing
Date:   Mon,  9 May 2022 14:27:02 +0800
Message-Id: <20220509062703.64249-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220509062703.64249-1-songmuchun@bytedance.com>
References: <20220509062703.64249-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Use kstrtobool rather than open coding "on" and "off" parsing in
mm/hugetlb_vmemmap.c,  which is more powerful to handle all kinds
of parameters like 'Yy1Nn0' or [oO][NnFf] for "on" and "off".

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  6 +++---
 mm/hugetlb_vmemmap.c                            | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 308da668bbb1..43b8385073ad 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1703,10 +1703,10 @@
 			enabled.
 			Allows heavy hugetlb users to free up some more
 			memory (7 * PAGE_SIZE for each 2MB hugetlb page).
-			Format: { on | off (default) }
+			Format: { [oO][Nn]/Y/y/1 | [oO][Ff]/N/n/0 (default) }
 
-			on:  enable the feature
-			off: disable the feature
+			[oO][Nn]/Y/y/1: enable the feature
+			[oO][Ff]/N/n/0: disable the feature
 
 			Built with CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON=y,
 			the default is on.
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 6254bb2d4ae5..cc4ec752ec16 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -28,15 +28,15 @@ EXPORT_SYMBOL(hugetlb_optimize_vmemmap_key);
 
 static int __init hugetlb_vmemmap_early_param(char *buf)
 {
-	if (!buf)
+	bool enable;
+
+	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
-	if (!strcmp(buf, "on"))
+	if (enable)
 		static_branch_enable(&hugetlb_optimize_vmemmap_key);
-	else if (!strcmp(buf, "off"))
-		static_branch_disable(&hugetlb_optimize_vmemmap_key);
 	else
-		return -EINVAL;
+		static_branch_disable(&hugetlb_optimize_vmemmap_key);
 
 	return 0;
 }
-- 
2.11.0

