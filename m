Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD9AEC43381
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 05:18:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9394D229C6
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 05:18:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733267AbhASEpW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 Jan 2021 23:45:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732915AbhASEmR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 Jan 2021 23:42:17 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D041C0617B0
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 20:39:39 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id j18so8587320qvu.3
        for <linux-doc@vger.kernel.org>; Mon, 18 Jan 2021 20:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=z/iYHqVeCyWybAIwBASO/JRh5H6y4Wucaqn9XTIErdQ=;
        b=ZzAEvUNsgm1gA/BtAGDww/ogGjjSgj1kDd613YzbM+YqhjB9Pm0Bnu+sVa84HgcfH9
         d9dFvXQUB9iDOJ/KZ399mPlbIcgiuc7vWLsQkp6289MXPOfYuuIxKVB7pC9ksqAYZEZe
         VHJOGBBUYn8hQ6PXGRXG73CrtaC66uYplcvxFE/pdoCVeg9FjOlJmv+ly8nTlfX/BqUE
         WeDBMlAG2f4CKhxvhm8/maPGZ6Wgmtd20Q6uoAv/arIKIriZGzM49D/YJ/bK79FPMAps
         TCtqulcq7dAP54Te25gabmp7YQpFkP8ipaMEsDALpfV2a99C+f1WA8wzTSVL3L/YzM23
         61hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z/iYHqVeCyWybAIwBASO/JRh5H6y4Wucaqn9XTIErdQ=;
        b=p4pte9XiANkE7JVpL2rKQN21ZleEHq4HI35voMik2trheMxAjq7yEJLUklEuOwgCJG
         TI2e6zQ0fBQrlm83p7RWjS9rqJyh+gUfBp2c+Floq5uIE5SjSsqIyonWWbW5ibfwWEJj
         jnjLMxgI0e/50Q9qco1slO3jP53lUksjFqrSYyxbBXo7GFWOva5exaAvZTmTUC71sJlM
         90+kDy/qwPfUMVV9ZicRjdzPM8hWMXrjhUVOBMl0lz8KRJqQpstB8Pfl+4+bYffMmLir
         4klklz6gPSLQovJ8miRX+hMkmajtccqa93P7qWmiTLMDTEWsbFEu26GR70cRCcAqxptL
         4FVQ==
X-Gm-Message-State: AOAM533LZIIjTr8pLfD/tPKUSqQxoWul/ONQluNE0uZt+AWua4HG4sNj
        6RHuX0lCkrjMMau+uflU0VicDA==
X-Google-Smtp-Source: ABdhPJx3a4TDVVpQ3OtzgpKeD4fURR/7LsDvn4tqhZ4fXd18CTYySHhA2WdtdMDk2WAbkN8BxjxaMQ==
X-Received: by 2002:a0c:8027:: with SMTP id 36mr2871477qva.57.1611031178459;
        Mon, 18 Jan 2021 20:39:38 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id z20sm11934536qkz.37.2021.01.18.20.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 20:39:37 -0800 (PST)
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
Subject: [PATCH v5 10/14] memory-hotplug.rst: add a note about ZONE_MOVABLE and page pinning
Date:   Mon, 18 Jan 2021 23:39:16 -0500
Message-Id: <20210119043920.155044-11-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119043920.155044-1-pasha.tatashin@soleen.com>
References: <20210119043920.155044-1-pasha.tatashin@soleen.com>
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

