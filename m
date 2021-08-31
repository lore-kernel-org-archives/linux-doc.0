Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33B39C432BE
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 13:21:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18D9B60FED
	for <linux-doc@archiver.kernel.org>; Tue, 31 Aug 2021 13:21:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhHaNWR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Aug 2021 09:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235634AbhHaNWQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Aug 2021 09:22:16 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7690C061760
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 06:21:21 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id w7so15521898pgk.13
        for <linux-doc@vger.kernel.org>; Tue, 31 Aug 2021 06:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GsWUUlqRM6xaooAMH6/u0lnxKvf1pa5+XIEe1KTGSvU=;
        b=AMSUHUxRbjxZ3rAo6TCl0ZVWkittLg32Qo+FUhDa3mJkCt4OtMM3OJnvDCXikRrmMG
         eFq3Sx3npB1zIrmaC0Xsmm35b8VhFmsj/KYW/B0gzVyMZ5w4RoW/HxF/VSgrCWKf4OHp
         vC6A8OW0Tx0C4eJd22yKT8dWPnYRjNggxMRa/Vn+fJcEYzcIgGThi6AEyp8BNprALc1c
         DppOPny0CjUE612X52d2Q/N/oMs5TO46yClbydS3yClR6obi1+UHCxPEcX63XXVIM+ej
         ENxSNCTkSZtTObSWIQhKtmuMIyr+4BuX7lmQf63KHN/EZiUOk3dfDClj89v9zbXAVrZC
         juIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GsWUUlqRM6xaooAMH6/u0lnxKvf1pa5+XIEe1KTGSvU=;
        b=d619XzmM4cNvrGnUHSBOczeAx1V+vp6XlPOrmmezSBiAe1GBazrs5RL4EQJglE5U1Y
         H51ZA92wHqm53UTYtfm+3dfFZQgM5rMiAAkSiGPvrihJOh0z0vQryfTDdatzAod3tCJA
         aKSPvFE6bDpsqRZJKdGQgFxq+YuSZTCgduuE2nuGmH1qmutInqxOs6rbGZFvoaSEZSN+
         Mu6QxVSBdQgWVPX6Zj893VwbCcI0RiU63L7NAUmRe16GvpnXK7QXXBX9KFoEefyv5Vfh
         LkEEKs7Geg4RHI7O/4Ewn0iS/mpqXuPuFvreS33wiNqYhUs4M5IETpKtEMSvZ8QsRZBn
         f8Sg==
X-Gm-Message-State: AOAM533m08ZiiR5oNaXf9hqXYDU2t6JcfyttyVZaIUVf1Jw7wD2JOxDK
        0kmg52KYc27lm7evf6uyy8ZeLQ==
X-Google-Smtp-Source: ABdhPJwcwA6muxuNEVXfiVFwtrkQS44Njfc3fF2ygtaKQ3zaos8mueS3k61o49prp411W3YvnuLK/g==
X-Received: by 2002:a63:185b:: with SMTP id 27mr27151622pgy.0.1630416081265;
        Tue, 31 Aug 2021 06:21:21 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.230])
        by smtp.gmail.com with ESMTPSA id k190sm9548352pgc.11.2021.08.31.06.21.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 06:21:20 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, vbabka@suse.cz
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v2 0/2] Do some code cleanups related to mm
Date:   Tue, 31 Aug 2021 21:21:09 +0800
Message-Id: <20210831132111.85437-1-zhengqi.arch@bytedance.com>
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

Changelog in v1 -> v2:
 - Fix some typo and code style problems.

Qi Zheng (2):
  mm: introduce pmd_install() helper
  mm: remove redundant smp_wmb()

 include/linux/mm.h  |  1 +
 mm/filemap.c        | 11 ++-----
 mm/memory.c         | 86 ++++++++++++++++++++++++-----------------------------
 mm/sparse-vmemmap.c |  2 +-
 4 files changed, 43 insertions(+), 57 deletions(-)

-- 
2.11.0

