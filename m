Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A2CC4320A
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 04:23:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 733FF60F38
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 04:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbhH1EYK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 28 Aug 2021 00:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhH1EYI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Aug 2021 00:24:08 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62E5DC061796
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 21:23:18 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 2so7424841pfo.8
        for <linux-doc@vger.kernel.org>; Fri, 27 Aug 2021 21:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SytwcZ3slzMrwPHLF+d0jt/xfU49WkS6ECxozhc9DzA=;
        b=qKO96g6KVvRXq4DC0co2db52l9ZujayAG0s7UsyCWHZLDdPagPt5vIqPYNNFOtrSqN
         773TX2OAEYwZAEn/GEJ3FIFlXZr7xUWo0AQE8W0tykE6pRYKu+/QfDuE28PPJj2s/1yJ
         QZRrQ4aD0DYC75XrtqrYfqx+2UM13+UYqADyY0UaO0m6X1/Ei53Dq8kKNB724SOe/DJ8
         4fpFVSZdO0H/9cgyn67ShaZrd0QPv5IIquS0xzqld1ukBpP9hFsut2JALBpvJEWWA4TQ
         u4DdIfLbxrYdTeNS3G4iU9Yi0dF+CuAtTGS4QgaSpBrIJQao2gNVg1DH1nDW+D4X4J18
         sN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SytwcZ3slzMrwPHLF+d0jt/xfU49WkS6ECxozhc9DzA=;
        b=NW9yIGqE3sxRAf+B6eXscDm6bCik8lOvEBqBzpX5N8yJIYycmZgemsD4s+CWhhuuQL
         U1hzhitAVjUI+c/yImWKqLpaXxRVEDu7FdXzLHc7tiMnSaxPwsSK3LuFJep/q9X7LQ9Q
         SEic9DHHxvY/bhakZpayixbbJ1ItHWf/Cts7N5vHJoC5b/r4wjBfWkcHxqr+p8anVoAS
         GbEByJnpQNMi/HzT+3+eopGVcuMxuzIqgYdHmLCA7PVaeO4XYQHzhp6cZ948cqeNauVz
         41HWAE7bwDKimiiVr18JZ0HJCvAv4gY+Ej2HpY/PalHOtuGdMm4bIYlvy0+kvzkm/qQh
         5gzA==
X-Gm-Message-State: AOAM533jiFi/2BDTjQzydZ79pxvt6bLjr6bjE0C/+nE9NlKYClHXmLn4
        rdj/FRpsjO83Y6IUQLYXu9j5FA==
X-Google-Smtp-Source: ABdhPJz419LcXMpMxGynDgPvGjIkry8ZytVBB9N4+Rwa/XyNxnx8KvnePb+X6Jmc82cCdYItHAJvCA==
X-Received: by 2002:aa7:989d:0:b0:3ef:5f81:5c2f with SMTP id r29-20020aa7989d000000b003ef5f815c2fmr12237034pfl.44.1630124597106;
        Fri, 27 Aug 2021 21:23:17 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id u15sm4720383pfl.14.2021.08.27.21.23.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 27 Aug 2021 21:23:16 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v1 0/2] Do some code cleanups related to mm
Date:   Sat, 28 Aug 2021 12:23:04 +0800
Message-Id: <20210828042306.42886-1-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

This patch series aims to do some code cleanups related to mm.

This series is based on next-20210827.

Comments and suggestions are welcome.

Thanks,
Qi.

Qi Zheng (2):
  mm: introduce pmd_install() helper
  mm: remove redundant smp_wmb()

 include/linux/mm.h  |  1 +
 mm/filemap.c        | 11 ++------
 mm/memory.c         | 81 ++++++++++++++++++++++++-----------------------------
 mm/sparse-vmemmap.c |  2 +-
 4 files changed, 40 insertions(+), 55 deletions(-)

-- 
2.11.0

