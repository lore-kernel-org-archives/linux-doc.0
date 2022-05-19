Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 547CEC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 19 May 2022 12:47:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237051AbiESMrV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 May 2022 08:47:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232653AbiESMrU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 May 2022 08:47:20 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E237B41CD
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 05:47:19 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id w17-20020a17090a529100b001db302efed6so5139847pjh.4
        for <linux-doc@vger.kernel.org>; Thu, 19 May 2022 05:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MYyQzWIkXnUbU1T1yV7uK/sxU37R6l9GZVdK4va9skk=;
        b=ob80Nu+DvgBQqlGy9viAvvN+Y1H0mwtXx4Pges6V0kIBMypwpwyU7ngXS1hY4rCv4S
         2+hn+fRPoo0mzqjyXh8RNxmH/2RNBLxRpuiK2qdMy8hJea5OEgZ9uFyGH9SB1q6ZB/7M
         dC3C14yvbbkfLxwVghh9hjXeh9Lk1ajHkS3DoeMfRMbXXrnqLUxqluzMQ/92ljh1Y6WS
         fTUxvteiaDTG7x5Y+5p4GgHINsCQiiigukNYGq+zz6A0CwAqjIIZwnCpKtldYkpklino
         kAxW5yG+LbYanEKaIczWYa0DTZJqnelRbUQujHjI+Jr4Iuhdav0NGSnW8O/YjtB9VSKr
         rMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MYyQzWIkXnUbU1T1yV7uK/sxU37R6l9GZVdK4va9skk=;
        b=t5cKkZNOnycqsmAFRzU9GSYb7S8CM1qPxkM7I+5BjH36EKlbDZVbnpIXIqkgUt4972
         FuXPlV2YizmUR4rM1e1GZT1kBdTJF0Zzeo9xO/r4rwAZSOlLTzwUZkMu2JEXqs1Vr+jH
         /Ofxsn96W+MVLQE8HpctFfMSZu2bspU5DILM45YxL24nE7yZYrJLNB3W/9vI1x6SFfdd
         okw/eSIRWau03XmtO+t5MUjiLwz6Y6oy2Yh9FRCwRg5jIImb7yXjqNed1GAzti19moka
         eWtlEFkyKNoT3tpFiqMFgSrMo8QaZZTiXCLz/ltM1z1pyUq6lQVfPH2PS8zaJ2V0GMF6
         g9yA==
X-Gm-Message-State: AOAM532M+1WQFRlcMxo/Y4JqHfDRDzngfbiLGM45/DYfidZMOZKplfm9
        rqtB8j5SnH+VnAGGav37Gg/Qkw==
X-Google-Smtp-Source: ABdhPJycf0UwFL4j5UsDQkKQ5X/wvf0fu1bLu6kuYhyo6aK3RZdKkzJvN6bnL9bmKHDTC1Nvt3teRw==
X-Received: by 2002:a17:90a:9b0d:b0:1dc:e81d:6c18 with SMTP id f13-20020a17090a9b0d00b001dce81d6c18mr5134445pjp.72.1652964438708;
        Thu, 19 May 2022 05:47:18 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id t5-20020a17090ad14500b001d960eaed66sm3441296pjw.42.2022.05.19.05.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 05:47:18 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, akpm@linux-foundation.org, paulmck@kernel.org,
        mike.kravetz@oracle.com, osalvador@suse.de, david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 0/2] make hugetlb_optimize_vmemmap compatible with memmap_on_memory
Date:   Thu, 19 May 2022 20:46:30 +0800
Message-Id: <20220519124632.92091-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This series makes hugetlb_optimize_vmemmap compatible with memmap_on_memory
and is based on next-20220518.
The reason refers to the patch 2's commit log.

Muchun Song (2):
  mm: memory_hotplug: enumerate all supported section flags
  mm: memory_hotplug: introduce SECTION_CANNOT_OPTIMIZE_VMEMMAP

 Documentation/admin-guide/kernel-parameters.txt | 22 ++++-----
 Documentation/admin-guide/sysctl/vm.rst         |  5 +-
 include/linux/kconfig.h                         |  1 +
 include/linux/memory_hotplug.h                  |  9 ----
 include/linux/mmzone.h                          | 64 +++++++++++++++++++++----
 mm/hugetlb_vmemmap.c                            | 28 ++++++++---
 mm/memory_hotplug.c                             | 28 +++++------
 mm/sparse.c                                     |  8 ++++
 8 files changed, 112 insertions(+), 53 deletions(-)

-- 
2.11.0

