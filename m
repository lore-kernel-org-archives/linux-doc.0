Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2F3C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  2 Mar 2022 08:38:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237495AbiCBIi6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Mar 2022 03:38:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238241AbiCBIi5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Mar 2022 03:38:57 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F84B57B27
        for <linux-doc@vger.kernel.org>; Wed,  2 Mar 2022 00:38:14 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id t5so1299406pfg.4
        for <linux-doc@vger.kernel.org>; Wed, 02 Mar 2022 00:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vuEh+AI7I41MHfBSDW5EnBJuRobxoamBcasQOIbr9mQ=;
        b=sfEqtVNUj5HIF8CigOLeWbLBoDWueQR0b20mz1nn9AqoSfduKJKT70rSGeiEqEzhBf
         yV1Cq1xlHEDEYGCnRq25O/4AaRGD9mZ0gtZ4DUciOazXXLhAranVxaL1KeGaflg+qegU
         dSXS2PGsDrKiJg/gHZklR4CF5f0SGkpS4IGSRievgS07uJDno19REjORMY7s2P06TST/
         z/QfCQFFr8i+63CsYezyN+v2CtW25vdY8hGpoWdwVj1HaO/pxE8wqOqPcf09CFSStKeD
         NfTV9Nx69m00GA0AJXa1M3znvHypHqbYlfliibNuheLupZ2QhxMzmm5NdNSjPSk/9Pam
         /m+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vuEh+AI7I41MHfBSDW5EnBJuRobxoamBcasQOIbr9mQ=;
        b=cPmB1JCzo67+FMJvcmLYrLzQsiEY7uukegsS36fOSHTPuwtU94korm2fIhnYc92WP3
         GCWrusN49nFeRMjR4Tr35wg7yf+8dY5QKnWSPVpEiobRnuBwZ95XaVfYQ+iPB2CB0Ouz
         4o3fk19XNsNNrDTJ57JFQ9vJZW1T2tOACNYdAp0eTO0UFyfECHVPOaL6uwlZ9rCGwtEx
         CAwAZqcfY00N0p0/9TzZXN+r8QyVUWC6+aiTyCrwUdUJjuHVhXTOvPgyoMXnlvGrYiAP
         ovpNxbpk0nuO4+5Da+qhL80UNSUtNirKCtW57g5E0LN08bryY3NZK2Ue0VODyyH9RR11
         DJCQ==
X-Gm-Message-State: AOAM530Y3hU7Ai3I+UuUPOX6qE2Q2s32EBIqTDvPDGRUSuraY1x3BW6J
        5W9KdwsjaOS27ptc4C+8D/WzAvsx2oUJVuCiqQk=
X-Google-Smtp-Source: ABdhPJyU/gzUwFPTrqmH05EFsV7a1BMv2sPR5Joj21ZAEsQWWG5rtcN1Y9u5yF57S/oKVnjRhx/VQw==
X-Received: by 2002:a05:6a00:2cd:b0:4e1:1989:5b7f with SMTP id b13-20020a056a0002cd00b004e119895b7fmr31678105pft.3.1646210293519;
        Wed, 02 Mar 2022 00:38:13 -0800 (PST)
Received: from FVFYT0MHHV2J.bytedance.net ([61.120.150.70])
        by smtp.gmail.com with ESMTPSA id 17-20020a056a00071100b004f0f941d1e8sm18705141pfl.24.2022.03.02.00.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 00:38:13 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 0/3] add hugetlb_free_vmemmap sysctl
Date:   Wed,  2 Mar 2022 16:37:55 +0800
Message-Id: <20220302083758.32528-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series amis to add hugetlb_free_vmemmap sysctl to enable the feature
of freeing vmemmap pages of HugeTLB pages.

v2:
  - Fix compilation when !CONFIG_MHP_MEMMAP_ON_MEMORY reported by kernel
    test robot <lkp@intel.com>.
  - Move sysctl code from kernel/sysctl.c to mm/hugetlb_vmemmap.c.

Muchun Song (3):
  mm: hugetlb: disable freeing vmemmap pages when struct page crosses
    page boundaries
  sysctl: allow to set extra1 to SYSCTL_ONE
  mm: hugetlb: add hugetlb_free_vmemmap sysctl

 Documentation/admin-guide/sysctl/vm.rst | 13 ++++++++++
 include/linux/memory_hotplug.h          |  9 +++++++
 kernel/sysctl.c                         |  2 +-
 mm/hugetlb_vmemmap.c                    | 43 ++++++++++++++++++++++++++++++++-
 mm/hugetlb_vmemmap.h                    |  4 ++-
 mm/memory_hotplug.c                     |  5 ++++
 6 files changed, 73 insertions(+), 3 deletions(-)

-- 
2.11.0

