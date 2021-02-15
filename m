Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9912CC43381
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 16:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A72564DEE
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 16:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231703AbhBOQVN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 11:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232641AbhBOQS2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Feb 2021 11:18:28 -0500
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95C5FC061A2E
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 08:14:09 -0800 (PST)
Received: by mail-qk1-x730.google.com with SMTP id v206so6840854qkb.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 08:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vUuAAALAJI+fG2870accHSSNYQyYhwy7cx5c7d7E6Y4=;
        b=PdbEFtYoJ7fLCoJclskCNrywQzZFn7Ehke/MEjfGzebydpPcze/MbHTovjhEJ3Gxwz
         lU//OV8u/i/u5TFvO6g54OIG15qqYb3eLSH/9sD+SE4p5e7ib0AE1MXIEVuj6QOppUqK
         5wgQZOykjgGcg4HGOhAcTdS5+DdkmYNK0JMovhC+Rr2BW6px4HxAjAQclgTlx++aXrRg
         dORz3YdX21yrIDCMgbEttpCZ3oMi4PgsrkUQjLGE0Iefwqi27AtMcIHKJDoOwHXlk/HJ
         At1ADH74dBa2oeIzVAN8ePzthxpfhxXOMUbN95jy/B1U2QBL/hOLhTs7JWZ+tePxvsM1
         kVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vUuAAALAJI+fG2870accHSSNYQyYhwy7cx5c7d7E6Y4=;
        b=ZgiamWCBokXnan9Yxr5tF1l4x37i4U6MGj6LHhaLywYwuYbZpMDN2/Ytej/xezXoPm
         Q2t/qAA/mVn8ymOj778696vpBuS/hJeCncX/D+SyzWeMkSgDIltvJbuoGo8BLnmLGtAQ
         Ujdk16AHfb9rfm0NqUUDhz5r8QBDHPshrGFyHsudkMBxYh0IInIfkH1sFYnpErYsirr7
         xu9YF3iYXm95loRwpj+8oChZBFM2A6TvypsyGpCFt57kkzSjgR9t7Qt1MgoIkdH1rNoO
         IYWbKVTYy3P/7hLQJ6HArP/e00d7czSX9SU1de2mhO6x21tdxYvmCOblPhogCo1eQrIx
         R10w==
X-Gm-Message-State: AOAM532hbMlUdixTdwWeBtvwdBO2xLLEhEd49YWYfKJm+7HOUxEwZkPF
        Kkpl/mETT3pnuGTKCvEe+ZFsqg==
X-Google-Smtp-Source: ABdhPJxSYuHk8rlO/e3c8oYUvO2n9UzI0eM2ykQ1xa7yO+vQpCjOgaDKiXLGr3gxZJzO/JFgBjQdFQ==
X-Received: by 2002:a37:9b0c:: with SMTP id d12mr15164482qke.215.1613405648876;
        Mon, 15 Feb 2021 08:14:08 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id u7sm10909213qta.75.2021.02.15.08.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 08:14:08 -0800 (PST)
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
        linux-kselftest@vger.kernel.org, jmorris@namei.org
Subject: [PATCH v11 11/14] mm/gup: change index type to long as it counts pages
Date:   Mon, 15 Feb 2021 11:13:46 -0500
Message-Id: <20210215161349.246722-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210215161349.246722-1-pasha.tatashin@soleen.com>
References: <20210215161349.246722-1-pasha.tatashin@soleen.com>
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
index da6d370fe551..fab20b934030 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -1472,7 +1472,7 @@ static long __get_user_pages_locked(struct mm_struct *mm, unsigned long start,
 {
 	struct vm_area_struct *vma;
 	unsigned long vm_flags;
-	int i;
+	long i;
 
 	/* calculate required read or write permissions.
 	 * If FOLL_FORCE is set, we only require the "MAY" flags.
-- 
2.25.1

