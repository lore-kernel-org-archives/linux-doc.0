Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDA8C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 29 Apr 2022 13:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349499AbiD2Njp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Apr 2022 09:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347966AbiD2Njk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Apr 2022 09:39:40 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A817CABAC
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 06:36:22 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id cx11-20020a17090afd8b00b001d9fe5965b3so8604246pjb.3
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 06:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=L6JfYichFyXFsf3r/4znwUIKw3e8Xt3i1DYSf+5mskE=;
        b=uiu5RLuEB7qSCoidGIQkJZQf2tXs/EuKorStHUYGrE3Q5/xwMjpvGCmRYxjgJA6Ctu
         75nC7BuohPGVHhHiVloQeiByLs8cb+N0Ed8rJ3utK+A6gQToV+GujF6l5qKhJ6c7EtGn
         NGGslCeqHkUhC439mUKObKU0nONs9Y2XDO0mRRIdYkuP+YXoGmTiT18RjaEEpxX9bPsh
         AAQJ8XZb1PV/10ty6IAIC9mYDPdZ84ojotFDfykLySr4Rl5A0JazS0rcCBaq64jgtFXH
         n+rOZQhRPeLRzNBkYnF0c08yntciuvNCXpZK09/v/tg0M7w22eVyLTCmchLVjWICGks9
         yfeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L6JfYichFyXFsf3r/4znwUIKw3e8Xt3i1DYSf+5mskE=;
        b=hjR3+e/sCbnLH8LhanGFA/A1a6Y4rnfpkcU26WkudgRlF0GRJqD1s7fxncm8y4Pu6x
         GultzPHNiW6mWXpBSj2u8hHaeJSJj3ufA7hVp0bwDB4amWg2Uc14X0ndJoLprUFP8fZX
         TI1jVDQ3eSXKCkUKPFtebYu4EVEQLi7m7xgQ04IiDytS4e+j8pZYtkj27Iu7MuT4CsG1
         QEGbSbVNNUabJSHGNGxzfKJCjE/+d8ib0nAddNI2sTy9rVm8XDl8KdaUeaLD4KY1nJC7
         G+DvLkpGTVYmehzqWV1VmwDOMmz7ocLOgueKyApERuRQ6IzibLfvYVJ3WNMziPVR6UW6
         WaYA==
X-Gm-Message-State: AOAM5326I/B+Jvxfgseju59TipFLzBxvvUHiNg56GC5TK4fkkXoK3W0e
        HSIF3243B8NFp7DU8p0TG+5Spw==
X-Google-Smtp-Source: ABdhPJx+W1PxtRy+jGpbbBvOatDdA/DNvTfTbEwQM2M30hTFb7Isln+pU5bpMFj6BaOrsgTZDYJFuQ==
X-Received: by 2002:a17:902:ed89:b0:15a:d3e:ada6 with SMTP id e9-20020a170902ed8900b0015a0d3eada6mr39276616plj.94.1651239381708;
        Fri, 29 Apr 2022 06:36:21 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090a414800b001d81a30c437sm10681977pjg.50.2022.04.29.06.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 06:36:21 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, jgg@nvidia.com, tj@kernel.org, dennis@kernel.org,
        ming.lei@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [RFC PATCH 01/18] x86/mm/encrypt: add the missing pte_unmap() call
Date:   Fri, 29 Apr 2022 21:35:35 +0800
Message-Id: <20220429133552.33768-2-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20220429133552.33768-1-zhengqi.arch@bytedance.com>
References: <20220429133552.33768-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The paired pte_unmap() call is missing before the sme_populate_pgd()
returns. Although this code only runs under the CONFIG_X86_64, for
the correctness of the code semantics, it is necessary to add a
paired pte_unmap() call.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/mm/mem_encrypt_identity.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index b43bc24d2bb6..6d323230320a 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -190,6 +190,7 @@ static void __init sme_populate_pgd(struct sme_populate_pgd_data *ppd)
 	pte = pte_offset_map(pmd, ppd->vaddr);
 	if (pte_none(*pte))
 		set_pte(pte, __pte(ppd->paddr | ppd->pte_flags));
+	pte_unmap(pte);
 }
 
 static void __init __sme_map_range_pmd(struct sme_populate_pgd_data *ppd)
-- 
2.20.1

