Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B16C43217
	for <linux-doc@archiver.kernel.org>; Tue, 12 Apr 2022 12:12:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344704AbiDLMOV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Apr 2022 08:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354399AbiDLMOF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Apr 2022 08:14:05 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3ACAC85661
        for <linux-doc@vger.kernel.org>; Tue, 12 Apr 2022 04:15:01 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id e8-20020a17090a118800b001cb13402ea2so2628656pja.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Apr 2022 04:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/LHQ0nWmz2r/pD7wgSsiKJq8hFpZAK2dEG+C+pVYguk=;
        b=RgweYEl2njKBQ/qkD0QsEqFYmun8JoT7QAE9/9a8ypuYGYrQVmiL8WG0sENk1bRlB9
         DdpFfhUEl39HPbnsBVsXjIw2BDTBBBRE6jW52nEPelTno7oI4BvsIluMkuuDnVa+rLTc
         IRDl9RdjBI/bp5RnOopsKDizvkCpGgwrnVJRcXQMBCo9Qy8tF05bIqofh7dTe1WMzO/C
         aP8eewe6tH4gOiZXlafAG1vJkFZ7GEHXZnSDtvOyH9rUT8+DOtrdEL9VYRK4rU9dnMTA
         vLOYXWfy422owFKiQuP8ohMxu+lE1GU8qWWkK+3QOwg2UPuxJWhpveIPPimR77YwZmkA
         pLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/LHQ0nWmz2r/pD7wgSsiKJq8hFpZAK2dEG+C+pVYguk=;
        b=vW7n7iLta19kqD/bup+dk4892WCCpFnxW3nzT7gHr7Vt0nuHUFNWfmFv9eBCO682HF
         IDOrkpm5mm5hrKQFZ4lCF/kIPKDEbqhWRFaA6Y2cMVhlmR9bUCWdgv8ZW5J5cZB+18Kn
         57uhjp2IIANnzG+2+DE6f27gzOsTdBgr8gqVE+UAhq5GQuNFobJYS/NCFWN9NAryVO+Q
         nW/V7lxz90uXM64s+EePkmxSAALCLnLfl4V3LYuUM2AP/NGNWJD75C7ELPZ38MRfeC7u
         JFs+zCOom6ozBz3L5P+uv9lF7RacAytpl8E0+m64P5Yf106e/A53FFjzpN92SlTcEV3D
         a+2w==
X-Gm-Message-State: AOAM530ByKQq1Tz4CBffpk3puSvI7Lsr+zrqpeDW3qqpjtJ4PsWhF9O9
        CBfUbEh0HQQSWMeP0DB6ShhQNA==
X-Google-Smtp-Source: ABdhPJyxhPc5PVq3oT4Nhp6xmJ9VdjMh9PULiQuZiylRW5MGUuA3lL9aU58g8xg3Wuc8aEJV27QiLA==
X-Received: by 2002:a17:90b:3b43:b0:1c6:f878:ea52 with SMTP id ot3-20020a17090b3b4300b001c6f878ea52mr4428201pjb.68.1649762100641;
        Tue, 12 Apr 2022 04:15:00 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id l25-20020a635719000000b0039da6cdf82dsm402507pgb.83.2022.04.12.04.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 04:15:00 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 0/4] add hugetlb_optimize_vmemmap sysctl
Date:   Tue, 12 Apr 2022 19:14:30 +0800
Message-Id: <20220412111434.96498-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series is based on next-20220407.

This series amis to add hugetlb_optimize_vmemmap sysctl to enable or disable
the feature of optimizing vmemmap pages associated with HugeTLB pages.

v7:
  - Fix circular dependency issue reported by kernel test robot.
  - Introduce CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP instead of
    STRUCT_PAGE_SIZE_IS_POWER_OF_2.
  - Add more comments into vm.rst to explain hugetlb_optimize_vmemmap (Andrew).
  - Drop the patch "sysctl: allow to set extra1 to SYSCTL_ONE".
  - Add a new patch "use kstrtobool for hugetlb_vmemmap param parsing".
  - Reuse static_key's refcount to count the number of HugeTLB pages with
    vmemmap pages optimized to simplify the lock scheme.

v6:
  - Remove "make syncconfig" from Kbuild.

v5:
  - Fix not working properly if one is workig off of a very clean build
    reported by Luis Chamberlain.
  - Add Suggested-by for Luis Chamberlain.

v4:
  - Introduce STRUCT_PAGE_SIZE_IS_POWER_OF_2 inspired by Luis.

v3:
  - Add pr_warn_once() (Mike).
  - Handle the transition from enabling to disabling (Luis)

v2:
  - Fix compilation when !CONFIG_MHP_MEMMAP_ON_MEMORY reported by kernel
    test robot <lkp@intel.com>.
  - Move sysctl code from kernel/sysctl.c to mm/hugetlb_vmemmap.c.

Muchun Song (4):
  mm: hugetlb_vmemmap: introduce
    CONFIG_HUGETLB_PAGE_HAS_OPTIMIZE_VMEMMAP
  mm: memory_hotplug: override memmap_on_memory when
    hugetlb_free_vmemmap=on
  mm: hugetlb_vmemmap: use kstrtobool for hugetlb_vmemmap param parsing
  mm: hugetlb_vmemmap: add hugetlb_optimize_vmemmap sysctl

 Documentation/admin-guide/kernel-parameters.txt |   6 +-
 Documentation/admin-guide/sysctl/vm.rst         |  27 +++++++
 Kbuild                                          |  19 +++++
 arch/x86/mm/init_64.c                           |   2 +-
 include/linux/hugetlb.h                         |   2 +-
 include/linux/kconfig.h                         |   4 +
 include/linux/memory_hotplug.h                  |   9 +++
 include/linux/mm.h                              |   2 +-
 include/linux/page-flags.h                      |   2 +-
 kernel/autoconf_ext.c                           |  26 ++++++
 mm/hugetlb_vmemmap.c                            | 102 ++++++++++++++++++++----
 mm/hugetlb_vmemmap.h                            |   8 +-
 mm/memory_hotplug.c                             |  27 +++++--
 mm/sparse-vmemmap.c                             |   4 +-
 scripts/mod/Makefile                            |   2 +
 15 files changed, 207 insertions(+), 35 deletions(-)
 create mode 100644 kernel/autoconf_ext.c

-- 
2.11.0

