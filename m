Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F6B9C43334
	for <linux-doc@archiver.kernel.org>; Tue, 28 Jun 2022 09:24:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343881AbiF1JYs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jun 2022 05:24:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343906AbiF1JYR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jun 2022 05:24:17 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81098286C3
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 02:24:11 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id x8so7021292pgj.13
        for <linux-doc@vger.kernel.org>; Tue, 28 Jun 2022 02:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tKsl/FyBMuyoLwv1dbdkul0HUkyTRTbta9GTd/qg648=;
        b=kmlXP3rmTBXz5+4TJo//hmT2jB4MxmfWPs8iGQkHOlQBg+rsoPITThmujE5oZlqSyG
         fWu7CtFdyuxFIJPn+ajdlR9dCr4S51oy4WvnwewRQZdfq7E+j0mQSwzwRjSgIvguexqG
         fk3Qt+5y38+wp9WNkk+LMSBP0nc8nXemI+xT/4laLfvG8cccB66V1pbT2qVRKK9w1/7z
         UOZnxF6q0kGOYIWB/RFeprJs1fGdcR+PEaOaKE3JNBOyceQycTM2BgCSUGxmZLe99u1C
         xX95JGCPjlHlauI6BtduVriW4yYgE9uvq9xJq+thJNgUvkPEcXuFCutJkJYjKCnMEGKi
         LBKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tKsl/FyBMuyoLwv1dbdkul0HUkyTRTbta9GTd/qg648=;
        b=5CTe6pDvMxS80qbyWafhM5geknpJxf46PMvFzAj2O+OafBRCi1nt7Z4/VCOHp21Ewj
         NH9CdSgPlAT881aDOrEfmJuhHKEnlPgkTkY7Vi32urrlw2OOwhtqLyxmS7wsl7m4rlf6
         XzMu9eew9uasUVFxdoEbjnxPvxcYnUkUu1RBC05NJTXCc0u1wCmZtVJ7dH5ZFrC8y0WV
         YdRwDeRSqFeupsb9fAW5wbXZpznoVwlW8A1rdKMF3M9kmK7teL50O9CnXvRcpIvbniVc
         gsT9ogfTn/vWyrLy91FAv+f+HWrfL8KSwisnKypzhS9pRA+8lrHs0TN7wT1Sg+qrG0yb
         b5Hw==
X-Gm-Message-State: AJIora+ljnS8sfXB8g8Yt0EvtDYczBQuRNsvbCO7iGTIW0hmIB6vARL8
        zb439tjoytF9JymCHNQVasG/xw==
X-Google-Smtp-Source: AGRyM1tM8i7pH8lTHkass0ZEXT2Z2SMP+f0quLdvC0M1TlAQly/dZen+wWI1RJzBbMXck8L6xsm+yg==
X-Received: by 2002:a63:a748:0:b0:40c:9a36:ff9a with SMTP id w8-20020a63a748000000b0040c9a36ff9amr16326337pgo.545.1656408251045;
        Tue, 28 Jun 2022 02:24:11 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id mm9-20020a17090b358900b001ec729d4f08sm8780463pjb.54.2022.06.28.02.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 02:24:10 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, david@redhat.com,
        akpm@linux-foundation.org, corbet@lwn.net
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, duanxiongchun@bytedance.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 5/8] mm: hugetlb_vmemmap: replace early_param() with core_param()
Date:   Tue, 28 Jun 2022 17:22:32 +0800
Message-Id: <20220628092235.91270-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220628092235.91270-1-songmuchun@bytedance.com>
References: <20220628092235.91270-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

After the following commit:

  78f39084b41d ("mm: hugetlb_vmemmap: add hugetlb_optimize_vmemmap sysctl")

There is no order requirement between the parameter of "hugetlb_free_vmemmap"
and "hugepages" since we have removed the check of whether HVO is enabled
from hugetlb_vmemmap_init(). Therefore we can safely replace early_param()
with core_param() to simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 mm/hugetlb_vmemmap.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 4d404d10c682..b55be6d93f92 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -423,14 +423,8 @@ static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
 DEFINE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
 EXPORT_SYMBOL(hugetlb_optimize_vmemmap_key);
 
-static bool vmemmap_optimize_enabled =
-	IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
-
-static int __init hugetlb_vmemmap_early_param(char *buf)
-{
-	return kstrtobool(buf, &vmemmap_optimize_enabled);
-}
-early_param("hugetlb_free_vmemmap", hugetlb_vmemmap_early_param);
+static bool vmemmap_optimize_enabled = IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON);
+core_param(hugetlb_free_vmemmap, vmemmap_optimize_enabled, bool, 0);
 
 /*
  * Previously discarded vmemmap pages will be allocated and remapping
-- 
2.11.0

