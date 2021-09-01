Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F01A2C432BE
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 10:27:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D8D0E60F6F
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 10:27:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235131AbhIAK23 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Sep 2021 06:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234997AbhIAK23 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 1 Sep 2021 06:28:29 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B85C061575
        for <linux-doc@vger.kernel.org>; Wed,  1 Sep 2021 03:27:32 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id x4so2322797pgh.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Sep 2021 03:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rdLWPNlr2o2VGQKs6yMiulbcewjUkJEpjEDyxs856Jo=;
        b=HQh5dd3NEOPvmgmvw5Hm2HI//JYez9GvSeWCvLHE/l7cDlybq6m5QB/DQw2oFnbUyX
         6lqNLpQ7aR/qL9dBjLIPOvIQwlCE2UuJGeK1E6qBpZyGk7N0i4Nnvzg2aAAtEV6Y+0mi
         RhEQkI2zxhc/clSNpvArSD/j/fqeSH6Zz6uThMdrOdyV8vWmGjT7wioKUr02+NeDOyad
         dDw4gKSKZFnmmeZ+Sdx8alU22hPKmQJbhBzyreDjkQ3XREdtwb08Xld6QaL49vOyH+JI
         zMtp3UOu7lCzZreZaPiCdMz6P3BlzfYjs59ljp1Rad46Jrkc/ytjyoTa8O71uRlhAKgP
         Vevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rdLWPNlr2o2VGQKs6yMiulbcewjUkJEpjEDyxs856Jo=;
        b=TkQqZoTkS0Lh6PWW5XheOTjIU4phDTNxH8iPaN+2XJl2Yib+PjVbydcOazP8svgqeV
         ZYGf+6GpQuEITkKpee8ZMvfQME7Qs+sClAJslp9GHXWCRfPgJB6U8/8f3T9092DwLric
         q3xLGecDRwAw8STcNCwwpi3XdIifguDP8Y/d2J0L4DAIN5WgsOPAOUWV1Fsa99BTRR1p
         Mrq3EjIC4782xDybfHcvioufhgqQsEiwHHD22q1dAeWOgsCD4MEctOwwcwkl6ZqeNjjM
         uv1iMAWsA26z7ycLJ+e79j7vUeWlUpy1LM7tTvKVNYdmDZs6PqJV7BXOpLe3sw9Abx/E
         44vg==
X-Gm-Message-State: AOAM530Of8A5SzMVp6H8x+dJ4JYGMPP6tViovfVUGU3pax97Je/WnRo/
        AsvjgCqqfnSb0vQi9hj5VcMPIVppY45foA==
X-Google-Smtp-Source: ABdhPJxwN7E+eBlVRqTpWQPGRAkwixB/l2TIHvOUXhSDO+sI8n8sfWMEdbyDMhle95rN6O8ZZqsmHg==
X-Received: by 2002:a63:515f:: with SMTP id r31mr31104283pgl.41.1630492052286;
        Wed, 01 Sep 2021 03:27:32 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id i10sm5291497pfk.87.2021.09.01.03.27.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Sep 2021 03:27:31 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de, hannes@cmpxchg.org,
        mhocko@kernel.org, vdavydov.dev@gmail.com,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, vbabka@suse.cz
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v3 0/2] Do some code cleanups related to mm
Date:   Wed,  1 Sep 2021 18:27:20 +0800
Message-Id: <20210901102722.47686-1-zhengqi.arch@bytedance.com>
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

Changelog in v2 -> v3:
 - Move the declaration of pmd_install() to mm/internal.h

Changelog in v1 -> v2:
 - Fix some typo and code style problems.

Qi Zheng (2):
  mm: introduce pmd_install() helper
  mm: remove redundant smp_wmb()

 mm/filemap.c        | 11 ++-----
 mm/internal.h       |  1 +
 mm/memory.c         | 86 ++++++++++++++++++++++++-----------------------------
 mm/sparse-vmemmap.c |  2 +-
 4 files changed, 43 insertions(+), 57 deletions(-)

-- 
2.11.0

