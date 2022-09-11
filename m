Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EACFC6FA89
	for <linux-doc@archiver.kernel.org>; Sun, 11 Sep 2022 09:59:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229976AbiIKJ7m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 11 Sep 2022 05:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229978AbiIKJ7i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Sep 2022 05:59:38 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65823114F
        for <linux-doc@vger.kernel.org>; Sun, 11 Sep 2022 02:59:30 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id c11so4322823qtw.8
        for <linux-doc@vger.kernel.org>; Sun, 11 Sep 2022 02:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=OPh2SoeDJ39bM1Jn5fFI8VsUd8dRA2153uVq4iTm5YA=;
        b=Cm/iwBj9qSxR6hNh4WkGnlY2rIhzISZ52M2GqSDfU7xNlfLTD1kDBK3GW4JyIWLpbF
         vFCNPAJLgXJtsglJR9PAeKY44F6cjvaw6tuS4MXxA20nHmxmD/wqzebHgdbHMGmAD61N
         ZV4Tr5DVsNuioBerAQQDoJ4+a5mniKGiZRxoUQiZlNMllJ4sclh03nAFz08cVB8ODhMT
         Skx+FX/f8czauTMll515ktdu7gVSZJA1f7251v/yIj0BzYslEFQQtKX5F2MkHK/8CwmU
         Hx7spxOmVfuUwec09wkdbVsfFyOD1wVjfc69FUWeWsnCvU5bgK+iVzVBPk9GSB7Lao7h
         VxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=OPh2SoeDJ39bM1Jn5fFI8VsUd8dRA2153uVq4iTm5YA=;
        b=cAdUxXgI370Qi0dxTykTOgyb7Gpfjfl8UwzWqz+AUfvjgm/mt5uqbCZ2hT5ZCG3Qvd
         77smBDZOgqLH/ZHycEsZ2NRTQZ7E5n9Mx06LdewHWDw+Zw9CzZodU7kK1F6s8rWNJYKO
         hsRW+NkZ0dtGW5Ry7ag4hfASRRhQi8rGqsuSW+IMf18Cb1MGoEjQm6g26XSSQtum0Wid
         wa+Nvi/uMpjqWBKkZlK9KTqndXNrDKUZo0VZUPp2Z2/vZaYhi99kYw7HsCUBCFtzBWOW
         PzTQQFlzSnkeA4lAGxyQewoXJWlR3MbgnTytxK3i7rLezuSzxIucCQGzkoxoOzaxyoKt
         3D8w==
X-Gm-Message-State: ACgBeo3MDbw20NpWn2BJiJRKVA8XZhMxPCvpoYiIPVuxuTUzLShnrS4D
        xtwvIJ4JWywgbG+Svfwtlfdt+PsjriLNpzi4Sq0UyA==
X-Google-Smtp-Source: AA6agR5J3Cn9HvOjdYaL72tcgWTBN3wcKIFFTOLz4o2e2o7b+hMrlixH3K7CPiJSXhwkuBn1HYdkSA==
X-Received: by 2002:a05:622a:609:b0:35b:acd0:21ff with SMTP id z9-20020a05622a060900b0035bacd021ffmr3764909qta.321.1662890369441;
        Sun, 11 Sep 2022 02:59:29 -0700 (PDT)
Received: from soleen.c.googlers.com.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id y29-20020a37f61d000000b006cbd60c14c9sm4625233qkj.35.2022.09.11.02.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 02:59:28 -0700 (PDT)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, akpm@linux-foundation.org,
        corbet@lwn.net, linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, rick.p.edgecombe@intel.com
Subject: [PATCH 1/3] mm/page_table_check: Check writable zero page in page table check
Date:   Sun, 11 Sep 2022 09:59:21 +0000
Message-Id: <20220911095923.3614387-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220911095923.3614387-1-pasha.tatashin@soleen.com>
References: <20220911095923.3614387-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Rick Edgecombe <rick.p.edgecombe@intel.com>

The zero page should remain all zero, so that it can be mapped as
read-only for read faults of memory that should be zeroed. If it is ever
mapped writable to userspace, it could become non-zero and so other apps
would unexpectedly get non-zero data. So the zero page should never be
mapped writable to userspace. Check for this condition in
page_table_check_set().

Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/page_table_check.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index e2062748791a..665ece0d55d4 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -102,6 +102,8 @@ static void page_table_check_set(struct mm_struct *mm, unsigned long addr,
 	if (!pfn_valid(pfn))
 		return;
 
+	BUG_ON(is_zero_pfn(pfn) && rw);
+
 	page = pfn_to_page(pfn);
 	page_ext = lookup_page_ext(page);
 	anon = PageAnon(page);
-- 
2.37.2.789.g6183377224-goog

