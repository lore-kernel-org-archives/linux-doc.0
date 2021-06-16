Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 233EDC48BE5
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 09:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 065E96128C
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 09:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbhFPJy2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 05:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbhFPJy0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jun 2021 05:54:26 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AEBBC061574
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 02:52:19 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id u18so1749753pfk.11
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 02:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=faEsJMYXdkq8dqS3OMq39MuM6MrUVUE48pwQCvuwLyo=;
        b=E/heCUjIPKrneHxRTcWIoANtbWzp9/NKkzSQIn4UXCT1LGzmovWGOGnDwNBjSGzZOr
         ZVreRiQN5i33TqoiLG11vQ6QKWz6xsMgrqklp/GNXMJ076RJe3cto4h+HifqlTejLrXd
         DnG5ZxonZLWkQDEkjJHnciuZOPAt2PvCoEpsjPe77X9UBSNr34ajhMWXnr4AVL6bV/kh
         iVqk1zgxYlMeATTuLOq7Zv+fE12rfXV4HdCitdkuPorD1FQgLs66KdowpwphyUn65x3O
         GN80sNJdZDxNZX79VCk7A6YUDUAMzgIQRQ53P1l6jh9vOLgrzV+1mYo2G3Xc++CjUgY9
         lkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=faEsJMYXdkq8dqS3OMq39MuM6MrUVUE48pwQCvuwLyo=;
        b=DSUsqeGbDjXynJsLiSC9Acb7cYKGzkiTxa1zFCo7fh4BxZYxgOW+zn7vOm+Kc0bukV
         j7DK3q9g7tLB7bamBZTCCEifq4TDLn5ApcnavNXNGvxoPRjIUB4/lMZVLja8lzglcC3M
         WomCyO2zdnbN5mEGAv7vjjc/78quw5ZiCm6bX7MXTJcZ5W3owT0Jn2XYHZBGhNyVxdTk
         +qXNcLfrZCFwSygz01+sehYVqdXheppGqYMNiN7/h/Y8ivldLUBc3hHV0R6QRcoiye5A
         0IqJTEXmMLmIPCbTDZ24SZ7GIDmNam7S5CosApugVK6l5f6dYwk8gnVqle2IoIY+HUzE
         lPjA==
X-Gm-Message-State: AOAM530C6F421hsBCuUoWEKvZlV1p2yORlZD/P3JOvXzpfROHg6PJ7PU
        lWuTPJhRXccsB4a+oePwGgOdQA==
X-Google-Smtp-Source: ABdhPJyLoWkINbZXH8GwrdSel4LYnkl8T6vc80euLaz6NBhLNeIgG8RVBXnpwl56pjjq2IzLJecTdw==
X-Received: by 2002:a63:d47:: with SMTP id 7mr4101239pgn.339.1623837139177;
        Wed, 16 Jun 2021 02:52:19 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.246])
        by smtp.gmail.com with ESMTPSA id a20sm1744222pfk.145.2021.06.16.02.52.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Jun 2021 02:52:18 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 0/3] Split huge PMD mapping of vmemmap pages
Date:   Wed, 16 Jun 2021 17:49:12 +0800
Message-Id: <20210616094915.34432-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order to reduce the difficulty of code review in series[1]. We disable
huge PMD mapping of vmemmap pages when that feature is enabled. In this
series, we do not disable huge PMD mapping of vmemmap pages anymore. We
will split huge PMD mapping when needed. When HugeTLB pages are freed from
the pool we do not attempt coalasce and move back to a PMD mapping because
it is much more complex.

[1] https://lore.kernel.org/linux-doc/20210510030027.56044-1-songmuchun@bytedance.com/

Changelog in v3:
  1. Collect Review-by from Mike.
  2. Rename 'walked_pte' to 'nr_walked'.
  3. Update commit log in patch 1.
  4. Add a comment above vmemmap_remap_range() called from vmemmap_remap_free().

  Thanks Mike's suggestions and review.

Changelog in v2:
  1. Collect Review-by from Mike.
  2. Remove helpers used to preallocate/free page tables for HugeTLB pages.

  Thanks Mike's suggestions. It really eliminate a lot of code.

Muchun Song (3):
  mm: sparsemem: split the huge PMD mapping of vmemmap pages
  mm: sparsemem: use huge PMD mapping for vmemmap pages
  mm: hugetlb: introduce CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON

 Documentation/admin-guide/kernel-parameters.txt |  10 +-
 arch/x86/mm/init_64.c                           |   8 +-
 fs/Kconfig                                      |  10 ++
 include/linux/hugetlb.h                         |  25 +---
 include/linux/mm.h                              |   4 +-
 mm/hugetlb_vmemmap.c                            |  11 +-
 mm/memory_hotplug.c                             |   2 +-
 mm/sparse-vmemmap.c                             | 163 ++++++++++++++++++------
 8 files changed, 155 insertions(+), 78 deletions(-)

-- 
2.11.0

