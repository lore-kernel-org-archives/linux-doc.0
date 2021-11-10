Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8D1C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 10:55:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDF9B6112D
	for <linux-doc@archiver.kernel.org>; Wed, 10 Nov 2021 10:55:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbhKJK6p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Nov 2021 05:58:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbhKJK6h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Nov 2021 05:58:37 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB12DC061764
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 02:55:49 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id g18so2326527pfk.5
        for <linux-doc@vger.kernel.org>; Wed, 10 Nov 2021 02:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IGTjS9X6O5MHDP8mauZ+DA3PMqh0e9FVGxEeR+4xDgM=;
        b=4E9Pf+Ux5qiQPyaFELQIdPxWMnKZJis8IWSE3myEyTQTg/ZtXTEmfRj3+xgUYIKqib
         Amlin7VFQFJ9UH4YWXcbd66LmFZ/Q9HAZ5JznNQb+3eNmtOtBwcniA9rtqgofz2RADaL
         3Oevl51wrxppp12TRgvXM83uKsKWlYYvY8hlOln+RIeSnCMzVcMIHjohuG1S/zRLiFAv
         ifCPerwpG9LO3xn1O7DQl4FAghQmnMGyHsvN7iFTnEDcx0kk+rI4Joggpghut/u+jQr3
         dtHkRy2LcimFnQELgVdilPLogAAqcEJ82I/jvSP8xHasm/HtgQ4udpeHg91Uubpsow6a
         RufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IGTjS9X6O5MHDP8mauZ+DA3PMqh0e9FVGxEeR+4xDgM=;
        b=VlPF2Bg1kDV5zAi0HXcd50+stXU/lfMc8h9UHy2oNEW0WUeNrf/Fha7gS3dTx6NBjo
         v6n6UFihlsHmS2ZOItjsip2t9Q1gEY8dcS+FNTjKK79PVBQ9Ck71yv/IG99mFxJxzhmm
         xFjXfDTC6aSbWUtyFg4LmHZHuJKPnWNL2dde6sXCUi/RjNgb0WKrEhAyRnM0HGTkP3B3
         /ZcYy2yy/LnB3UOPEqU5fLOT6je5cFhcShoT0XahrzKE5G6O6f+DJYXwWte3Vep+lXJT
         TnrxjYIPKWnGZTLJSTgLNbiLVXkfUukhFyDnKkGZYVECXrEYbx3r/ROaVHJd/9TPDe9E
         jtJA==
X-Gm-Message-State: AOAM533DALr2T7Ec5bOl3kJBQD+hSgpoqjhjdMZu1DBdLmwfWoxU0m09
        Phb1/nxeCdgIC3pffwxClHazsSddwZJkgg==
X-Google-Smtp-Source: ABdhPJwO0teQCgkCbj+haMRjSvhHg6xl/7vC4w0DoEK+PZZxUK02oqNeIVry9l3a6VyPVJK+jwnH+g==
X-Received: by 2002:a62:16c7:0:b0:49f:a6cc:c77d with SMTP id 190-20020a6216c7000000b0049fa6ccc77dmr15313549pfw.23.1636541749492;
        Wed, 10 Nov 2021 02:55:49 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id v38sm5865829pgl.38.2021.11.10.02.55.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Nov 2021 02:55:49 -0800 (PST)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, jgg@nvidia.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 12/15] mm/pte_ref: update the pmd entry in move_normal_pmd()
Date:   Wed, 10 Nov 2021 18:54:25 +0800
Message-Id: <20211110105428.32458-13-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20211110105428.32458-1-zhengqi.arch@bytedance.com>
References: <20211110105428.32458-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The ->pmd member record the pmd entry that maps the user PTE page
table page. When the pmd entry changes, ->pmd needs to be updated
synchronously.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/mremap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/mremap.c b/mm/mremap.c
index 088a7a75cb4b..4661cdec79dc 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -278,6 +278,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	VM_BUG_ON(!pmd_none(*new_pmd));
 
 	pmd_populate(mm, new_pmd, pmd_pgtable(pmd));
+	pte_update_pmd(pmd, new_pmd);
 	flush_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
-- 
2.11.0

