Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E18D0C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jul 2022 04:05:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231776AbiGUEFY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jul 2022 00:05:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbiGUEFO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jul 2022 00:05:14 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C42D9F07
        for <linux-doc@vger.kernel.org>; Wed, 20 Jul 2022 21:05:09 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id ku18so465758pjb.2
        for <linux-doc@vger.kernel.org>; Wed, 20 Jul 2022 21:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WvvOz2ooNKkLxp1jXKzvkeS5wEgSxLKRgm307TatvVA=;
        b=ckpgDrLr6CFyxohwrqrpXwyXKp11JVoiQ5DiMMTylXQa6I8xWS3YYhh2dta4ECXV7Y
         vTIbxjVYUENY381COkF0BRbUPBUYVORJWIqY2OUWTgTWOOAxKfAZu6dl8Lz3Y4A1NKFD
         jlijrV7S3zgzVs/RUtm7sH9g4u2y3/w7UIAoU7BtZqVC99Fv7S2494Bu9tR3W0xK+vHX
         ZaBd3K32+MGH5I/mM7pSXZklcuCPk6DY8Q/gZefUKml2rPT3teNNVZ+od0kPRqPXwkHB
         3fk6nKf974fgJYcPhIIJoGu8eaHUnYL9J15Y6ZowtSnP6E0bzgwAs5z5JVE0QALCyNoV
         /pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WvvOz2ooNKkLxp1jXKzvkeS5wEgSxLKRgm307TatvVA=;
        b=e4hxZfns/xnWBi88AlS6xhXSl+I5qLN9zOjgJbWVc6nvcyer/39+raTlKIFAy9whVx
         Rl09cAZs5H9xkQwJmLeyNSzl39h0k8+XMWLYO/jz6DlXGXwWqXpZW7lpdOhzJHjDDejd
         2h2IgsHfaKQrAFsrImFLGYT1aTb5noiMkFvXNopi1Lk9gw2gQz4A4YIkvlvfIeau7eIj
         Yfzqj+NJGRbKyqNxNxQWa+0WM8pPah2xsfGmTwg1Iv/uNj6+4ffvMYhue1Uj1NwW7i6e
         /VzoZU5YeRdtGgeZRTeH3XfR6QpnpPIxwHtrS15W/mLGRyMJrZCPNITJF5qaZneygzss
         oxrQ==
X-Gm-Message-State: AJIora9Fowo9weCjK56ZfKeMbfqGE9cyk2fP9t5xZ6c8YN4qE5Glnhnt
        WdCkxaJZRB0xiVrD6zb29qfY5w==
X-Google-Smtp-Source: AGRyM1sTf0wPzfxVI0+e4iyKEpi2Pmdf28lKPn7ux0IdbOj3q31jhmFOwSQ0nuCDaFIu5xd/qhUvhA==
X-Received: by 2002:a17:90b:17c1:b0:1f0:1fc9:bcc7 with SMTP id me1-20020a17090b17c100b001f01fc9bcc7mr9332859pjb.53.1658376309176;
        Wed, 20 Jul 2022 21:05:09 -0700 (PDT)
Received: from C02CV1DAMD6P.bytedance.net ([139.177.225.228])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902684400b0016bdf0032b9sm384368pln.110.2022.07.20.21.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 21:05:08 -0700 (PDT)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     hannes@cmpxchg.org, surenb@google.com, mingo@redhat.com,
        peterz@infradead.org, tj@kernel.org, corbet@lwn.net,
        akpm@linux-foundation.org, rdunlap@infradead.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        songmuchun@bytedance.com, cgroups@vger.kernel.org,
        Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH 3/9] sched/psi: move private helpers to sched/stats.h
Date:   Thu, 21 Jul 2022 12:04:33 +0800
Message-Id: <20220721040439.2651-4-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220721040439.2651-1-zhouchengming@bytedance.com>
References: <20220721040439.2651-1-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch move psi_task_change/psi_task_switch declarations out of
PSI public header, since they are only needed for implementing the
PSI stats tracking in sched/stats.h

psi_task_switch is obvious, psi_task_change can't be public helper
since it doesn't check psi_disabled static key. And there is no
any user now, so put it in sched/stats.h too.

Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
---
 include/linux/psi.h  | 4 ----
 kernel/sched/stats.h | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/psi.h b/include/linux/psi.h
index 89784763d19e..aa168a038242 100644
--- a/include/linux/psi.h
+++ b/include/linux/psi.h
@@ -18,10 +18,6 @@ extern struct psi_group psi_system;
 
 void psi_init(void);
 
-void psi_task_change(struct task_struct *task, int clear, int set);
-void psi_task_switch(struct task_struct *prev, struct task_struct *next,
-		     bool sleep);
-
 void psi_memstall_enter(unsigned long *flags);
 void psi_memstall_leave(unsigned long *flags);
 
diff --git a/kernel/sched/stats.h b/kernel/sched/stats.h
index baa839c1ba96..c39b467ece43 100644
--- a/kernel/sched/stats.h
+++ b/kernel/sched/stats.h
@@ -107,6 +107,10 @@ __schedstats_from_se(struct sched_entity *se)
 }
 
 #ifdef CONFIG_PSI
+void psi_task_change(struct task_struct *task, int clear, int set);
+void psi_task_switch(struct task_struct *prev, struct task_struct *next,
+		     bool sleep);
+
 /*
  * PSI tracks state that persists across sleeps, such as iowaits and
  * memory stalls. As a result, it has to distinguish between sleeps,
-- 
2.36.1

