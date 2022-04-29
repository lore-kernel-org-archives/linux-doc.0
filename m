Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B16B6C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 29 Apr 2022 12:18:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358997AbiD2MWK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Apr 2022 08:22:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359005AbiD2MWH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Apr 2022 08:22:07 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 408A6B36B0
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 05:18:49 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id cu23-20020a17090afa9700b001d98d8e53b7so7944125pjb.0
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 05:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TjSe9ss2+05m7bNnHnq06g/24z1s/6oiiRPfk3T645g=;
        b=V4zTolFkDRy+bEhCxQOBfvMydHiQ3SDhwpCdYR9LSjJYAgp4qwzEPoZTrrY1r+QnIR
         5poY1Y5Q+CRau1IQNkm6BtRRdKx4KIxTNJmSyi/EcQhsHxzmoF94quYhEKljm34++Aio
         R92KIYGjemhsxaueyDuUq8u71R/hQL5lkSg0TB+CDKAFOkjRTE5M2grrgQgULjQcC/2F
         nH13a8tMufrBC96PWlBzBLLxuOJMRSco17kYWrm683IVcJs8VLct/BumiZWjOkn83+yz
         5e49ckj0+KdIpb8CYtz1LTPXUd0rqFdymS2P1gDYe5ErW1f5PUyG68iP4l028mIezWJS
         9Wjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TjSe9ss2+05m7bNnHnq06g/24z1s/6oiiRPfk3T645g=;
        b=G9yt2VimXCFo12Tawma2HIjyiCgJJbrfuxhP+PSVnYNeN1fzhTQ09U34kcO9jlBpNb
         XelmXqQLUuPPPbA7eoH71KZ2wfSFtfgCh5eQCALlE39TzGjEWFJtwM+uPNh9l3UTnS5O
         fB+LALfto7PCD4wPOvEHdWKIa0uy7AkdfarYiqTHK5usLDgWtzVCXVNVWSFwU0uZ+OkN
         RwmR60Qz/UYf0yDh5E7snYEek7VIhnCAr2HTGB7x0eKSXG7d2uEi6ohG0EUrOBGcYptc
         c1YDJ5o+S6DlLmI+/j8x2WBADCLKaE4iNL7B6Lg3XZm/N9S835570iTD5Ku3RygSH/9r
         yGWg==
X-Gm-Message-State: AOAM531t/WDwgXSBSPf2OY7u/P1cnNvHm/FbNVlqpjLP7lRchrmzk1s4
        1EvJ3Nif+ak9JU0p688NYKlq0Q==
X-Google-Smtp-Source: ABdhPJx1iBA5oFoann5/gl9fGdgcEAPAYUM965dVZhzsaPjPjJkZI/6OtjdgqxpK9Cr3f72bhF+Rfw==
X-Received: by 2002:a17:903:2352:b0:15e:5aad:af5c with SMTP id c18-20020a170903235200b0015e5aadaf5cmr9612588plh.116.1651234728764;
        Fri, 29 Apr 2022 05:18:48 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.239])
        by smtp.gmail.com with ESMTPSA id k11-20020a056a00168b00b004f7e1555538sm3101421pfc.190.2022.04.29.05.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 05:18:48 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v9 3/4] mm: hugetlb_vmemmap: use kstrtobool for hugetlb_vmemmap param parsing
Date:   Fri, 29 Apr 2022 20:18:15 +0800
Message-Id: <20220429121816.37541-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220429121816.37541-1-songmuchun@bytedance.com>
References: <20220429121816.37541-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Use kstrtobool rather than open coding "on" and "off" parsing in
mm/hugetlb_vmemmap.c,  which is more powerful to handle all kinds
of parameters like 'Yy1Nn0' or [oO][NnFf] for "on" and "off".

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
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

