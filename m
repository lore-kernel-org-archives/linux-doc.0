Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2896E7D91A
	for <lwn-linux-doc@archive.lwn.net>; Fri,  8 Mar 2019 18:44:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbfCHSn3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 8 Mar 2019 13:43:29 -0500
Received: from mail-pf1-f201.google.com ([209.85.210.201]:38131 "EHLO
        mail-pf1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727731AbfCHSn0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Mar 2019 13:43:26 -0500
Received: by mail-pf1-f201.google.com with SMTP id d5so23034534pfo.5
        for <linux-doc@vger.kernel.org>; Fri, 08 Mar 2019 10:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=bO9Ut6bvYRKsfb9hG438t2Q8GfNMLAbUhphxvMlnr+Y=;
        b=Ddj5LQyjlIjwrHP5ehK+oJ/v9fKavvSearbFSnK49AD0M0Ijda7ZsanGy74D80pufg
         Lgkcv8juSAkThYZJjtNfyaTS7N2zDclYu45eWjgibFFwaNK8ylyh0oB7kmipClxsLsWG
         cxV5JRBPuMfAr5RQ52u+RYzzNTQvS3pNMIth63F6imHd2Ft3RZ8Yp5NVHeLn/kPYvo0M
         fkk9E5iqllL6RJSI9Lsi+bUnPFigtvVlPOKMb7S0PbnrLOFx3egU9xt6UxWQIFUF+QJc
         InrzrowbvnHoW34yZXO0BbCSWS+Yn2NAKH9O/c9a5tz3tcc/HyTAjgeMNowOQwuAJCBJ
         tlUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=bO9Ut6bvYRKsfb9hG438t2Q8GfNMLAbUhphxvMlnr+Y=;
        b=enBp0nCJOykAPjTOe9pRSRAiC7vv3rBuzNYjqloSBeY7ji9FcOJP46+Dmg4WsOgknW
         nGhuGDwAs2PXRbt6KroCDwrDhW4uRis5EP/pEaBFiQmuBQu8Ba/JLL7NKaW6FmySOkZu
         8yuNlcSuPbCueNEJWKa7SAiYr0SX4SmbWZPxsM93X589ToN7eoy3Rd48sKo2hApPGhrS
         1tedsrgEqXoRv26iVx04fjZiWQbCF75KaOKiZ5f4sOCMOoabDA+Zy+NQ+VDniHqhIdEE
         NVmQhDybOTvQQP/ktCYNqUqVuVikW9mBznK8DyDWz2AXZEju7sqxMyQRU/7duON3/2AF
         kOrg==
X-Gm-Message-State: APjAAAX8d0UJ9x0nIP+0cgIK6E0VDAvd5EsfjcgfyeP6OkJWkW3CWrlx
        REvCgmK7WKi4G2Qb7mDxoA+7oV++1R0=
X-Google-Smtp-Source: APXvYqw2C6wbweqasiF1cbPEq10gvpXR3nbBbTemia3F7+b5xQQZgTibnmAJlyRQEfHaibrTPeQ7I25CGVU=
X-Received: by 2002:a17:902:8ec3:: with SMTP id x3mr6269298plo.54.1552070605443;
 Fri, 08 Mar 2019 10:43:25 -0800 (PST)
Date:   Fri,  8 Mar 2019 10:43:06 -0800
In-Reply-To: <20190308184311.144521-1-surenb@google.com>
Message-Id: <20190308184311.144521-3-surenb@google.com>
Mime-Version: 1.0
References: <20190308184311.144521-1-surenb@google.com>
X-Mailer: git-send-email 2.21.0.360.g471c308f928-goog
Subject: [PATCH v5 2/7] psi: make psi_enable static
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
2.21.0.360.g471c308f928-goog

