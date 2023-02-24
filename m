Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19A61C64ED8
	for <linux-doc@archiver.kernel.org>; Fri, 24 Feb 2023 09:35:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229893AbjBXJfW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 24 Feb 2023 04:35:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbjBXJfU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 24 Feb 2023 04:35:20 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15516662A3
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 01:35:09 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so1654927wmb.5
        for <linux-doc@vger.kernel.org>; Fri, 24 Feb 2023 01:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFfq5teius6pAK1nmf1oSiYVaS3V8Wiqx9qF8KZNMCQ=;
        b=UPtzcx8EFj1zlSxQ6lMU0mkanMgYYtKeaO2lWxoPNm90eUsDg5dZ1+YuhJFLZ9eA1C
         GwVX/XBU0wi8bbZqS4brymorHHXxUfabheM649o6i0SQ/aVibdS9bgWV9lK6GXWoyCxV
         DDBMfSwJFsDs+VxTsL6tGbeInl0ZqUq5wfYvFDMQ9DRbPWoCbA/6Cvincqhb8n8A/JMv
         yF2u9O9DHpm/uv9CcBKmrH4ca42lGrIqrseUJRNneFVCwHJafcuPzxjA18lvOlidR6dV
         8ry4CjCYix+BYGvJUnF6KeUvdaZAfzJwDqJXYi1r+dRV7oZAoBl3+BLYwTygm+t5PEOr
         SgfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFfq5teius6pAK1nmf1oSiYVaS3V8Wiqx9qF8KZNMCQ=;
        b=DC/TuQkdUiytrI6YNI5bC9JVnQVDj53ksGEp55CFVAYhe0uKBdw5RCiq6MBJ6vdFL9
         RuKUTvYhkcrK1eSCgvubKBC3k+6dn0IbZQJKVQYl4IkB4E9KWKFQ53wEl/NvHT4YyHF/
         vxS9sCNQYq/N0CJHBhc/nu55GHlJq5RnQyK6vIbSnqSYTM/wu01s7pS86ymfuzJZzhIr
         uOwNn+68PjoZncBgNNCWaOeInW3m0Zvq8ZJ0BPdIxSY3SK9hF4tgvNNFUKTLyVQecmEV
         GozHyd/AauqDpf1yMnteDa7sGJKguPgOfYzhrhHvfLPWpdAlV281YIsKkbNDYanqVGSi
         oa4g==
X-Gm-Message-State: AO0yUKXmFchkKZX8o+1I86npLcrXJVk/HyN/XqDC4BUfNmadX8PXij3C
        Dhfv2xeVZ90QM8IH/df+BcX6cQ==
X-Google-Smtp-Source: AK7set8uakOUbvmySBPvXTJA5HuapKBeA4BG/N82btii8y/1ofW049QHU4eTRDVwR0fxueKtyIIuAw==
X-Received: by 2002:a05:600c:1da2:b0:3ea:ed4d:38fc with SMTP id p34-20020a05600c1da200b003eaed4d38fcmr2179606wms.31.1677231307168;
        Fri, 24 Feb 2023 01:35:07 -0800 (PST)
Received: from vingu-book.. ([2a01:e0a:f:6020:a6f0:4ee9:c103:44cb])
        by smtp.gmail.com with ESMTPSA id d18-20020a05600c34d200b003e6dcd562a6sm2239179wmq.28.2023.02.24.01.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 01:35:06 -0800 (PST)
From:   Vincent Guittot <vincent.guittot@linaro.org>
To:     mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
        mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
        linux-kernel@vger.kernel.org, parth@linux.ibm.com, tj@kernel.org,
        lizefan.x@bytedance.com, hannes@cmpxchg.org,
        cgroups@vger.kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org
Cc:     qyousef@layalina.io, chris.hyser@oracle.com,
        patrick.bellasi@matbug.net, David.Laight@aculab.com,
        pjt@google.com, pavel@ucw.cz, qperret@google.com,
        tim.c.chen@linux.intel.com, joshdon@google.com, timj@gnu.org,
        kprateek.nayak@amd.com, yu.c.chen@intel.com,
        youssefesmat@chromium.org, joel@joelfernandes.org,
        Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v12 7/8] sched/core: Support latency priority with sched core
Date:   Fri, 24 Feb 2023 10:34:53 +0100
Message-Id: <20230224093454.956298-8-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230224093454.956298-1-vincent.guittot@linaro.org>
References: <20230224093454.956298-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Take into account wakeup_latency_gran() when ordering the cfs threads.

Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
Tested-by: K Prateek Nayak <kprateek.nayak@amd.com>
---
 kernel/sched/fair.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index dc7570f43ebe..125a6ff53378 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11949,6 +11949,9 @@ bool cfs_prio_less(const struct task_struct *a, const struct task_struct *b,
 	delta = (s64)(sea->vruntime - seb->vruntime) +
 		(s64)(cfs_rqb->min_vruntime_fi - cfs_rqa->min_vruntime_fi);
 
+	/* Take into account latency offset */
+	delta -= wakeup_latency_gran(sea, seb);
+
 	return delta > 0;
 }
 #else
-- 
2.34.1

