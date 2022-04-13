Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0E8DC43219
	for <linux-doc@archiver.kernel.org>; Wed, 13 Apr 2022 14:48:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236279AbiDMOvK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 13 Apr 2022 10:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236292AbiDMOvH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 13 Apr 2022 10:51:07 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB48B644D6
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 07:48:46 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id 12so2145500pll.12
        for <linux-doc@vger.kernel.org>; Wed, 13 Apr 2022 07:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EfqzshiMxPgqo91bqRrogKECfyK/4BP/Cl7KQelj6Dg=;
        b=yKhiAYWaSOYJQwBNVwtujizWquYP4rI6ZlWZ1+KiSkaey8GNgzlk7/TSAQbLtl65q4
         k0IUUazxHJMIdN3CJ/ARThnVKC1EdJUA8kR16DeUTkejbuH5jXQ10dSsciIzfDeeLad6
         imdw0nic9VVQdddcq7k1pvPAP8ytBSdWAePW1rmKZUqnsDOzJEo4cz1i1L7ChnejwQAK
         4fTQuEz4UgoboV1lUUtJkndrq7ssp/8DvFy/umR9lzeiffegqFV/wyLDDpcX0x9Ev5kD
         xoxy59LZX+TOoDoT4sQz1CK2pXdhVzNMZcuxupQZWhrkMX8aZOvAbGXxQGg4AxXyExKu
         oMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EfqzshiMxPgqo91bqRrogKECfyK/4BP/Cl7KQelj6Dg=;
        b=q7V/6WbPH8XYfG4TnT4gn2Mqui7JT750ZgfoavPrRpoCAeV0J8jKnb6ucPklD7LdLn
         4bjReHvPA/krYDOdt7+RjTNsmJNatQ/6qewMMRB+/JKlFBNifEosDqtwzmQ5F3p3JD+3
         wYn4lDKzW3kQ4rP8KYQBJX//gaAqpzlz7PMa6G2vg1FRRqSitF3wYH9ADdVQQTFyIryu
         GqKGd8xz1m18Y1Tm3wKW/T04XRMtbJRVJRNZ4pel1tnwM71FVKqLD6XYAeXYJwgoeiTD
         EHtlo8n2057ZEeVdnlRSUc3WIMnVWFxFI8gsJ32nz6Tit0J7QGRHDLls4SPvhcqjoFDA
         8tXg==
X-Gm-Message-State: AOAM533sqiBRnllCtDbeTB40wtDHLAOTqAa0+5ndUYLgTeSDQoabmkBf
        H87Idq1TrM2zF6T4u89kUQ2yDA==
X-Google-Smtp-Source: ABdhPJw9+0J/Pv1eSXmSk5scRsk+PgJb9qJVP7Gb0TeMWiDl/M3OE9EtQ9tF40Ia+6ctpIzKdiHd1Q==
X-Received: by 2002:a17:90b:3b8c:b0:1c6:ed78:67e2 with SMTP id pc12-20020a17090b3b8c00b001c6ed7867e2mr11221387pjb.163.1649861326236;
        Wed, 13 Apr 2022 07:48:46 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id p27-20020a056a000a1b00b004f3f63e3cf2sm47817257pfh.58.2022.04.13.07.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 07:48:45 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v8 3/4] mm: hugetlb_vmemmap: use kstrtobool for hugetlb_vmemmap param parsing
Date:   Wed, 13 Apr 2022 22:47:47 +0800
Message-Id: <20220413144748.84106-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220413144748.84106-1-songmuchun@bytedance.com>
References: <20220413144748.84106-1-songmuchun@bytedance.com>
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
index f3cf9f21f6eb..6ea428023d51 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1669,10 +1669,10 @@
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
index be73782cc1cf..4b6a5cf16f11 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -195,15 +195,15 @@ EXPORT_SYMBOL(hugetlb_optimize_vmemmap_key);
 
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

