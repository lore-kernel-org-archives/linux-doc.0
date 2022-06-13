Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D948CCA47B
	for <linux-doc@archiver.kernel.org>; Mon, 13 Jun 2022 06:35:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbiFMGfb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Jun 2022 02:35:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbiFMGf3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Jun 2022 02:35:29 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFE93BC8E
        for <linux-doc@vger.kernel.org>; Sun, 12 Jun 2022 23:35:27 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id q140so4727160pgq.6
        for <linux-doc@vger.kernel.org>; Sun, 12 Jun 2022 23:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ejoz2DCbggYc1zBmQNGGZRqPtrQj0ureLICOuzJFZmU=;
        b=OxTUnNdHpp50SMsYqQOIYKSwtagFzLBUmMmPY9dFZ+mCEDI0GK+/N644JE0MVvRWuD
         oi1jkSH30j46ZX061wTIpMoKjsckKkkuG/UTdIMbtVUUrwrWj6v0vGxlZ5xKHU3UMk9T
         MrG7FrNRnF7cqn36SdxWn026hu4EX/7nFvs5WuiE7CM50W17zGVGpz84tR9HpKEl3rAP
         ebelIoFS5Lhto5GBs76E3lrxeLiAqiWUJpaQk8EmX7YkGPsQrbcXln9b+NRDLz4b96yY
         iO0CKZxjNJq7XR6NnOJoSyQDAR3SBeko1QHhxk3M5dWxw7EsjElP96SoYkXgUEZRLgbb
         1vjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ejoz2DCbggYc1zBmQNGGZRqPtrQj0ureLICOuzJFZmU=;
        b=M5vQlaaSH9LxuujFj/xBEo5Pdqvrnv8ANTj31+XuQEwS9zGuRA5DZCkdzWtx7O33l/
         nUDaP+RHUzr8tkqRWTbRLgWCDAR1qgGcbFsY+Js//HDRBsueCQ7Emsw0Utzs7Y8FMGjX
         NsFtGJGlaA/yq11/ZCE+HeOe93RGHgDkbo4PxG5y/734VX5+5zLlpP6VYv9gsi+s9DtR
         ZLCwHD5bwxQTWgk4iJG+UkoOgrBBiDkjAdsSkVkY+5uPAlE9nn/45ntyYyy7CwENUuWA
         5QIl/zRvtpwmOG8evVpjuMFH4m6K3R8jnc0/jY0EUd5PQf5/54QpiH3dNzc6Ruoi7l5R
         eFmA==
X-Gm-Message-State: AOAM5332y6OoJ6I/EWrC+by/dOorvyS0MUa5Dl2oJBHZWizsR+Kq0cql
        Rx8TCuFk3lEizLuPN4qx90Xbvg==
X-Google-Smtp-Source: ABdhPJymj2CTUZcvnfpi7YZkMigHH98usV2DwWdiEfXKQZqUz6w1sAVIilmQqx44Ffhe7JQCx6y0YA==
X-Received: by 2002:a63:5723:0:b0:3fd:d8b4:c19f with SMTP id l35-20020a635723000000b003fdd8b4c19fmr31492536pgb.137.1655102127199;
        Sun, 12 Jun 2022 23:35:27 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id v3-20020aa799c3000000b0051bc538baadsm4366554pfi.184.2022.06.12.23.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 23:35:26 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, david@redhat.com,
        akpm@linux-foundation.org, corbet@lwn.net
Cc:     linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 0/6] Simplify hugetlb vmemmap and improve its readability
Date:   Mon, 13 Jun 2022 14:35:06 +0800
Message-Id: <20220613063512.17540-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series aims to simplify hugetlb vmemmap and improve its readability
and is based on next-20220610.

Muchun Song (6):
  mm: hugetlb_vmemmap: delete hugetlb_optimize_vmemmap_enabled()
  mm: hugetlb_vmemmap: optimize vmemmap_optimize_mode handling
  mm: hugetlb_vmemmap: introduce the name HVO
  mm: hugetlb_vmemmap: move vmemmap code related to HugeTLB to
    hugetlb_vmemmap.c
  mm: hugetlb_vmemmap: replace early_param() with core_param()
  mm: hugetlb_vmemmap: improve hugetlb_vmemmap code readability

 Documentation/admin-guide/kernel-parameters.txt |   7 +-
 Documentation/admin-guide/mm/hugetlbpage.rst    |   3 +-
 Documentation/admin-guide/sysctl/vm.rst         |   3 +-
 arch/arm64/mm/flush.c                           |  13 +-
 fs/Kconfig                                      |  13 +-
 include/linux/hugetlb.h                         |   7 +-
 include/linux/mm.h                              |   7 -
 include/linux/page-flags.h                      |  16 +-
 mm/hugetlb.c                                    |  11 +-
 mm/hugetlb_vmemmap.c                            | 592 ++++++++++++++++++------
 mm/hugetlb_vmemmap.h                            |  43 +-
 mm/sparse-vmemmap.c                             | 391 ----------------
 12 files changed, 509 insertions(+), 597 deletions(-)


base-commit: 6d0c806803170f120f8cb97b321de7bd89d3a791
-- 
2.11.0

