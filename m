Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B58FC433EF
	for <linux-doc@archiver.kernel.org>; Thu, 12 May 2022 04:12:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346132AbiELEMd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 May 2022 00:12:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346350AbiELEMa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 00:12:30 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D17511E5EC8
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 21:12:26 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id l20-20020a17090a409400b001dd2a9d555bso3827418pjg.0
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 21:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NyzkOphQ+s3WVfI9qZfbl6Rk93jtvh1L9Nek6U2DnhA=;
        b=p+ZQF3x6iL5RSb1SbGzvsDvcyOzZfgs8FP1VuBOzR3GQ2Bp2cHmaV0567sCajNEuUx
         YxPYubvCgJDElXCvfVkHCk2SwDdWBOJkDTprhtIn2l9fgF2zKsm5m/YvIZFBeNFBSk5U
         +f7WLIcOlXVmHcCtj00VV+jYYq/vWXbOFY1Q4BlrfOp61CKzZm7yHHnUVTkmVigBuJKs
         NUrdzNWcuxKACJ7kUGPYDFOu1sdGbL92heFH6oclrObrYbNezdyR7JHHgbZ8I0NkLgbG
         l4LgjRw6qyiDIBW7hyxyvhiJ9fiEMfsmxLaJSPqOZNSlzfEOvtTaQnDe7sBKnkPAsfCb
         qhrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NyzkOphQ+s3WVfI9qZfbl6Rk93jtvh1L9Nek6U2DnhA=;
        b=pdTd36qZ1JGY82llR/+1wwMPWg/E+as/V+Gn6iPDjMmU0rCNzQ/8SLNMfMA8aaAY94
         Q3sGXBeeybxwB67S4n8lKrf8Ct7/OP4ZY7QMzGqnfLR+XtnQ+DPWcudn+9n+z+bGtg0K
         FxTvjnwesZNsjWUiS4o1/0HvLlk9NIrxCqgn01U+TVQVAads+WpZQngc+LHdNXPVqb/m
         3CRyJDHDeyE+fQd100QoXZmR6R+InKup9HyjdprYQ0rzYRc6LNCa+XN7wwyjB55aibNZ
         kIDOCpzQD5nLVoNXQ6xHm0Yqbbw2QoN5kdxbtRYmPwbcrJDQPzQamyB68BlfUASp7Yby
         Rv1w==
X-Gm-Message-State: AOAM532Y/lfalJ9CJf+yhGA116zitPmi2ms78aLHP2HWY7ZucHGf96Kc
        gzv3u8Bq4UbcZ0TLhXfwDKGjYg==
X-Google-Smtp-Source: ABdhPJy2Os6T1eLduAVpNMHAOgfy3Gk48ySBgNZN3RV1s17QOFvQ51tM1HZts0r1JfRgeSgRie8Y0g==
X-Received: by 2002:a17:903:32c9:b0:15e:a1b8:c1ef with SMTP id i9-20020a17090332c900b0015ea1b8c1efmr28715136plr.173.1652328746333;
        Wed, 11 May 2022 21:12:26 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902edcd00b0015e8d4eb2dcsm2695161plk.294.2022.05.11.21.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 21:12:26 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v11 3/4] mm: hugetlb_vmemmap: use kstrtobool for hugetlb_vmemmap param parsing
Date:   Thu, 12 May 2022 12:11:41 +0800
Message-Id: <20220512041142.39501-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220512041142.39501-1-songmuchun@bytedance.com>
References: <20220512041142.39501-1-songmuchun@bytedance.com>
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

