Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D65A7C0015E
	for <linux-doc@archiver.kernel.org>; Fri,  7 Jul 2023 21:55:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbjGGVzr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 7 Jul 2023 17:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230491AbjGGVzq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 7 Jul 2023 17:55:46 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 825F21FF0
        for <linux-doc@vger.kernel.org>; Fri,  7 Jul 2023 14:55:44 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-573d70da2afso24840387b3.2
        for <linux-doc@vger.kernel.org>; Fri, 07 Jul 2023 14:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688766944; x=1691358944;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dxkJHri43fmKt8R5z8YjbywDBegP4t1apGGC2ZsbmRA=;
        b=b6Gg/x1XQLR5WHo7raUdy++mKTypBcksDMGu02e/y2LL5dfcbwJiFOhepoOSxW7HAM
         qhQk33LqWKnM71Rvpocs6Lr+bSz5ZhRj5sg3FdfbYMGN+8p4ElscnOrSYWGgo9NdbeBs
         YqWu7gNHFKbEBF4wGvib7spB8LTWvvlt3jf0nVNZj8yh/iE3eEJDouH8rcp+vv1rwzrs
         OaeLBCVLl4aVNGJwOhAZ920phl/yxBux7NjuNVO4AJF/sR0lVnh49cUD2oPFxAdlkCQi
         LRZlOpO1kFVxD+URKOLjfLqZGFHxoUIOy3s0PvVD5zrkHb0DFDuFC2Eu8kKAB8/kCqrq
         wbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688766944; x=1691358944;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dxkJHri43fmKt8R5z8YjbywDBegP4t1apGGC2ZsbmRA=;
        b=kL2pU2M1wRGb6KZ+ejwH6kl9uf4ujCGf82ZFw3GLzZOJhZjZKKsAOjPeiNrxK/PD9h
         rkP+Pf1wNvW9stMJWlC5WNR4KqZqfvl1wfxS82YHJp+HlnwxciNdJuoonhNJc6V7ody0
         VpJRsFHYrSQ5NnwxETZe3U+npWpe42bFkeP13OdZTCqrt0GqY34kKS5/Zl6onSB4lgo7
         fB+wRBPH6Zix0Tl+0eLtgerjUH0VEG5bPkIkghvaaKCmB+i99aiJB0zq0vwOOFluT3pU
         ZGfna4HFAysWRJUv+rzL5spRVHcU1orrOl1GQqMgVjXOyaVMD494l6zVQ6dMiLScRXmk
         W10Q==
X-Gm-Message-State: ABy/qLagnVirUWUhNqzZTm8G96gCYY41cHfHjcCSUWqTYqD9LDPHOzgK
        De/uKRVhmbPv1QHLBbBarOvv8JIgCw8hVyHn8qV2
X-Google-Smtp-Source: APBJJlFel5F91WF38N/Ma9BXBqSumdIUfaXPm38xcZEmd46V3Sw+DRUSf//YD6ttv9zQvAnO8kSEtklzmiH0ms9z3sUS
X-Received: from axel.svl.corp.google.com ([2620:15c:2a3:200:c201:5125:39d1:ef3f])
 (user=axelrasmussen job=sendgmr) by 2002:a81:a941:0:b0:579:e07c:2798 with
 SMTP id g62-20020a81a941000000b00579e07c2798mr45025ywh.2.1688766943660; Fri,
 07 Jul 2023 14:55:43 -0700 (PDT)
Date:   Fri,  7 Jul 2023 14:55:32 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230707215540.2324998-1-axelrasmussen@google.com>
Subject: [PATCH v4 0/8] add UFFDIO_POISON to simulate memory poisoning with UFFD
From:   Axel Rasmussen <axelrasmussen@google.com>
To:     Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brian Geffon <bgeffon@google.com>,
        Christian Brauner <brauner@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Huang Ying <ying.huang@intel.com>,
        Hugh Dickins <hughd@google.com>,
        James Houghton <jthoughton@google.com>,
        "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
        Jiaqi Yan <jiaqiyan@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Muchun Song <muchun.song@linux.dev>,
        Nadav Amit <namit@vmware.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Peter Xu <peterx@redhat.com>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Shuah Khan <shuah@kernel.org>,
        Suleiman Souhlal <suleiman@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "T.J. Alumbaugh" <talumbau@google.com>,
        Yu Zhao <yuzhao@google.com>,
        ZhangPeng <zhangpeng362@huawei.com>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org,
        Axel Rasmussen <axelrasmussen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series adds a new userfaultfd feature, UFFDIO_POISON. See commit 4
for a detailed description of the feature.

The series is based on Linus master (partial 6.5 merge window), and
structured like this:

- Patches 1-3 are preparation / refactoring
- Patches 4-6 implement and advertise the new feature
- Patches 7-8 implement a unit test for the new feature

Changelog:

v3 -> v4:
 - [Peter] Rename PTE_MARKER_ERROR and helpers to PTE_MARKER_POISONED.
 - [Peter] Switch from calloc to memset for initializing some state in the
   selftest.

v2 -> v3:
 - Rebase onto current Linus master.
 - Don't overwrite existing PTE markers for non-hugetlb UFFDIO_POISON.
   Before, non-hugetlb would override them, but hugetlb would not. I don't
   think there's a use case where we *want* to override a UFFD_WP marker
   for example, so take the more conservative behavior for all kinds of
   memory.
 - [Peter] Drop hugetlb mfill atomic refactoring, since it isn't needed
   for this series (we don't touch that code directly anyway).
 - [Peter] Switch to re-using PTE_MARKER_SWAPIN_ERROR instead of defining
   new PTE_MARKER_UFFD_POISON.
 - [Peter] Extract start / len range overflow check into existing
   validate_range helper; this fixes the style issue of unnecessary braces
   in the UFFDIO_POISON implementation, because this code is just deleted.
 - [Peter] Extract file size check out into a new helper.
 - [Peter] Defer actually "enabling" the new feature until the last commit
   in the series; combine this with adding the documentation. As a
   consequence, move the selftest commits after this one.
 - [Randy] Fix typo in documentation.

v1 -> v2:
 - [Peter] Return VM_FAULT_HWPOISON not VM_FAULT_SIGBUS, to yield the
   correct behavior for KVM (guest MCE).
 - [Peter] Rename UFFDIO_SIGBUS to UFFDIO_POISON.
 - [Peter] Implement hugetlbfs support for UFFDIO_POISON.

Axel Rasmussen (8):
  mm: make PTE_MARKER_SWAPIN_ERROR more general
  mm: userfaultfd: check for start + len overflow in validate_range
  mm: userfaultfd: extract file size check out into a helper
  mm: userfaultfd: add new UFFDIO_POISON ioctl
  mm: userfaultfd: support UFFDIO_POISON for hugetlbfs
  mm: userfaultfd: document and enable new UFFDIO_POISON feature
  selftests/mm: refactor uffd_poll_thread to allow custom fault handlers
  selftests/mm: add uffd unit test for UFFDIO_POISON

 Documentation/admin-guide/mm/userfaultfd.rst |  15 +++
 fs/userfaultfd.c                             |  73 ++++++++++--
 include/linux/mm_inline.h                    |  19 +++
 include/linux/swapops.h                      |  15 ++-
 include/linux/userfaultfd_k.h                |   4 +
 include/uapi/linux/userfaultfd.h             |  25 +++-
 mm/hugetlb.c                                 |  51 ++++++--
 mm/madvise.c                                 |   2 +-
 mm/memory.c                                  |  15 ++-
 mm/mprotect.c                                |   4 +-
 mm/shmem.c                                   |   4 +-
 mm/swapfile.c                                |   2 +-
 mm/userfaultfd.c                             |  83 ++++++++++---
 tools/testing/selftests/mm/uffd-common.c     |   5 +-
 tools/testing/selftests/mm/uffd-common.h     |   3 +
 tools/testing/selftests/mm/uffd-stress.c     |   8 +-
 tools/testing/selftests/mm/uffd-unit-tests.c | 117 +++++++++++++++++++
 17 files changed, 379 insertions(+), 66 deletions(-)

--
2.41.0.255.g8b1d071c50-goog

