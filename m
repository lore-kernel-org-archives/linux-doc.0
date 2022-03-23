Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5B6C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 23 Mar 2022 12:57:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243686AbiCWM6p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Mar 2022 08:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243520AbiCWM6p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Mar 2022 08:58:45 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 378597C791
        for <linux-doc@vger.kernel.org>; Wed, 23 Mar 2022 05:57:14 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id p8so1427915pfh.8
        for <linux-doc@vger.kernel.org>; Wed, 23 Mar 2022 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dlWHeuOtvbsHkw9sC0AFBolbbZkhOtKQrZPbL7UMiVo=;
        b=nBRZCUuOz35Bie3BZwHRuFwA7EvWa13fd7C9LX1eFGazkZDIsdOFyFPEo8F08O3aKs
         sMRaN9zwPj4HnrFW5olDavjqYrsfCdXcKl+SCJUgQ1y8rEzzhrhflSs7ASKmtsK7gcqB
         akMH04R3rozZEpysdCepSquR55lzMJfiQu0zdlxEUP7p3Z+mXYyxFwtJwtJazEUeHtSe
         AYDzr+ohyJRV2uBuabmdrSgMquRE6Yx21VyOxtcJ8C0hHN8bQTy1l0TRVccBjXsfZRlm
         0nC4vz95qM47jecKgpSXTwg3Y3QmN10Y8RQYBGaxhNGqH8Eiki3anzLZ+dHWSkGvu3yW
         P+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dlWHeuOtvbsHkw9sC0AFBolbbZkhOtKQrZPbL7UMiVo=;
        b=4KLkE7dVDsWOQl6lejEd4swiLjq9573sXzezrUSIUEnYCv3lRb1rXjYuBTkxDq5C0w
         QVxhUAFmzFdQv7z6uf3P7+6FET2UO0GYp/KyzhLofQ4F86wbgzJL75PWZVxyGSqA4PDU
         ibmEzE9Wpnlgm51IIUTyS87eeWzL5GvLt5XwFlf7vNCWkTaoG5roQHIQu+p+LsCCShTy
         53lEw+zswRkPfnsYdXF5jxG/nzdAhrZOEgU/8S5cbboQYFPSYc1Pny1Pvbz/I6YNikvL
         /qIR815ypcfh7Arnxg98Z+eBjU7N3KDHAmwAC5QgOiE3AWTU8Mu/S8md2fWbuRvvLkwL
         tUzQ==
X-Gm-Message-State: AOAM531W9kqJzapUulu3l91Wyf/n1BfKOpsHTL++IS3o1X6VbK4rJXh1
        Vt8ssRsSIJcLWEHJN4gDt1UpDQ==
X-Google-Smtp-Source: ABdhPJxc1Pi8YWlaKoR3Vrc+COpZGAeSLvAEixb+q0mIHCRa6IoNdqFz0C0di4sTLgKUSdkWWn7BaA==
X-Received: by 2002:a63:5a49:0:b0:382:1ced:330e with SMTP id k9-20020a635a49000000b003821ced330emr22887174pgm.478.1648040233722;
        Wed, 23 Mar 2022 05:57:13 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id k185-20020a6384c2000000b003821dcd9020sm15716517pgd.27.2022.03.23.05.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 05:57:13 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v5 0/4] add hugetlb_free_vmemmap sysctl
Date:   Wed, 23 Mar 2022 20:55:19 +0800
Message-Id: <20220323125523.79254-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series is based on next-20220310.

This series amis to add hugetlb_free_vmemmap sysctl to enable the feature
of freeing vmemmap pages of HugeTLB pages.

v5:
  - Fix not working properly if one is workig off of a very clean build
    reported by Luis Chamberlain.
  - Add Suggested-by for Luis Chamberlain.

Thanks.

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
  mm: hugetlb_vmemmap: introduce STRUCT_PAGE_SIZE_IS_POWER_OF_2
  mm: memory_hotplug: override memmap_on_memory when
    hugetlb_free_vmemmap=on
  sysctl: allow to set extra1 to SYSCTL_ONE
  mm: hugetlb_vmemmap: add hugetlb_free_vmemmap sysctl

 Documentation/admin-guide/sysctl/vm.rst |  14 +++++
 Kbuild                                  |  14 +++++
 fs/Kconfig                              |   1 +
 include/linux/memory_hotplug.h          |   9 +++
 include/linux/mm_types.h                |   2 +
 kernel/sysctl.c                         |   2 +-
 mm/Kconfig                              |   3 +
 mm/hugetlb_vmemmap.c                    | 107 ++++++++++++++++++++++++--------
 mm/hugetlb_vmemmap.h                    |   4 +-
 mm/memory_hotplug.c                     |  27 ++++++--
 mm/struct_page_size.c                   |  19 ++++++
 scripts/check_struct_page_po2.sh        |   9 +++
 12 files changed, 177 insertions(+), 34 deletions(-)
 create mode 100644 mm/struct_page_size.c
 create mode 100755 scripts/check_struct_page_po2.sh

-- 
2.11.0

