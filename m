Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E9EC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 18 Feb 2022 10:27:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233064AbiBRK1U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Feb 2022 05:27:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232540AbiBRK1T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Feb 2022 05:27:19 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC19E12760
        for <linux-doc@vger.kernel.org>; Fri, 18 Feb 2022 02:27:01 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id y18so6792379plb.11
        for <linux-doc@vger.kernel.org>; Fri, 18 Feb 2022 02:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ajou.ac.kr; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=+T3KpWhNKa0tR65ONmcJl30b/m+LmztZvFh+zw/KtCk=;
        b=CSBsjQACvcRO/sFAdwgQWs3JH/MmMWvyiVBNhla3nPtD9bgbk93JwZ2ntMsBUKq32T
         UIB8q3Ud3Aljxzwv3VHVhqrkqAdydQhA7KNG3IKuxZjpV67WfFmat9sN/omK6iuwGB4C
         IPB1CVoscYCyZtSboNE8VGsLqW3UjP5cZIHcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=+T3KpWhNKa0tR65ONmcJl30b/m+LmztZvFh+zw/KtCk=;
        b=V/CgTYmnwUbMQJQ6xeLkju4BRPr+9lvlwt120xyziAESO2oDokbauch0PX3DzV8Q3q
         gBc3M+cw2jtwc7lpqLoiAXSNIJeUqcs49gLJWht53VptRQTbFWD8AuINXqJ+BHMibgLy
         PeXsD9oHdVFgiAkA5SN1zHlQ6RKgPsSIZR/RDckaC74Fq3zbZfKbcrWQT0EJ98tJ/XnS
         FPQWaOjVp4RjGm3eSB2n2/gmEqjNhI6HbpptsQDi3E/othR9aquf2speHpjfKbBHDjh5
         7k91SE+2umbAG/hz0xeJ6mAciFgbA90dhik7FgmTUCmtjj9P12mmIk6HncRIMZDDFu9g
         ikrw==
X-Gm-Message-State: AOAM53390tCWD8B57O+W6XGtkuE8FFpMaTTblRihRqPtsI8G5tckEa2T
        qTuxN2PQpbqdm2g5liz69id/WQ==
X-Google-Smtp-Source: ABdhPJwmd0fVZO0Edt92aYqkcns0NPA3othJELbRqEVsjcuckc3gLs6OopDmtExBFLlQwLVPribCdw==
X-Received: by 2002:a17:90b:38ce:b0:1b9:e0dd:50ec with SMTP id nn14-20020a17090b38ce00b001b9e0dd50ecmr11885292pjb.163.1645180021147;
        Fri, 18 Feb 2022 02:27:01 -0800 (PST)
Received: from localhost.localdomain ([210.107.197.32])
        by smtp.googlemail.com with ESMTPSA id k13sm2767696pfc.176.2022.02.18.02.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:27:00 -0800 (PST)
From:   Jonghyeon Kim <tome01@ajou.ac.kr>
To:     akpm@linux-foundation.org
Cc:     Jonghyeon Kim <tome01@ajou.ac.kr>, Jonathan.Cameron@Huawei.com,
        amit@kernel.org, benh@kernel.crashing.org, corbet@lwn.net,
        david@redhat.com, dwmw@amazon.com, elver@google.com,
        foersleo@amazon.de, gthelen@google.com, markubo@amazon.de,
        rientjes@google.com, shakeelb@google.com, shuah@kernel.org,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v1 2/3] mm/damon/core: Add damon_start_one()
Date:   Fri, 18 Feb 2022 19:26:10 +0900
Message-Id: <20220218102611.31895-3-tome01@ajou.ac.kr>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220218102611.31895-1-tome01@ajou.ac.kr>
References: <20220218102611.31895-1-tome01@ajou.ac.kr>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

damon_start() function is designed to start multiple damon monitoring
contexts. But, sometimes we need to start monitoring one context.
Although __damon_start() could be considered to start for one monitoring
context, it seems reasonable to adopt a new function that does not need
to handle 'damon_lock' from the caller.

Signed-off-by: Jonghyeon Kim <tome01@ajou.ac.kr>
---
 include/linux/damon.h |  1 +
 mm/damon/core.c       | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index c0adf1566603..069577477662 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -511,6 +511,7 @@ int damon_register_ops(struct damon_operations *ops);
 int damon_select_ops(struct damon_ctx *ctx, enum damon_ops_id id);
 
 int damon_start(struct damon_ctx **ctxs, int nr_ctxs);
+int damon_start_one(struct damon_ctx *ctx);
 int damon_stop(struct damon_ctx **ctxs, int nr_ctxs);
 
 #endif	/* CONFIG_DAMON */
diff --git a/mm/damon/core.c b/mm/damon/core.c
index 290c9c0535ee..e43f138a3489 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -466,6 +466,31 @@ int damon_start(struct damon_ctx **ctxs, int nr_ctxs)
 	return err;
 }
 
+/**
+ * damon_start_one() - Starts the monitorings for one context.
+ * @ctx:	monitoring context
+ *
+ * This function starts one monitoring thread for only one monitoring context
+ * handling damon_lock.
+ *
+ * Return: 0 on success, negative error code otherwise.
+ */
+int damon_start_one(struct damon_ctx *ctx)
+{
+	int err = 0;
+
+	mutex_lock(&damon_lock);
+	err = __damon_start(ctx);
+	if (err) {
+		mutex_unlock(&damon_lock);
+		return err;
+	}
+	nr_running_ctxs++;
+	mutex_unlock(&damon_lock);
+
+	return err;
+}
+
 /*
  * __damon_stop() - Stops monitoring of given context.
  * @ctx:	monitoring context
-- 
2.17.1

