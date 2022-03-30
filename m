Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7E1C433FE
	for <linux-doc@archiver.kernel.org>; Wed, 30 Mar 2022 15:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348277AbiC3PkI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Mar 2022 11:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348276AbiC3PkH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Mar 2022 11:40:07 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBAF33F8AF
        for <linux-doc@vger.kernel.org>; Wed, 30 Mar 2022 08:38:21 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id e5so20759173pls.4
        for <linux-doc@vger.kernel.org>; Wed, 30 Mar 2022 08:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IKVFgArMfLAYb/4tYUuGf6KEnDE92hMEQ9mU5hp/SXo=;
        b=y426lP1h9/gpMDvFsvkQcsWTR6r4t0uNFPGCXcCkQ0w4bDDfbd2I6w3MPvmSngD5aQ
         9UHKY99m4xTMn2S+VEWYRysvmEDjOdp+p+AaJE9UQlAtOAg9nnObmnt7SD/llMP+ydXX
         tEoTC4CvY+Alaz3nGiPuulcsMVs4yV+CghqyvhjrIdjT4SEbjXtkkYdOiUQNNPovNO65
         zooFZEF1EAKY+iSmwmGDYeeIlMmOyMmQg3y3cSgjUo/6mm1bLvfygA1ZudpOBLvdKOnK
         IAyYWShhvc4qIrg9j5+ZR6S93sOYQk7CUSaTKoYVYl/japXdL0WlkQnS9qvagsSwyJE5
         F5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IKVFgArMfLAYb/4tYUuGf6KEnDE92hMEQ9mU5hp/SXo=;
        b=WT+Zc7KMfy30ezgXcGZ39LCsVPNFy7kuczROms2eHDg+TXV+XyN/wtK36nd4LBkm2k
         Ua+BIt69x88gnVkQnA6HyFO5QnlJZGmR0MIQIkhVk+rQDjAA/A81PkdkSFrAq7QVnkQf
         vm65CGY5FtJdJtlHlW5xm5L9pl0h0Ezc3AP4GRPkrMp9vDSSnI7j8jMqB95tsOx01h0S
         8GTmx+DBuS61G3KXHZ/XyIzcTx9XJX4PAOaCmsCGyA63xjNJEw8+J23uZFW+HHv5ET+I
         6bW77DQcCWkuZ+nvrNHFAYMhTea+PyN7c99Vntn4fXcph8OXFFRtB1Lije3kJn3gJB0i
         KQzQ==
X-Gm-Message-State: AOAM532h4s/gOur/hQQnVqpBcJlTKyFihxvFb7GFjfnesQ/pefdPRbCY
        N5hmoA1Ei9cKsI32HKGLl6Fv8g==
X-Google-Smtp-Source: ABdhPJyx8KyO7z1oyOwVys9x6GkHA4ruaJjbZc4MyGqZcrWkQvN5DIzM1+TzQgmsyw0Tgim4c9azmA==
X-Received: by 2002:a17:902:d3c5:b0:154:a3b5:d918 with SMTP id w5-20020a170902d3c500b00154a3b5d918mr161632plb.91.1648654701358;
        Wed, 30 Mar 2022 08:38:21 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.239])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090aa40800b001c6ccb2c395sm6686039pjp.9.2022.03.30.08.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 08:38:21 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v6 0/4] add hugetlb_free_vmemmap sysctl
Date:   Wed, 30 Mar 2022 23:37:41 +0800
Message-Id: <20220330153745.20465-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series is based on next-20220310.

This series amis to add hugetlb_free_vmemmap sysctl to enable the feature
of freeing vmemmap pages of HugeTLB pages.

v6:
  - Remove "make syncconfig" from Kbuild.

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

 Documentation/admin-guide/sysctl/vm.rst |  14 ++++
 Kbuild                                  |  15 ++++-
 include/linux/memory_hotplug.h          |   9 +++
 include/linux/mm_types.h                |   2 +
 include/linux/page-flags.h              |   3 +-
 kernel/sysctl.c                         |   2 +-
 mm/hugetlb_vmemmap.c                    | 109 ++++++++++++++++++++++++--------
 mm/hugetlb_vmemmap.h                    |   8 ++-
 mm/memory_hotplug.c                     |  27 ++++++--
 mm/struct_page_size.c                   |  20 ++++++
 10 files changed, 171 insertions(+), 38 deletions(-)
 create mode 100644 mm/struct_page_size.c

-- 
2.11.0

