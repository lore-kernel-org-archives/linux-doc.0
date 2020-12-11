Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26D1C4361B
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:25:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7C112409B
	for <linux-doc@archiver.kernel.org>; Fri, 11 Dec 2020 21:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgLKUWk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Dec 2020 15:22:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387432AbgLKUWY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Dec 2020 15:22:24 -0500
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC295C0613CF
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:21:43 -0800 (PST)
Received: by mail-qk1-x743.google.com with SMTP id h4so4830992qkk.4
        for <linux-doc@vger.kernel.org>; Fri, 11 Dec 2020 12:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wM4+TgIt1qy5AvzR8HLrxu1ifc40asavzOXqjbFYbkc=;
        b=a+HUIRjFLUUSLUo/2eD3kC7hFtY5Bysj1lxaE1P9nNU7WySBlKU6F5bM6LJ092gq47
         32bs1F3kv6sENBJYz15baCNRpolOJxZvPHEJFpI5vqiHQ7boZvH/QxxbcGx8/5WXzDz+
         CfO9VZqtWSEqbdEHcdWejcBmlSokyaY/IyUMCYOvFkWyZ5hR4EfdFAP0zPPvwo76pjh/
         oON8wnJjKT/DpkN6h+rcKfHpKMawPW4oUxsf4C/lBgdRQGCq58R+R0SEtTxEHtUCqsj4
         R0t5mgFcsorQ4fE7e0CjM6fzZyduhmhQIdahWZEotEDkLhsGmTqbDCklsrAAY9cEQt9l
         JfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wM4+TgIt1qy5AvzR8HLrxu1ifc40asavzOXqjbFYbkc=;
        b=pqQYtO0e1L5dxTIEKXwwn4ok479N69hER6MkunwktCY5vLjANa/azvFbL194q5ZWvD
         owrH6cNfJ2/niFG8FpYjexiALkNL9Ddvck5ONyYOF6ZuHDWW/iCYzhrhua7X3AryTpUk
         CkzU0A3yvXIpQVnfOOccOJ9bcwT6zIYKUqVBxqFH3LgIE5cluYoAF1Yql0KD/8+g3zHi
         E13cOUpb3ExZ2Riu2sA8hC5RF2ntdbVkFk0LW2yGWfdBJhgkHb4TFVyaOThCujUzgqw3
         6JQDSWE5dhz4Fhv6tuFaSHV8OZpDk4UR79da77W/s0h8jfqT9rVSSWamFIf1lxcnEuM1
         aWow==
X-Gm-Message-State: AOAM533Y1l5VL2J/RWZFrkIVgE9maZv6QdHr1gsMeVGqyoPXCWpgQUwP
        oIsKAJgjNHi+qqK6v8alcOgO1g==
X-Google-Smtp-Source: ABdhPJzzCzj6oHF3QRqCvSpSB6dKhWo2UctCD2kOxs9Qj/VWokauP0nHxQ0nsHRcKAhVoBwKFfrazw==
X-Received: by 2002:a37:6c03:: with SMTP id h3mr18224198qkc.219.1607718102987;
        Fri, 11 Dec 2020 12:21:42 -0800 (PST)
Received: from localhost.localdomain (c-73-69-118-222.hsd1.nh.comcast.net. [73.69.118.222])
        by smtp.gmail.com with ESMTPSA id y192sm8514455qkb.12.2020.12.11.12.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Dec 2020 12:21:42 -0800 (PST)
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
Subject: [PATCH v3 0/6] prohibit pinning pages in ZONE_MOVABLE
Date:   Fri, 11 Dec 2020 15:21:34 -0500
Message-Id: <20201211202140.396852-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changelog
---------
v3
- Merged with linux-next, which contains clean-up patch from Jason,
  therefore this series is reduced by two patches which did the same
  thing.
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
v2
https://lore.kernel.org/lkml/20201210004335.64634-1-pasha.tatashin@soleen.com

Pavel Tatashin (6):
  mm/gup: don't pin migrated cma pages in movable zone
  mm cma: rename PF_MEMALLOC_NOCMA to PF_MEMALLOC_PIN
  mm: apply per-task gfp constraints in fast path
  mm: honor PF_MEMALLOC_PIN for all movable pages
  mm/gup: migrate pinned pages out of movable zone
  memory-hotplug.rst: add a note about ZONE_MOVABLE and page pinning

 .../admin-guide/mm/memory-hotplug.rst         |  9 +++
 include/linux/migrate.h                       |  1 +
 include/linux/mm.h                            | 11 +++
 include/linux/mmzone.h                        | 11 ++-
 include/linux/sched.h                         |  2 +-
 include/linux/sched/mm.h                      | 27 +++----
 include/trace/events/migrate.h                |  3 +-
 mm/gup.c                                      | 72 ++++++++-----------
 mm/hugetlb.c                                  |  4 +-
 mm/page_alloc.c                               | 32 ++++-----
 mm/vmscan.c                                   | 10 +--
 11 files changed, 95 insertions(+), 87 deletions(-)

-- 
2.25.1

