Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4033AC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:26:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF9932409A
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:26:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393948AbgLKUXY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 15:23:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394331AbgLKUXF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 15:23:05 -0500
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C28AC061248
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:21:53 -0800 (PST)
Received: by mail-qv1-xf43.google.com with SMTP id p12so4797997qvj.13
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UPZkOOUAvu9r4fFw8TJVvFyTq3W2R2uLYiLCZknh/L8=;
        b=hVQRD1LlUsoJuOAc051CXjk2/dVUpiNlMuxbw4uUGEPOPZ3HmFNU0C98MsLBWna3fM
         p2zQdMiimm2nS4zvqoYJbPMy3rDxOJTx+XQe+y6m6d4mTjkKSUZjQirRZOm4isp54fjB
         X6CTaymXFF+7Ab3fjNVul9yMWMIr6kRN1WcvxhcDpRFriU2mnSogEiO/p7rHtb8o1e0Z
         L7tevjlfqdvtjcRWrrp6QhbaEbwsiOoN0WTHrj8A/pAGwo4Y1Q7ppmtkQ8u6+vB3antE
         r/eK9monwWuehW5yDmeo3LUI2/qDhI+A97EIyXjbpi78G47yubvPzdmnhSdSRYH6MhL7
         KBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UPZkOOUAvu9r4fFw8TJVvFyTq3W2R2uLYiLCZknh/L8=;
        b=ib1FQaGdYe/40a544g1I1ppw9tcjFXojoCthlVgQ2JsV7rFx8hLgCI130yzKRXdJhO
         Krlh2NAlNBkbHaPDITpowEvFSzqkGhNcNkHPCSKjwQBdPsd7EZ17Ou3Mc6mQqWe8CbZO
         z1yBj//oepeFc5kUCHeXfpnhhsCprZvIXQSLpiue6VB0JetF3RH93sf/yw7EeNJhPU57
         4xK2CoD4gM2ABipgdrYaVVokh6nK9DWnMp1hZBELTVthOYJ1qrfQPaQZCaHSIc68sxsZ
         RmWN/oQ8k7y53czLc+o3WiflYqVotIgqegy+UMTwFthMuubmecAL591jmufl5VAstF+8
         a7xg==
X-Gm-Message-State: AOAM53029ROLe46/V758+7qe4iHVwHvnKO8ieWoAbHptCDe3dpSd20bn
        1HdD4GBayclFK5ABsjrC3sb1kw==
X-Google-Smtp-Source: ABdhPJzzBA0IO1zEvNvTSi56jO8MgXCjXqx/kMRSbq6P0sQl3EDuH9tzpjNq07vwblX5aH/exG15Yg==
X-Received: by 2002:a0c:f005:: with SMTP id z5mr18789770qvk.9.1607718112802;
        Fri, 11 Dec 2020 12:21:52 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id y192sm8514455qkb.12.2020.12.11.12.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 12:21:52 -0800 (PST)
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
Subject: [PATCH v3 6/6] memory-hotplug.rst: add a note about ZONE_MOVABLE and page pinning
Date:   Fri, 11 Dec 2020 15:21:40 -0500
Message-Id: <20201211202140.396852-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201211202140.396852-1-pasha.tatashin@soleen.com>
References: <20201211202140.396852-1-pasha.tatashin@soleen.com>
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

