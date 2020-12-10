Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A4FC4361B
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 00:44:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A166D2313E
	for <linux-doc@archiver.kernel.org>; Thu, 10 Dec 2020 00:44:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730576AbgLJAoT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Dec 2020 19:44:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730540AbgLJAoT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Dec 2020 19:44:19 -0500
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com [IPv6:2607:f8b0:4864:20::f41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05DB3C06179C
        for <linux-doc@vger.kernel.org>; Wed,  9 Dec 2020 16:43:39 -0800 (PST)
Received: by mail-qv1-xf41.google.com with SMTP id q7so1616624qvt.12
        for <linux-doc@vger.kernel.org>; Wed, 09 Dec 2020 16:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NBmnA65Dz75B27b98byjwbuogn8Qshl/scokvzJzVpI=;
        b=E+nF8FQ/RA9XyaDQX43MC05Gtb0NiBNPBW1Rq4OXGK+IFHzYWJMil+SOGuW572guzW
         Yfmm50M/TAN18PSPsHc6DfmesiN6FfzLHaJM40j8gRzFon7t6OqL6tWYnhOpV9LIwupz
         +oM0MAiNOxaA6ZcM+hmMFQ2TIe9EusCcyDRFihn0ygcT+G0sLPAawGm9IdRWG+8Vy9nP
         HoIpKON7vjRN1xkZrkqwyAS3HCzHK4sr2N0TUphJtAFCLHsuIC6IK4dfO36CT3QpItC2
         9SdKvkPMAz5/xuhaPrQv/HkhnBG1ijSbq+vGsrOzYZfcK+DGSJczUy+WnOUByDjdvtZ1
         ajxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NBmnA65Dz75B27b98byjwbuogn8Qshl/scokvzJzVpI=;
        b=Vm6bHSiQw9j/2LH+1jJ6+bnMOJyXiPdy/Y9JYsfAcMJ+GeelKvl+nIXgIRuKr5Mz+Y
         pyRtkGKAGynMdJBJxM9MjruaMJJi1OwGMhCNIrPVuIXbH4klq/bcRa4t72zi6oLEmQCp
         46rqEZjEUTN0heUll1Boc24fGZmyEa2cv4SSx0vIv+rVh5dnPDc/eKojpP/wWxyCYfcu
         0epQXxahGqBMzTFAkj44veNbrzxLb6TSThOycyOGnYtUQABmUeIfMKMTdMZ2bu8p9Fzw
         kc71XrBFVpBXzSaB35cpGWiPQMQEmCZ7hwpB9MiW7BljWui3lQHFdSce4tms3qiAKaB/
         XXPg==
X-Gm-Message-State: AOAM530DB34eud0pnS7w1bez7IlfqmaqhPrsbvsX68i91VaCOE5870PM
        1uxvMpG1vBwA1VpxrfaoRKVGOw==
X-Google-Smtp-Source: ABdhPJz/zBIlkx56x4lbYGMtgVf5irIjM9A/U+Ya7JihigE6VRMEn96T/cXPJlBm6odQ49iXgyYoWQ==
X-Received: by 2002:a05:6214:a14:: with SMTP id dw20mr5985335qvb.43.1607561018186;
        Wed, 09 Dec 2020 16:43:38 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id y1sm2538745qky.63.2020.12.09.16.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Dec 2020 16:43:36 -0800 (PST)
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
Subject: [PATCH v2 0/8] prohibit pinning pages in ZONE_MOVABLE
Date:   Wed,  9 Dec 2020 19:43:27 -0500
Message-Id: <20201210004335.64634-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changelog
---------
v2
- Addressed all review comments
- Added Reviewed-by's.
- Renamed PF_MEMALLOC_NOMOVABLE to PF_MEMALLOC_PIN
- Added is_pinnable_page() to check if page can be longterm pinned
- Fixed gup fast path by checking is_in_pinnable_zone()
- rename cma_page_list to movable_page_list
- add a admin-guide note about handling pinned pages in ZONE_MOVABLE,
  updated caveat about pinned pages from linux/mmzone.h
- Move current_gfp_context() to fast-path

---------
When page is pinned it cannot be moved and its physical address stays
the same until pages is unpinned.

This is useful functionality to allows userland to implementation DMA
access. For example, it is used by vfio in vfio_pin_pages().

However, this functionality breaks memory hotplug/hotremove assumptions
that pages in ZONE_MOVABLE can always be migrated.

This patch series fixes this issue by forcing new allocations during
page pinning to omit ZONE_MOVABLE, and also to migrate any existing
pages from ZONE_MOVABLE during pinning.

It uses the same scheme logic that is currently used by CMA, and extends
the functionality for all allocations.

For more information read the discussion [1] about this problem.
[1] https://lore.kernel.org/lkml/CA+CK2bBffHBxjmb9jmSKacm0fJMinyt3Nhk8Nx6iudcQSj80_w@mail.gmail.com

Previous versions:
v1
https://lore.kernel.org/lkml/20201202052330.474592-1-pasha.tatashin@soleen.com

Pavel Tatashin (8):
  mm/gup: perform check_dax_vmas only when FS_DAX is enabled
  mm/gup: don't pin migrated cma pages in movable zone
  mm/gup: make __gup_longterm_locked common
  mm cma: rename PF_MEMALLOC_NOCMA to PF_MEMALLOC_PIN
  mm: apply per-task gfp constraints in fast path
  mm: honor PF_MEMALLOC_PIN for all movable pages
  mm/gup: migrate pinned pages out of movable zone
  memory-hotplug.rst: add a note about ZONE_MOVABLE and page pinning

 .../admin-guide/mm/memory-hotplug.rst         |  9 ++
 include/linux/migrate.h                       |  1 +
 include/linux/mm.h                            | 11 +++
 include/linux/mmzone.h                        | 11 ++-
 include/linux/sched.h                         |  2 +-
 include/linux/sched/mm.h                      | 27 ++----
 include/trace/events/migrate.h                |  3 +-
 mm/gup.c                                      | 91 ++++++++-----------
 mm/hugetlb.c                                  |  4 +-
 mm/page_alloc.c                               | 32 +++----
 mm/vmscan.c                                   | 10 +-
 11 files changed, 101 insertions(+), 100 deletions(-)

-- 
2.25.1

