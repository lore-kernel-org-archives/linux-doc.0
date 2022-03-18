Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0AFAC433F5
	for <linux-doc@archiver.kernel.org>; Fri, 18 Mar 2022 10:09:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234835AbiCRKK2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Mar 2022 06:10:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234833AbiCRKK1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Mar 2022 06:10:27 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC64F1F9FC4
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 03:09:08 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id m11-20020a17090a7f8b00b001beef6143a8so7911707pjl.4
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 03:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PqTragMvIuyF2G0eNMg49ec3Fe5cawaQAXvvejFzdIM=;
        b=qXwXkk0olJ0XDtllYBpfRHL/aedk+D1cB23bq8H1tudbY0Os+Et3oFOf/Pc0BG/5/+
         +yRK9PawpTJwQCj4raaVJAb42DypRyfAXxCtqLS8U8Fea7c6vtzpkml1ByZ8uhEEGjr8
         bgXf3ZcCDXwd5+UNeQpJ77RpXYAYAn+4MNuXKAPqgGbpJ3+ytYvR4hC8qlMq9k8cO8dF
         o7HtFAbnv7+MSQR/fZGvxk4MRO9YQHvmZu+LQwjqjThoVgHbnOltQrIgaijn7MrKHpMp
         6HKtebsjY+zOhOE6rQ0TMgoxMpAwWJkZk3G3NKcHA2S4m6tA1IfLjRnjR7J4GY6Oc77a
         TbrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PqTragMvIuyF2G0eNMg49ec3Fe5cawaQAXvvejFzdIM=;
        b=RfMDPQz86QqczsDRZ0wbcyDRrZ8CMHgoW1ZGiPW2DBnKk5Q3pSZmvofg2neBWkwf8i
         UAhlCrZMgSuq7ZX6RA5hnv31p56eihVJrnQWWIDDVWQF5zGCBTUNeziErx/xI4mL8WoK
         mZ9TGmHeLnZl5vPBoFcTq1baHpd2fLe0KHtJoPf2kp5B8k+LPIkwpuaowtfXv282GJvj
         zgkgzOsnfm9nljftndootEq5KqEatPgk0okdkmnNfXr7ItbrxUHmB/8rE5Dwz7V7z0tQ
         UU8C/jyjb+nfzAPZhIWww8M+J6YjEs3anBJdN9Fw3I5xavYKP6ehs68idGXgP6nesnqA
         XGow==
X-Gm-Message-State: AOAM532hJ3nt/TdC1/6u97UToS1nHvvy3GF7YGFH36k2edpX2dc8sIl/
        LfVTAs7wzLALkX1Jw2lnoYkiqQ==
X-Google-Smtp-Source: ABdhPJwYPVd8MicGEiN4zrjKB2SVRMQvXml+oxRRxpDhAvQvmm05Oyp3FZLDCzGvE+iUQJwPVMmWCg==
X-Received: by 2002:a17:903:32c3:b0:152:c1b:e840 with SMTP id i3-20020a17090332c300b001520c1be840mr9533735plr.40.1647598148363;
        Fri, 18 Mar 2022 03:09:08 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id j3-20020a056a00234300b004fa042e8216sm9541252pfj.2.2022.03.18.03.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 03:09:08 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 0/4] add hugetlb_free_vmemmap sysctl
Date:   Fri, 18 Mar 2022 18:07:16 +0800
Message-Id: <20220318100720.14524-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series is based on next-20220310.

This series amis to add hugetlb_free_vmemmap sysctl to enable the feature
of freeing vmemmap pages of HugeTLB pages.

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
 Kbuild                                  |  12 ++++
 fs/Kconfig                              |   2 +-
 include/linux/memory_hotplug.h          |   9 +++
 include/linux/mm_types.h                |   2 +
 kernel/sysctl.c                         |   2 +-
 mm/Kconfig                              |   3 +
 mm/hugetlb_vmemmap.c                    | 107 ++++++++++++++++++++++++--------
 mm/hugetlb_vmemmap.h                    |   4 +-
 mm/memory_hotplug.c                     |  27 ++++++--
 mm/struct_page_size.c                   |  19 ++++++
 scripts/check_struct_page_po2.sh        |  11 ++++
 12 files changed, 177 insertions(+), 35 deletions(-)
 create mode 100644 mm/struct_page_size.c
 create mode 100755 scripts/check_struct_page_po2.sh

-- 
2.11.0

