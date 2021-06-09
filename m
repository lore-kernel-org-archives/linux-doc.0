Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7515CC48BCD
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 12:16:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 510AF61287
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 12:16:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232726AbhFIMSB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 08:18:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbhFIMSA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 08:18:00 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38542C06175F
        for <linux-doc@vger.kernel.org>; Wed,  9 Jun 2021 05:16:06 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 27so19306446pgy.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wprdMWfJiXYwt+byCaL17b8Ql6JNBi5HmdAMUTjvSbc=;
        b=V+MbqtjhsFxJ9XUKWyH9b56cSIZdlel2+2J+6Y0VjDs0KVJP/tVYXUiqHSXhbQWa4T
         NRBvXHKhwwkgnNsJ2bpdbP5e+ZKvM0r9ZOiN5uvAa1qAzUX7T9Uh6JGu8eRp0iQ+6bTy
         7/uGiQlRBK19yPMEh1VkiGnTTl34a1ApoBZ7crHxjUqUUAA/v7if1iJcadXbgv+11/rP
         oVXj4HDLmR4EgDnpECdZqNnw/ioCtWRUsmu83SLvWTqOURAOuK8a9LE/Uof55nQcCnYH
         +g3rUisaThQgqytwPQnm6x0cHrlXtbn5LZOWe5ZLY/dtsbYrL7pc0eutYOxZef60yA1M
         ZuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wprdMWfJiXYwt+byCaL17b8Ql6JNBi5HmdAMUTjvSbc=;
        b=h8KeeRudHZnIcyR3QKIY/boooxalynOkQjdBnLQA3LXnpyh1nU7raB2mCrEbr3gx6y
         f7H7wLahdLE5Rhqmbd2pLdYaa7B8iGD/2qRXg7VQpy9L6Wg+MrkCpu3EIgyCtTFYD7/8
         HnFrVZ4RvbmfsEHzsudYF8IyPlkqhg/wnssQ0lqXIYJJQgsYUg9L30+iE9UChkJSaGfu
         eDjETKIHTYg/mv3nulKsoRtD9ofLYXp88YVZXkxrRzOZEaEeeZeK/QNOI6dU1EDjbIjk
         AGhFhLv3x2PwGbfHeMtYbnTjlX/4C4NC4n03cIxNfgJgkLIeedaY9sCYiKNxjLlaLzdE
         Gziw==
X-Gm-Message-State: AOAM533loqk75/Xn8NygezcozmcNwxstOMb/BMsfWgF4zDYpio3rxYfc
        q6E96hTFZ4v3evfd07hp5qzxKg==
X-Google-Smtp-Source: ABdhPJxOzhPyB/B/fwjQm3fVVbXISdPVlMybZd7K3dy83KhCsPp0ST1pBO2gb286LZ/N8Wmg3LYsRw==
X-Received: by 2002:a05:6a00:23cf:b029:2d5:302e:dc77 with SMTP id g15-20020a056a0023cfb02902d5302edc77mr4973334pfc.63.1623240964882;
        Wed, 09 Jun 2021 05:16:04 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id h16sm13689224pfk.119.2021.06.09.05.15.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jun 2021 05:16:04 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        zhengqi.arch@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 0/5] Split huge PMD mapping of vmemmap pages
Date:   Wed,  9 Jun 2021 20:13:05 +0800
Message-Id: <20210609121310.62229-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In order to reduce the difficulty of code review in series[1]. We disable
huge PMD mapping of vmemmap pages when that feature is enabled. In this
series, we do not disable huge PMD mapping of vmemmap pages anymore. We
will split huge PMD mapping when needed.

[1] https://lore.kernel.org/linux-doc/20210510030027.56044-1-songmuchun@bytedance.com/

Muchun Song (5):
  mm: hugetlb: introduce helpers to preallocate/free page tables
  mm: hugetlb: introduce helpers to preallocate page tables from bootmem
    allocator
  mm: sparsemem: split the huge PMD mapping of vmemmap pages
  mm: sparsemem: use huge PMD mapping for vmemmap pages
  mm: hugetlb: introduce CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON

 Documentation/admin-guide/kernel-parameters.txt |  10 +-
 arch/x86/mm/init_64.c                           |   8 +-
 fs/Kconfig                                      |  10 ++
 include/linux/hugetlb.h                         |  28 ++----
 include/linux/mm.h                              |   2 +-
 mm/hugetlb.c                                    |  42 +++++++-
 mm/hugetlb_vmemmap.c                            | 126 +++++++++++++++++++++++-
 mm/hugetlb_vmemmap.h                            |  25 +++++
 mm/memory_hotplug.c                             |   2 +-
 mm/sparse-vmemmap.c                             |  61 ++++++++++--
 10 files changed, 267 insertions(+), 47 deletions(-)

-- 
2.11.0

