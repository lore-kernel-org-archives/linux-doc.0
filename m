Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 882307D917
	for <lwn-linux-doc@archive.lwn.net>; Tue, 19 Mar 2019 23:56:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727432AbfCSX4e (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 19 Mar 2019 19:56:34 -0400
Received: from mail-qk1-f201.google.com ([209.85.222.201]:36224 "EHLO
        mail-qk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727418AbfCSX4d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 19 Mar 2019 19:56:33 -0400
Received: by mail-qk1-f201.google.com with SMTP id y64so11579942qka.3
        for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2019 16:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=Hcsw4jWN1hMUQas5fk8qH4/pHraV7uLJWBMnp4emY1w=;
        b=kkRScrd31+enlreI5z0oUEdvclr3JCffoxWlBxgdfvsiHG+l1qdm7rpPzTM74AffEB
         LfPQCYRFRkk5MVQ3Sswlo00GL73nAMZLv5CUblp9iwglJ0iHORdkEQbjcmg+RAyhtDSK
         O9SwD0WRSCDe+dqmFFjegvme5136ckLAkDUHKL6mVSMZP0sNbLYuvx8Ezdf706E/KfDY
         9fBeMjXuR3YFS9h86rSzKNERDrjqmseba0FXjHr885Gzr4DFfIZy5quXrHuTBM0lthvA
         9RXHgsNWSfaXr1nwN76MY2akaLAzeMLaPr9LrKq+sgEJNGwUCyr6TQwEqhNFsTdPpUau
         OdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=Hcsw4jWN1hMUQas5fk8qH4/pHraV7uLJWBMnp4emY1w=;
        b=Kb0DTBDEql+wSeyDMpNgVG+Sq5JDagCn0A2HpDwBZRn7pvaHnQ6BUeW5J243rFf3Ce
         SpAkjHHxdCJw2rn0D0wDRuURKptB73Ge9IMon0HRWqJvt8vHJXuDJoTG44c+aGgLYtTQ
         ri/xHg8MCKsz5zabLWaGsqwLTW03S5gu7hEJijGUnPcp7LC/9/CkWzgHo9eqXmvg5Fz9
         36Z0ezs1N0yp4ZJ6eSF8TmtZ6hdBHYWg49F9fq20Ic13TT7HwX1OiPhjoRTOqGNwXHVR
         fb0DPXCzAh2xGmYRl4TGrmsYZnhpf7A8WaoNaheO4htcQQDmIHvheg//L+5ClB4uSK8b
         oOxQ==
X-Gm-Message-State: APjAAAXLwgg9AcBUsrLKPzMtLV82u74/PGSKrdp7KTiVFMzNeFhWyzqx
        reAgsdV5b97J/DGlwV07gNxeWV/6TaY=
X-Google-Smtp-Source: APXvYqwR1TAk3oGEqI2JtJ8ECEcet2nolarI6UbO1myJOnWcfePT76GDZJa39xicW9tBqtTiou2qy4qktOo=
X-Received: by 2002:ac8:2e7a:: with SMTP id s55mr13937762qta.34.1553039792366;
 Tue, 19 Mar 2019 16:56:32 -0700 (PDT)
Date:   Tue, 19 Mar 2019 16:56:14 -0700
In-Reply-To: <20190319235619.260832-1-surenb@google.com>
Message-Id: <20190319235619.260832-3-surenb@google.com>
Mime-Version: 1.0
References: <20190319235619.260832-1-surenb@google.com>
X-Mailer: git-send-email 2.21.0.225.g810b269d1ac-goog
Subject: [PATCH v6 2/7] psi: make psi_enable static
From:   Suren Baghdasaryan <surenb@google.com>
To:     gregkh@linuxfoundation.org
Cc:     tj@kernel.org, lizefan@huawei.com, hannes@cmpxchg.org,
        axboe@kernel.dk, dennis@kernel.org, dennisszhou@gmail.com,
        mingo@redhat.com, peterz@infradead.org, akpm@linux-foundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-team@android.com, Suren Baghdasaryan <surenb@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

psi_enable is not used outside of psi.c, make it static.

Suggested-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 kernel/sched/psi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 22c1505ad290..281702de9772 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -140,9 +140,9 @@ static int psi_bug __read_mostly;
 DEFINE_STATIC_KEY_FALSE(psi_disabled);
 
 #ifdef CONFIG_PSI_DEFAULT_DISABLED
-bool psi_enable;
+static bool psi_enable;
 #else
-bool psi_enable = true;
+static bool psi_enable = true;
 #endif
 static int __init setup_psi(char *str)
 {
-- 
2.21.0.225.g810b269d1ac-goog

