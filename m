Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EC9C433E9
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 01:46:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7479E224B1
	for <linux-doc@archiver.kernel.org>; Wed, 20 Jan 2021 01:46:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731289AbhATBqD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jan 2021 20:46:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731282AbhATBp4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Jan 2021 20:45:56 -0500
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7214DC0617BD
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:43:54 -0800 (PST)
Received: by mail-qt1-x82b.google.com with SMTP id d15so9845379qtw.12
        for <linux-doc@vger.kernel.org>; Tue, 19 Jan 2021 17:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BKUj/6ZsJWAx+ypUtR8qlYsn81/heEPy52GNTY6EKsg=;
        b=oDhucAFFl5fFLBbUP6N7kYGPCWSid4rOxZEuV/K3xSEXxC+4t38NIYKbPweeJkN8y5
         0GqeWh662ZXEMhO81KR9IWGunuueM9R+TVXGrAKGPQY3/OpzYHXKsc7+IsWTeXUJKmhW
         uCG28rVcS09zX6wS2pt3JMesiEscQKi02L5+KN1POzu7GF4y+nKX4qWMxy1R5xDNYUux
         XxfepHhMK2sKBzZ2a3Xe6hIlNRm677mF9W9S7S81+wMhl/djsa2IRYo+fPYOibYFCU5b
         5/0FVlix0iE3DR+ayWoKmNXjF1/tlD0e0i/LSC1K1Cn50CPVGOxvVf3iObZ7fjoxUtI1
         kw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BKUj/6ZsJWAx+ypUtR8qlYsn81/heEPy52GNTY6EKsg=;
        b=IOi6bAlxi2781oHPgx4DYPbfMJW+SLODUHF96pNX5K3pAsD2i+TI8p8Cy2SRDc+8dE
         C/xRKCn8P3dJRvigO8I1RCm6NnqoKeehcU7vMnR1lVtexObJ2c54ALkKpPHxWqtqSjhz
         p/9t1zw0UdJdtY3BZMF5v7V3mcO0C8Vz3I8sFtmzRICuq2LbS6Msui9SvjwIfuaX414O
         I/OGu+3tKRpnIeKTU+xZA1lvs6LtOUfXOUZBdKv7RQuVpolluH5P00lzhWvYVIMGzAgj
         oLpIovy3NI4FJcLWXxuPGzAJuJMGgZLAuTzGJ+a2faL2CCifXCnaULdy1ltuHApv5QQ7
         mAhg==
X-Gm-Message-State: AOAM5334wOAVzdUo/zwV6OixrEYE2BCvkWgl5r7l4yXv8ZfLVAt4pfY7
        s3JIPrrqpriO3zEI2XoYOpUfgA==
X-Google-Smtp-Source: ABdhPJwGbcj3jYzIBgMMxo+ssO/F9JFenmluHPBNAtzaOONj3R/BAwlfKcVGPIBE5qq3N+6LdmcxGQ==
X-Received: by 2002:aed:3aa8:: with SMTP id o37mr6814179qte.239.1611107033730;
        Tue, 19 Jan 2021 17:43:53 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id a9sm391871qkk.39.2021.01.19.17.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 17:43:53 -0800 (PST)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, vbabka@suse.cz,
        mhocko@suse.com, david@redhat.com, osalvador@suse.de,
        dan.j.williams@intel.com, sashal@kernel.org,
        tyhicks@linux.microsoft.com, iamjoonsoo.kim@lge.com,
        mike.kravetz@oracle.com, rostedt@goodmis.org, mingo@redhat.com,
        jgg@ziepe.ca, peterz@infradead.org, mgorman@suse.de,
        willy@infradead.org, rientjes@google.com, jhubbard@nvidia.com,
        linux-doc@vger.kernel.org, ira.weiny@intel.com,
        linux-kselftest@vger.kernel.org
Subject: [PATCH v6 11/14] mm/gup: change index type to long as it counts pages
Date:   Tue, 19 Jan 2021 20:43:30 -0500
Message-Id: <20210120014333.222547-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120014333.222547-1-pasha.tatashin@soleen.com>
References: <20210120014333.222547-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In __get_user_pages_locked() i counts number of pages which should be
long, as long is used in all other places to contain number of pages, and
32-bit becomes increasingly small for handling page count proportional
values.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Acked-by: Michal Hocko <mhocko@suse.com>
---
 mm/gup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index 668795e5a816..c7abd5b37150 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1479,7 +1479,7 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 {
 	struct vm_area_struct *vma;
 	unsigned long vm_flags;
-	int i;
+	long i;
 
 	/* calculate required read or write permissions.
 	 * If FOLL_FORCE is set, we only require the "MAY" flags.
-- 
2.25.1

