Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F31C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 12 May 2022 04:12:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241722AbiELEMP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 May 2022 00:12:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237640AbiELEMN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 00:12:13 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1D31C15C0
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 21:12:10 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id q76so3495975pgq.10
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 21:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HQnzlDikKOsDxf1h8spRLU9TXxPUqNDKctkg19RVkFM=;
        b=StMBboIsOvYwncuvyeTg7rPeTafDz8G7/dg30myGJeamyQj3Dadv3p7IdQXVIjaujj
         0liZkhXgA84gzeXvYO1yqN+8lTKkDa3VKlFRNoEUMhEZRz8VT6gNZs8Ot4RWKt46LuUr
         L2Z/g0YxiH0dpLkq4LY95B4pJNHatPStdR/LFpkJmzjbHfQ9PhjdnK8AzGG7pKuELqqq
         myXRGfAuerWOFPsas0Cvhvmro0zNlkJ8jbWxY9GDyDRoH5+20M9jQRAHyu1z+QxVRc/m
         DugAoek7BCSMkhGkwjIHCyPMtfiWYMzY9vjPXWrXasxvxii1a31uHtD2jc4S6lxTQRxh
         7S5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=HQnzlDikKOsDxf1h8spRLU9TXxPUqNDKctkg19RVkFM=;
        b=cxhQcQWVvmQVROkHBp+t+ioIe+3TiBbVF2U64GDnr3bIWevXBYPUCU2k4TMpzFLs5c
         +8eXUAHXpDNRxeD7CgDAJMwu57nL8ywo65TUaBmg69VuiarYEHi2276isKctk06pl57J
         vbdJvZOkscGa8JLZbxj5nApfUe8ESAZUCmuwhSR8jDNoIhCemILnmF8QuuoIKgn8FgOS
         g2WRk6tnpTFUp0JrZ3uLxQxeiyizNjoWHrcDKyzGm6rjK5ZUnPBEsgj6lOI38MsmAp8Y
         RvtiPTasIrXNlIb5Uc8BWHwkHXpGpgc5+9vCJH88KiSHLNh6Ja7MKUlTO53IMCibNVmu
         ZzUQ==
X-Gm-Message-State: AOAM532FjbWSPRL4NI6p5ZDI43O0Smr4rU/QKHeybsTRXz1haW8ojZv9
        7q6VrLbmK4fka7Mga5mxK5CMkw==
X-Google-Smtp-Source: ABdhPJzvZBtXMozuWBMlu0OwrFMFcyKndb2ocY+uEuiBi9hX0XjdbynP491SC406Vp3nqjZ1Z10hKg==
X-Received: by 2002:a65:6745:0:b0:3db:2558:c458 with SMTP id c5-20020a656745000000b003db2558c458mr5166424pgu.211.1652328729922;
        Wed, 11 May 2022 21:12:09 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902edcd00b0015e8d4eb2dcsm2695161plk.294.2022.05.11.21.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 21:12:09 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v11 0/4] add hugetlb_optimize_vmemmap sysctl
Date:   Thu, 12 May 2022 12:11:38 +0800
Message-Id: <20220512041142.39501-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series is based on next-20220428.

This series amis to add hugetlb_optimize_vmemmap sysctl to enable or disable
the feature of optimizing vmemmap pages associated with HugeTLB pages.

v11:
  - Collect Reviewed-by from Mike.
  - Remove hugetlb_optimize_vmemmap_enabled() check from flush_free_hpage_work().

v10:
  - Collect Reviewed-by from Mike.
  - Remove hugetlb_optimize_vmemmap_enabled() check from
    hugetlb_optimize_vmemmap_pages() (Mike).
  - Add more explanation to Documentation/admin-guide/sysctl/vm.rst.
  - Fix cannot disable the feature via hugetlb_optimize_vmemmap sysctl (Mike).
  - Update patch 2's commit log (Mike).

v9:
  - Go back to v3 since checking the size of struct page at config time is
    very complex.

v8:
  - Fix compilation (scripts/selinux/mdp/mdp.c) error when
    CONFIG_SECURITY_SELINUX is selected.

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
  mm: hugetlb_vmemmap: disable hugetlb_optimize_vmemmap when struct page
    crosses page boundaries
  mm: memory_hotplug: override memmap_on_memory when
    hugetlb_free_vmemmap=on
  mm: hugetlb_vmemmap: use kstrtobool for hugetlb_vmemmap param parsing
  mm: hugetlb_vmemmap: add hugetlb_optimize_vmemmap sysctl

 Documentation/admin-guide/kernel-parameters.txt |   6 +-
 Documentation/admin-guide/sysctl/vm.rst         |  39 +++++++++
 include/linux/memory_hotplug.h                  |   9 ++
 mm/hugetlb_vmemmap.c                            | 105 ++++++++++++++++++++----
 mm/memory_hotplug.c                             |  27 ++++--
 5 files changed, 162 insertions(+), 24 deletions(-)

-- 
2.11.0

