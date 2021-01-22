Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09816C433DB
	for <linux-doc@archiver.kernel.org>; Fri, 22 Jan 2021 03:43:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE7BB23899
	for <linux-doc@archiver.kernel.org>; Fri, 22 Jan 2021 03:43:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbhAVDn5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 22:43:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726798AbhAVDjh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jan 2021 22:39:37 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD20C061223
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 19:38:07 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id z9so3240960qtv.6
        for <linux-doc@vger.kernel.org>; Thu, 21 Jan 2021 19:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=z/iYHqVeCyWybAIwBASO/JRh5H6y4Wucaqn9XTIErdQ=;
        b=oESNTGgVdyEaOuywKNSv4UZ4Fqr105szHy3fzQiAUMaaw+zvBvKum3SLUrozslMU9M
         cAj+Ot1b/fFJ8nFeIzsLld2IUjs+OTiOfx8u3eHda1Vjhp0x+S4w7x9pOqlMGyA8KW0z
         XxG4jvNaMCjVxJA2aHMEg2/KHoMeZHoGL8KR1dAK/O0PPxZPfkF2U/KJO99lhEw2rmab
         34RJTNAL+1bV9CrzKRnFYZxRuyuWWQCihPpsvfgQ+CH5H9xVCjYfjged5wCJs+40uZ8k
         VKHY+mG3d1LIApnSmHDVkphe6/BK/AJGyfeLG1oekroFXhDv9+yhuZTIaPVuxk/J7p1d
         i3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z/iYHqVeCyWybAIwBASO/JRh5H6y4Wucaqn9XTIErdQ=;
        b=QayWhTFD5XYbep6dE99MmVBvnG1cS2RKCgmxmaUcjhjpeoji84YSLnAlFiMUzyWaqD
         55RkCSKo+GrrJu7wZb1tuSZnjteCNgd5WQ0GsAioljR6yWHGdeEcHY7l2ofSZzU1HQ1f
         sBJt8VOa2SpebPcEQXvGm3da3Nus1u6FzJDUGnMw+ukxcu3twBP1f9oCaPHR3ox2SWG1
         XOekoRxBEF0fLuUl6VRsbB+F1GHJCGpgXNIJlwdycolRu0wcroM6kNmk3TOpphoxILM1
         P2Vr0Oa4A6wwB2fjmp9GLvTSzZsI+XofUWI5iEWc4DPBK1U41rE21Bqba0Wj0fVwS8Po
         JOEw==
X-Gm-Message-State: AOAM531SsPZzq+LEDMhm7XhSPqDmCougcqkxpBFXxeAuJFLdGNoSy/GC
        y+VwVrl8R19Asgyto+NF9Jc+eA==
X-Google-Smtp-Source: ABdhPJxB8QpjUpktMAJ0m18/G6Q1XfGvgXeD5f015WLHjIZOzXXTX5cTmWMprMh6urdwdAieXCCMwA==
X-Received: by 2002:aed:3165:: with SMTP id 92mr2752407qtg.388.1611286687049;
        Thu, 21 Jan 2021 19:38:07 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id m85sm5426529qke.33.2021.01.21.19.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 19:38:06 -0800 (PST)
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
Subject: [PATCH v7 10/14] memory-hotplug.rst: add a note about ZONE_MOVABLE and page pinning
Date:   Thu, 21 Jan 2021 22:37:44 -0500
Message-Id: <20210122033748.924330-11-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122033748.924330-1-pasha.tatashin@soleen.com>
References: <20210122033748.924330-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document the special handling of page pinning when ZONE_MOVABLE present.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: Michal Hocko <mhocko@suse.com>
---
 Documentation/admin-guide/mm/memory-hotplug.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
index 5c4432c96c4b..c6618f99f765 100644
--- a/Documentation/admin-guide/mm/memory-hotplug.rst
+++ b/Documentation/admin-guide/mm/memory-hotplug.rst
@@ -357,6 +357,15 @@ creates ZONE_MOVABLE as following.
    Unfortunately, there is no information to show which memory block belongs
    to ZONE_MOVABLE. This is TBD.
 
+.. note::
+   Techniques that rely on long-term pinnings of memory (especially, RDMA and
+   vfio) are fundamentally problematic with ZONE_MOVABLE and, therefore, memory
+   hot remove. Pinned pages cannot reside on ZONE_MOVABLE, to guarantee that
+   memory can still get hot removed - be aware that pinning can fail even if
+   there is plenty of free memory in ZONE_MOVABLE. In addition, using
+   ZONE_MOVABLE might make page pinning more expensive, because pages have to be
+   migrated off that zone first.
+
 .. _memory_hotplug_how_to_offline_memory:
 
 How to offline memory
-- 
2.25.1

