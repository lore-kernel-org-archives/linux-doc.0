Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5101CC4332F
	for <linux-doc@archiver.kernel.org>; Mon, 14 Nov 2022 09:25:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236115AbiKNJZA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Nov 2022 04:25:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236712AbiKNJY7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Nov 2022 04:24:59 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C77BB4A9
        for <linux-doc@vger.kernel.org>; Mon, 14 Nov 2022 01:24:58 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso10032838pjc.5
        for <linux-doc@vger.kernel.org>; Mon, 14 Nov 2022 01:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2148sqylEkmjswFsMWG1hvqqLaO0xyf1SiCUhyBRhaQ=;
        b=wDmXeMBBM5jSJ/rpe94OT8vmZBocQzSOc2asE4+zf3/rv3ent4zKaT8mtg8PyjCFU5
         2RUzEpAC+0zcOMEnW/et/WDcoJYvUN3Uvq9sskGvYTdlE6Pn39zd81tE9UNAfHBNEtx4
         avQW9asTBmZiES1iB7Ux0C/jRhSnPPEPtLujUGby6LtECk1fjNAXPHIErxjf/S2/CqD7
         xoJHNK/933wBWaLG6toe5+DU8eAEIVkxat/mjG+0jU/ZSCn76zQR+CX6SLIDT6wLeAhg
         E+WK5T3IsQI62HF7yVJSqeyH9SWca57H0s5Zj38EUCAlKgbXpujmmr4YSUotKeezKjS6
         FM3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2148sqylEkmjswFsMWG1hvqqLaO0xyf1SiCUhyBRhaQ=;
        b=Q5bKx/ZN+4tVS4ydR/jEvJz/WbdZwhOgPeRAVuoZO+Sw14xPXpStsaixz/k4nDZJ2L
         gRcfAKx/qDAQgnsbGcXGlNh4kptqS3LKH4Av2K7gUSYaOvjSO0w4HJ1QEyvRDpPW0c0o
         j+GO2oRFhGdn0ZfniiVQSXMneSluzvTF4V97REf/mElBEaNqrUE/Vdmr/CxpfZDWxz50
         WCOwpx7z0sHgJQdh6KE9dcSpLMXpk0XiGqb9jSPzKAGDNskGate13sqA+yUwE7B1bQpa
         Phemx4HJFk4OTNM4FhIk12eAtzkALifmX+aEYrIpWCwtLvIW/A7JyYKOprKWZOs3mvGM
         qocg==
X-Gm-Message-State: ANoB5plnl+e3xsv7WwI/exJf/9MAJ3iP0PlSod6iAqqSR1BwcCiQbXMi
        cXCGZ8WS5y8dHml3aNV8ZYAkUQ==
X-Google-Smtp-Source: AA0mqf4JWvsDijQPfo/kXXptsIS2yyDPC0lc7dAS8Ff3VNNyq4RT1WTyw4YINmHAKX/obSA93DCkqA==
X-Received: by 2002:a17:90a:6d8f:b0:214:2ee7:3dc with SMTP id a15-20020a17090a6d8f00b002142ee703dcmr12797742pjk.105.1668417897845;
        Mon, 14 Nov 2022 01:24:57 -0800 (PST)
Received: from [10.68.76.92] ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902f54d00b00176b3c9693esm6852376plf.299.2022.11.14.01.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 01:24:57 -0800 (PST)
Message-ID: <404735fb-023d-df37-e88e-8b05981bc1d5@bytedance.com>
Date:   Mon, 14 Nov 2022 17:24:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [External] Re: [PATCH v2] mm: add new syscall
 pidfd_set_mempolicy().
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     corbet@lwn.net, mhocko@suse.com, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20221111084051.2121029-1-hezhongkun.hzk@bytedance.com>
 <20221111112732.30e1696bcd0d5b711c188a9a@linux-foundation.org>
From:   Zhongkun He <hezhongkun.hzk@bytedance.com>
In-Reply-To: <20221111112732.30e1696bcd0d5b711c188a9a@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Andrew,
> This sounds a bit suspicious.  Please share much more detail about
> these races.  If we proced with this design then mpol_put_async()
> shouild have comments which fully describe the need for the async free.
> 

Add some comments for async free, and use the TWA_SIGNAL_NO_IPI to
notify the @task.


-/*
- * mpol destructor for pidfd_set_mempolicy().
+/**
+ * mpol_put_async - free mempolicy asynchronously.
+ * @task: the target task to free mempolicy.
+ * @p : mempolicy to free
+ *
+ * @task must be specified by user.
   * free mempolicy directly if task is null or task_work_add() failed.
+ *
+ * A mempolicy can be either associated with a process or with a VMA.
+ * All vma manipulation is protected by mmap_lock.In process context
+ * there is no locking. If we need to apply mempolicy to other's
+ * task specified in pidfd, the original mempolicy may about to be
+ * freed by pidfd_set_mempolicy() while target task is using it.
+ * So,mpol_put_async() is used for free old mempolicy asynchronously.
   */
-void mpol_put_async(struct task_struct *task, struct mempolicy *p)
+static void mpol_put_async(struct task_struct *task, struct mempolicy *p)
  {
-       enum task_work_notify_mode notify = TWA_RESUME;
-
         if (!atomic_dec_and_test(&p->refcnt))
                 return;

@@ -333,10 +342,8 @@ void mpol_put_async(struct task_struct *task, 
struct mempolicy *p)
                 goto out;

         init_task_work(&p->w.cb_head, mpol_free_async);
-       if (task_work_pending(task))
-               notify = TWA_SIGNAL; /* free memory in time */

-       if (!task_work_add(task, &p->w.cb_head, notify))
+       if (!task_work_add(task, &p->w.cb_head, TWA_SIGNAL_NO_IPI))
                 return;
  out:
         kmem_cache_free(policy_cache, p);



Thanks.
