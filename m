Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E6CC00140
	for <linux-doc@archiver.kernel.org>; Wed, 24 Aug 2022 08:19:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234045AbiHXITy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Aug 2022 04:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235202AbiHXITx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Aug 2022 04:19:53 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C98CD22A
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 01:19:51 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id p185so1325598pfb.13
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 01:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=HEbBlNE74XAOeDaqxFIrSXJjdeTVN4APARuNyd0Kkrc=;
        b=XG5IJm+fVYs18/E3Fxu0pVrfrCgjv+nZ+l1p2BXLUiSKR3+DLxwsecj0VsQmLyKeiy
         u3emI9DCR+vp1DaZHoMZIDR8kuSyRe25o5OtavgfUU++zW8VMduwVMX94ebgn/HQjy9f
         GylD73ZClQBsEq1CUEmHq1IXpyn722i7yKTXkUF8wzFQUhtW//SStvpHw0zgSVzLOkmV
         ZkxUyK/cD3yRuG+ya7SyXQsEJJYXwfj9MIsH32g5D/ey71a4uKLsjfrWZnEjTmIJabon
         VfH8O/9u0ducGF8idUzlAYkUWr2Mc5k2gzh/FN++XngFPlag+2t86eNsnuZdglakynFc
         l/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=HEbBlNE74XAOeDaqxFIrSXJjdeTVN4APARuNyd0Kkrc=;
        b=1OpTaPJRUTtwF8bBRmH12gPrnRmhoOz5RZHCLrZ7JsEEnuZQd8EqmKK3+Z2L/pjqoP
         ChtQR+wBCdOYNQ+Q1B3g+lY4Mpxj7YYrW6Vxk0JVGQDl0o+UVo1TmIKPMQPr3IUzeq9n
         8k3zc4efUWx9thcUAi1m1L8ZHEVyQm68Xgt99jhL3spWivc2ggPvD8Y1xc8JrkxCyw2j
         XLp4drtd9lR+eI9EtiJtEqguNR1c9RnNN0bEYo00WnV9GJPUEffUb5p3z8BiPr8WrUhJ
         wSBsQMuSNEPomqR++CaH1nNFzdBncxGNDxd+MNnL7rcbTvaycHh4uLSg8y53pu3BcVu1
         Q4Kg==
X-Gm-Message-State: ACgBeo3H12MO9Vg87RT71fDz/JyfZqlYLEYuH3SANLjVn3TULQJzobmo
        HXhMTTm+HuYHu5jJryhM/wUj6Q==
X-Google-Smtp-Source: AA6agR7tzL8eaVCAjYwevawfVzwdWlzsLcP2irafzEzzW6hZqw5AJNo0GK4S+veu0lp6GXX0tnXaeQ==
X-Received: by 2002:a63:5b4c:0:b0:42a:2fe:2f83 with SMTP id l12-20020a635b4c000000b0042a02fe2f83mr22495338pgm.413.1661329191386;
        Wed, 24 Aug 2022 01:19:51 -0700 (PDT)
Received: from C02CV1DAMD6P.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id q31-20020a635c1f000000b00421841943dfsm10486587pgb.12.2022.08.24.01.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Aug 2022 01:19:51 -0700 (PDT)
From:   Chengming Zhou <zhouchengming@bytedance.com>
To:     tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com,
        surenb@google.com
Cc:     gregkh@linuxfoundation.org, corbet@lwn.net, mingo@redhat.com,
        peterz@infradead.org, songmuchun@bytedance.com,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chengming Zhou <zhouchengming@bytedance.com>
Subject: [PATCH v3 02/10] sched/psi: don't create cgroup PSI files when psi_disabled
Date:   Wed, 24 Aug 2022 16:18:21 +0800
Message-Id: <20220824081829.33748-3-zhouchengming@bytedance.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220824081829.33748-1-zhouchengming@bytedance.com>
References: <20220824081829.33748-1-zhouchengming@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

commit 3958e2d0c34e ("cgroup: make per-cgroup pressure stall tracking configurable")
make PSI can be configured to skip per-cgroup stall accounting. And
doesn't expose PSI files in cgroup hierarchy.

This patch do the same thing when psi_disabled.

Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
Acked-by: Johannes Weiner <hannes@cmpxchg.org>
---
 kernel/cgroup/cgroup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index 03dbbf8a8c28..2f79ddf9a85d 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -3748,6 +3748,9 @@ static void cgroup_pressure_release(struct kernfs_open_file *of)
 
 bool cgroup_psi_enabled(void)
 {
+	if (static_branch_likely(&psi_disabled))
+		return false;
+
 	return (cgroup_feature_disable_mask & (1 << OPT_FEATURE_PRESSURE)) == 0;
 }
 
-- 
2.37.2

