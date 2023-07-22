Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1163C001DC
	for <linux-doc@archiver.kernel.org>; Sat, 22 Jul 2023 23:15:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjGVXPW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 22 Jul 2023 19:15:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjGVXPU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 22 Jul 2023 19:15:20 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910BB1705
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 16:15:17 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-76571dae5feso291819085a.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Jul 2023 16:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1690067716; x=1690672516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jqX+omN+4AV/jEW9gJWFZdBmlFQeDD8EFviSI3KwL+8=;
        b=h4VGOvKMgez+/NKOawppSiHt7934PF71iQ7qv8jvSgyoGVHQdeSp1JgcRIsn2D88hx
         g2qwPAuZJScjWF75Ou+qLGKjKOMoBD6KgtLtf0HDYfqszmZ+yCoggVBesEXvtWMjVL8g
         JpUjuA4gJbUNFr73GuH0FlWZrgf5yI6+x2LMQdtPiA8g0Av/6cdf1+CYfjPWtybKpcP9
         eVd7uPFytoOlTw5R5xKtG9M76QYaPDi/SS5XihMN3binOTlJbuopN24pguAFSUKmGTZV
         KDBH4hbi0ALobtUZ6mlYQTvapei1p+n2u+rufzxhHrLS/TA6KLItQHUFRHlM6LpiyDgq
         m73w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690067716; x=1690672516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqX+omN+4AV/jEW9gJWFZdBmlFQeDD8EFviSI3KwL+8=;
        b=lmBvxenOKHzAVW9RRJUqH2mQIUi+IZUsRqg4UuS1xU5Z1CufUJguTbfzMViUFaP0s0
         S6oTaVXgoOFL44OWuRJ5GkkIolYFqGT9M47teurWf5G7qWGahFP2UoU6kWak5/8bBnDv
         bcTMDJ3M9f77bX4EzjVZ9/npxBlgmCUeRkZTU+ccts1pKSkDoScCKP4tv/I/h5u8QM1b
         IvlwXgnmNayaMRM7b3PHy8iDCm1z22vJDOj6TyChB5x2XKg/UNr6907AkVF2oIj9WaWk
         oBvs5DBQgngmOCHMotCE+axx2Cwv72WPL9WjyXD23mcWA3mdSTfg628yTEFZKPZvF0m1
         1xAQ==
X-Gm-Message-State: ABy/qLbvuL0fYn4N9mImW2wqFDSCBj/IoO95BtMgkWr93xxCxx72NiPy
        Rll3RAjk7EdSstqMXQtA1js/VA==
X-Google-Smtp-Source: APBJJlFbRKGfdxJ0JTND8bD4QwfCFUoHWRvornko1ZnN1WHJ1NJtPHQPbc8oka0cm1metbm5E4tqEg==
X-Received: by 2002:a05:620a:2807:b0:75b:23a0:e7e9 with SMTP id f7-20020a05620a280700b0075b23a0e7e9mr4800481qkp.74.1690067716634;
        Sat, 22 Jul 2023 16:15:16 -0700 (PDT)
Received: from soleen.c.googlers.com.com (193.132.150.34.bc.googleusercontent.com. [34.150.132.193])
        by smtp.gmail.com with ESMTPSA id u21-20020ae9c015000000b007675c4b530fsm2075957qkk.28.2023.07.22.16.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 16:15:16 -0700 (PDT)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, akpm@linux-foundation.org,
        corbet@lwn.net, linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, rick.p.edgecombe@intel.com
Subject: [PATCH v2 3/3] mm/page_table_check: Check writable zero page in page table check
Date:   Sat, 22 Jul 2023 23:15:08 +0000
Message-ID: <20230722231508.1030269-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230722231508.1030269-1-pasha.tatashin@soleen.com>
References: <20230722231508.1030269-1-pasha.tatashin@soleen.com>
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
index ad4447e999f8..db1ed36f7203 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -114,6 +114,8 @@ static void page_table_check_set(struct mm_struct *mm, unsigned long addr,
 	if (!pfn_valid(pfn))
 		return;
 
+	PAGE_TABLE_CHECK_WARN(is_zero_pfn(pfn) && rw);
+
 	page = pfn_to_page(pfn);
 	page_ext = page_ext_get(page);
 
-- 
2.41.0.487.g6d72f3e995-goog

