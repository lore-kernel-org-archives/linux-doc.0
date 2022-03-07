Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C30C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  7 Mar 2022 13:08:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240901AbiCGNJh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 08:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240756AbiCGNJf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 08:09:35 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF45260CC7
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 05:08:41 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id e13so13713441plh.3
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 05:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qW5FPsjHoeDJhXjcnei9BSeHnfSk9h1jeGzbOieqiTI=;
        b=Mvh1dUO5XlJTKhAQPXB10OJdy5tionKj/pcUVRBSYgQQ2XYHy1Iz09aVnM8gn13pbT
         EfWrBCO54EEaP743f2KxxiJxmO91AS90PxkE59Tm8IdWJ1VeUXxxzDAPZfqa0FVIc5Kt
         E48Otybo5+HsZ+bTexjnn3sjO7EI1uLgscUPFpnxC98gu8EFOrOCo+vHgSG6mim7+FPZ
         6KDalI6lStC0WZ/nnCrs4/DiFH01Lk+MJJU5LBOZuZSZ2VN3VuTONhCzoLfC5gplBR9s
         Q7DcsNwsG2ebV7Fq/XznHUuizt6xizgYcLLBn8LXpctNu2/4P+BUymdiQJIwo5i6zsof
         3D2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qW5FPsjHoeDJhXjcnei9BSeHnfSk9h1jeGzbOieqiTI=;
        b=7t1zch9LjhTxbl4C/HYq6XPwTHexqtgYwWX5LYFfvq2mGP/wbnMFR8/bnfpf1V3BDG
         RszCZhSL5nuVAz8RPydFJiOAmuxTAgbPKFHAx43RoF2j81te9L7T39StlTw83HguJCZ7
         GAGae0dAK1l9p4+qmcnL1c6NdOf8YulFs9AbFN9r2/lJBbRnT0U7olzE1MCuzO5V/qkN
         qsgURyk5C+K9JfkExeiqAxbIAo4npHsrwojuB6tY6c5VZ9asSdV4VWD8QsTgI/SHojbC
         u7DgBE2CzMobDC4sSUaH1znX3lz4OcB0hYoA0aJLSC0R8H0IwLM8+nOt8e9CRm2a7/xM
         b7eg==
X-Gm-Message-State: AOAM533+co/0i+kIhu3m2udoJeLlMpUD4iEpCsBTxVaTHeIVyOReaaCY
        hg+KG/sEae7GU/62jw4mJdHrjw==
X-Google-Smtp-Source: ABdhPJyi/s6JrRd7CnoW3N3QL8rs8llPB8YRmzbheDpz2rgM3I7HPPl+hZkDsa92nWf2RiLq/+elKQ==
X-Received: by 2002:a17:902:8bc2:b0:14d:6d13:a389 with SMTP id r2-20020a1709028bc200b0014d6d13a389mr11944727plo.2.1646658521277;
        Mon, 07 Mar 2022 05:08:41 -0800 (PST)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id x9-20020aa79409000000b004f704d33ca0sm3258528pfo.136.2022.03.07.05.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 05:08:41 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 1/4] mm: hugetlb: disable freeing vmemmap pages when struct page crosses page boundaries
Date:   Mon,  7 Mar 2022 21:07:05 +0800
Message-Id: <20220307130708.58771-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220307130708.58771-1-songmuchun@bytedance.com>
References: <20220307130708.58771-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If the size of "struct page" is not the power of two and this
feature is enabled, then the vmemmap pages of HugeTLB will be
corrupted after remapping (panic is about to happen in theory).
But this only exists when !CONFIG_MEMCG && !CONFIG_SLUB on
x86_64.  However, it is not a conventional configuration nowadays.
So it is not a real word issue, just the result of a code review.
But we cannot prevent anyone from configuring that combined
configure.  This feature should be disable in this case to fix
this issue.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb_vmemmap.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index b3118dba0518..49bc7f845438 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -121,6 +121,18 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	if (!hugetlb_free_vmemmap_enabled())
 		return;
 
+	if (IS_ENABLED(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON) &&
+	    !is_power_of_2(sizeof(struct page))) {
+		/*
+		 * The hugetlb_free_vmemmap_enabled_key can be enabled when
+		 * CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON. It should
+		 * be disabled if "struct page" crosses page boundaries.
+		 */
+		pr_warn_once("cannot free vmemmap pages because \"struct page\" crosses page boundaries\n");
+		static_branch_disable(&hugetlb_free_vmemmap_enabled_key);
+		return;
+	}
+
 	vmemmap_pages = (nr_pages * sizeof(struct page)) >> PAGE_SHIFT;
 	/*
 	 * The head page is not to be freed to buddy allocator, the other tail
-- 
2.11.0

