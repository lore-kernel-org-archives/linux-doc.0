Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7ADDC4361B
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 00:45:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A76F2312E
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 00:45:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730201AbgLJAos (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 19:44:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730169AbgLJAol (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 19:44:41 -0500
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D818C0619D5
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 16:43:52 -0800 (PST)
Received: by mail-qt1-x843.google.com with SMTP id a6so2495769qtw.6
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 16:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UPZkOOUAvu9r4fFw8TJVvFyTq3W2R2uLYiLCZknh/L8=;
        b=gmG1PpUsZr319a18DQnsi5mdG9y7b4t3RB3P2dechoWxY0Pqz2thym4xN5wIfRn1Q4
         Zw9W5/aK+5TRDcVJVOMsS3Z7f6GudDVH/eYCeIsLxu2o7Nz/4p5Jq2Xwp9inOrxmnVbj
         TZ5uXsD53+Jo8U+FDbuIB2tFD7HRqp6p1YLX1q9RSiMRN5Ve4xVGdG1V1CVxDuWmvHAD
         DKVaKsSrifnIeiLiCFQ/h9cVe692qD+IpTCv1Op5j3vHfvwaFgL79HDGLo7U9H3XQBGe
         Jyv8Gp8SjDOE/7SKS3q5y5zA06EMAGJWPiX/hVHPL34ak1030j7gSBQyY5EfC3ZrlbfP
         8M2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UPZkOOUAvu9r4fFw8TJVvFyTq3W2R2uLYiLCZknh/L8=;
        b=kN3L1gSIGs7v3Q+Wj/WLiOwO3j1GQxSzEbho6NnD7HwnSjo6geIfYxLbgnzMr6MZdt
         KCOoCzfEaE/IP62IyY1z/dOgmHq6FSm9l8jpFlZkW/4spsK21gk+cSMFsp+mu5laHck3
         RO0kdGThWRcP6cE3nbdB/rI4LMk/v1zGQrLrvFwOAuZe5voLmL5TTfo4j/ChrXDIEIma
         aFNdHj9jNePX3ZtHH2WJuelguiMUc+LIA7R2ql3wxlAEIgsn+aFlpxQNP9DRpTZ/SzQB
         btS801LuERZQqTcnnYlO8RLE6pX3EG1wNK/dv0l3sw0JPci+mRg9Z0Z4jSCa+IJ9xRe/
         VDMQ==
X-Gm-Message-State: AOAM531FrC+AJMPejniagq4iCF5i264PKsjs4mJBp7ufOye4cuLwmjP7
        F+NwJvJFGjT9va4FYV1Evqs3hQ==
X-Google-Smtp-Source: ABdhPJyi0mwWQZy/L/JfYf+2tJkJILrpi7wkAfm++gQ2t5NF/5F1UStDpyKxp6YmK/amRq2h1MKphA==
X-Received: by 2002:ac8:7244:: with SMTP id l4mr5870164qtp.203.1607561031637;
        Wed, 09 Dec 2020 16:43:51 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id y1sm2538745qky.63.2020.12.09.16.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 16:43:51 -0800 (PST)
From:   Pavel Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, akpm@linux-foundation.org, vbabka@suse.cz,
        mhocko@suse.com, david@redhat.com, osalvador@suse.de,
        dan.j.williams@intel.com, sashal@kernel.org,
        tyhicks@linux.microsoft.com, iamjoonsoo.kim@lge.com,
        mike.kravetz@oracle.com, rostedt@goodmis.org, mingo@redhat.com,
        jgg@ziepe.ca, peterz@infradead.org, mgorman@suse.de,
        willy@infradead.org, rientjes@google.com, jhubbard@nvidia.com,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 8/8] memory-hotplug.rst: add a note about ZONE_MOVABLE and page pinning
Date:   Wed,  9 Dec 2020 19:43:35 -0500
Message-Id: <20201210004335.64634-9-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210004335.64634-1-pasha.tatashin@soleen.com>
References: <20201210004335.64634-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Document the special handling of page pinning when ZONE_MOVABLE present.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Suggested-by: David Hildenbrand <david@redhat.com>
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

