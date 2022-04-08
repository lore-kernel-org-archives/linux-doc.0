Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A567C4332F
	for <linux-doc@archiver.kernel.org>; Fri,  8 Apr 2022 04:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231673AbiDHE74 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Apr 2022 00:59:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234390AbiDHE7x (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Apr 2022 00:59:53 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE483B3EE
        for <linux-doc@vger.kernel.org>; Thu,  7 Apr 2022 21:57:49 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id i65-20020a628744000000b0050565784b53so2507067pfe.7
        for <linux-doc@vger.kernel.org>; Thu, 07 Apr 2022 21:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=RpFXlKvwb4pUJyIrx0BwPq/Sz7TwgzSMaU3KXpjsnFg=;
        b=PZfwTndHaHFeiId6kJJWIk58eh5ykRjdyumVYKw/V0Oluj34d7Lv6G9QfbAO6MG68X
         5Cp8uWVnKwShcF0BFnxZHLWp6ZB5aWPOXG/Oix4YaoRQJT/TamzL0Z+Q0C1feePcwpoK
         FENgXFWEzQHHDlbUa6+OWFMfZy/Zs5THpeXzBDDUoSOpdHazwli+xVssStSpQX6dXP87
         +gEZWfq2i6qSv+b+zRxuTxamA08CMwUpQtHbpqJp/ibE+JIapaGcj0/Y8FuPUv9ANtvB
         K64P3pZuES8BJSknRtTorjKzVC0kiVkym17TcMpzn9ih6gm1W5AFO0y+l2ijh3LMEALt
         vIDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=RpFXlKvwb4pUJyIrx0BwPq/Sz7TwgzSMaU3KXpjsnFg=;
        b=Ec08JDF2sNcskkr85iW922dQYNnWWqJi388r/UJ36FotDobEKKWMVsKqXpC/z99ATL
         KC6z0MbtMCPF16wDXAYaaAESL9nnJrEgh36QfKsCxKpWd6cTP0swbq+oJV47zEJ23XzH
         3m6C7D81v7lEvNBqLZXLgMBsSNwoXVz8B6uQfX/hum0Bn8cdAQNea7a9u2CHL+lmznEC
         2cPqDjXtFiX5SMSK3dnIXlu3iVyOgYjuEyIbVtyxIvqBGKJfU+ylX96FsKWx0tTh4X2K
         GRbVwLD0zugYOiJGieHPWLa8b7qHBLIkKSccp+8aGI7aTt7kPt2aWUYvJ4P3350m90eC
         hAVw==
X-Gm-Message-State: AOAM533dO2Pm2kFCkGr4yiPxxoyVvCUAXVJw4MP9a1Mu4OXLSTHSFZFi
        vq5GgQIgqctF+vR1z63jUO9/Fya1o8TOpzg4
X-Google-Smtp-Source: ABdhPJw5mVvKa75yNWq8X1toeYD179Hk+kkkpDn6jYwbzqwx+XJ9Se+9zdydnBR6hBfnjvMnIUQQ2/3DjI+R68dT
X-Received: from yosry.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:2327])
 (user=yosryahmed job=sendgmr) by 2002:a17:902:ecd1:b0:154:5393:aa7e with SMTP
 id a17-20020a170902ecd100b001545393aa7emr17225851plh.79.1649393868836; Thu,
 07 Apr 2022 21:57:48 -0700 (PDT)
Date:   Fri,  8 Apr 2022 04:57:41 +0000
In-Reply-To: <20220408045743.1432968-1-yosryahmed@google.com>
Message-Id: <20220408045743.1432968-3-yosryahmed@google.com>
Mime-Version: 1.0
References: <20220408045743.1432968-1-yosryahmed@google.com>
X-Mailer: git-send-email 2.35.1.1178.g4f1659d476-goog
Subject: [PATCH v3 2/4] selftests: cgroup: return the errno of write() in
 cg_write() on failure
From:   Yosry Ahmed <yosryahmed@google.com>
To:     Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <roman.gushchin@linux.dev>
Cc:     David Rientjes <rientjes@google.com>, Tejun Heo <tj@kernel.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Wei Xu <weixugc@google.com>, Greg Thelen <gthelen@google.com>,
        Chen Wandun <chenwandun@huawei.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        "=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>,
        Tim Chen <tim.c.chen@linux.intel.com>, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
        Yosry Ahmed <yosryahmed@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, cg_write() returns 0 on success and -1 on failure. Modify it
to return the errno of write() syscall when write() fails.

Signed-off-by: Yosry Ahmed <yosryahmed@google.com>
---
 tools/testing/selftests/cgroup/cgroup_util.c | 32 +++++++++++---------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/tools/testing/selftests/cgroup/cgroup_util.c b/tools/testing/selftests/cgroup/cgroup_util.c
index dbaa7aabbb4a..3b6bb09985fa 100644
--- a/tools/testing/selftests/cgroup/cgroup_util.c
+++ b/tools/testing/selftests/cgroup/cgroup_util.c
@@ -38,23 +38,23 @@ static ssize_t read_text(const char *path, char *buf, size_t max_len)
 	return len;
 }
 
-static ssize_t write_text(const char *path, char *buf, ssize_t len)
+/*
+ * Returns:
+ *	success -> 0
+ *	open() failure -> -1
+ *	write() failure -> errno
+ */
+static int write_text(const char *path, char *buf, ssize_t len)
 {
-	int fd;
+	int fd, ret;
 
 	fd = open(path, O_WRONLY | O_APPEND);
 	if (fd < 0)
 		return fd;
 
-	len = write(fd, buf, len);
-	if (len < 0) {
-		close(fd);
-		return len;
-	}
-
+	ret = write(fd, buf, len) < 0 ? errno : 0;
 	close(fd);
-
-	return len;
+	return ret;
 }
 
 char *cg_name(const char *root, const char *name)
@@ -177,17 +177,19 @@ long cg_read_lc(const char *cgroup, const char *control)
 	return cnt;
 }
 
+/*
+ * Returns:
+ *	success -> 0
+ *	open() failure -> -1
+ *	write() failure -> errno
+ */
 int cg_write(const char *cgroup, const char *control, char *buf)
 {
 	char path[PATH_MAX];
 	ssize_t len = strlen(buf);
 
 	snprintf(path, sizeof(path), "%s/%s", cgroup, control);
-
-	if (write_text(path, buf, len) == len)
-		return 0;
-
-	return -1;
+	return write_text(path, buf, len);
 }
 
 int cg_find_unified_root(char *root, size_t len)
-- 
2.35.1.1178.g4f1659d476-goog

