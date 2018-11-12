Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A4C2B7D982
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Nov 2018 09:57:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbeKLTtx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Nov 2018 14:49:53 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33634 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729278AbeKLTtw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Nov 2018 14:49:52 -0500
Received: by mail-wm1-f68.google.com with SMTP id f19-v6so8476783wmb.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 01:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BhhSrhl3GPkKSUoXIhn9nAMo7Bh19cGOMzxu3Gi9vPg=;
        b=QG+hymxrp0k2JHc1mCXq7bGzmIVfKn8kyei84SG0+Y3J9yu8gRuP/KiUBxNO6H35Yw
         PAM/xy0h10htiE9hYdXK9BcdZPCqgmM0bjBMsEt8TvvDzFJTQMZNtCgl4n1iF4YqNIE/
         nqEomghns5VaEzxAIC/4QDraAfkZx5bQG9Ixk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BhhSrhl3GPkKSUoXIhn9nAMo7Bh19cGOMzxu3Gi9vPg=;
        b=PsL2f7yUadZAJ4mtW6kIhg9heJ0RZYpTBHa0jclKkce5kuwDFqjh9wjlnuUxS5Ul/L
         RKuR/BiVUuP+LajY2Bcuo55T2w86eMbkVgi82+sNOHwPhVQXcbGJaYXXRYqr3+NlAUma
         7hADb5gDEp9HplIk9E7dO3c0f+F7QJNGN2Yj3gCGolnk2MOzi/iIoMqOMwImuE514+Pk
         j4kXeVN3m5ayPhDv/Cofbjjz5tnuk2bED6zmLGiag/3q88flQS2IkShyGlqwe/MU6BeF
         6YadZcRv0QVMPCEQAyZdmcef5rhFLSJPy++aV/TshILOp1dSRuLRsqqvIhReepqAPa+D
         Qiyg==
X-Gm-Message-State: AGRZ1gJ/+T9syDgtcrj6XrvYuaglSW9LfoVyp3n19PQjAphp+FLT3tt2
        +CXqPd/qqMO+HuJRpO9Lzm/iPg==
X-Google-Smtp-Source: AJdET5ciK+vocmPu6b60UpX73AaZ1OTTiPWtswUD/U+3dbiFmTt0CYEpBhnfnlzDg3PvsctIzLIX7w==
X-Received: by 2002:a1c:3c83:: with SMTP id j125-v6mr6771922wma.65.1542016642661;
        Mon, 12 Nov 2018 01:57:22 -0800 (PST)
Received: from localhost.localdomain ([93.68.220.21])
        by smtp.gmail.com with ESMTPSA id r14-v6sm21273089wro.8.2018.11.12.01.57.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Nov 2018 01:57:22 -0800 (PST)
From:   Paolo Valente <paolo.valente@linaro.org>
To:     Jens Axboe <axboe@kernel.dk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Angelo Ruocco <angeloruocco90@gmail.com>,
        Dennis Zhou <dennis@kernel.org>,
        Josef Bacik <josef@toxicpanda.com>,
        Liu Bo <bo.liu@linux.alibaba.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Johannes Weiner <hannes@cmpxchg.org>
Cc:     linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        ulf.hansson@linaro.org, linus.walleij@linaro.org,
        broonie@kernel.org, bfq-iosched@googlegroups.com,
        oleksandr@natalenko.name, cgroups@vger.kernel.org,
        linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Paolo Valente <paolo.valente@linaro.org>
Subject: [PATCH 08/12] block, cfq: allow cgroup files to be shared
Date:   Mon, 12 Nov 2018 10:56:28 +0100
Message-Id: <20181112095632.69114-9-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181112095632.69114-1-paolo.valente@linaro.org>
References: <20181112095632.69114-1-paolo.valente@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Angelo Ruocco <angeloruocco90@gmail.com>

Some of the files exposed in a cgroup by cfq have the same meaning as
the files exposed by bfq and throttle.

This commit allows these files to be shared.

Signed-off-by: Angelo Ruocco <angeloruocco90@gmail.com>
Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 block/cfq-iosched.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/block/cfq-iosched.c b/block/cfq-iosched.c
index af0c59c2dcde..f046039bdfc6 100644
--- a/block/cfq-iosched.c
+++ b/block/cfq-iosched.c
@@ -2016,7 +2016,8 @@ static struct cftype cfq_blkcg_legacy_files[] = {
 	},
 	{
 		.name = "weight",
-		.flags = CFTYPE_NOT_ON_ROOT,
+		.owner_name = "cfq",
+		.flags = CFTYPE_NOT_ON_ROOT | CFTYPE_SHARES_FILE,
 		.seq_show = cfq_print_weight,
 		.write_u64 = cfq_set_weight,
 	},
@@ -2035,40 +2036,56 @@ static struct cftype cfq_blkcg_legacy_files[] = {
 	/* statistics, covers only the tasks in the cfqg */
 	{
 		.name = "time",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.time),
 		.seq_show_cft = cfqg_print_stat,
 	},
 	{
 		.name = "sectors",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.seq_show = cfqg_print_stat_sectors,
 	},
 	{
 		.name = "io_service_bytes",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = (unsigned long)&blkcg_policy_cfq,
 		.seq_show_cft = blkg_print_stat_bytes,
 	},
 	{
 		.name = "io_serviced",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = (unsigned long)&blkcg_policy_cfq,
 		.seq_show_cft = blkg_print_stat_ios,
 	},
 	{
 		.name = "io_service_time",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.service_time),
 		.seq_show_cft = cfqg_print_rwstat,
 	},
 	{
 		.name = "io_wait_time",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.wait_time),
 		.seq_show_cft = cfqg_print_rwstat,
 	},
 	{
 		.name = "io_merged",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.merged),
 		.seq_show_cft = cfqg_print_rwstat,
 	},
 	{
 		.name = "io_queued",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.queued),
 		.seq_show_cft = cfqg_print_rwstat,
 	},
@@ -2076,70 +2093,97 @@ static struct cftype cfq_blkcg_legacy_files[] = {
 	/* the same statictics which cover the cfqg and its descendants */
 	{
 		.name = "time_recursive",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.time),
 		.seq_show_cft = cfqg_print_stat_recursive,
 	},
 	{
 		.name = "sectors_recursive",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.seq_show = cfqg_print_stat_sectors_recursive,
 	},
 	{
 		.name = "io_service_bytes_recursive",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = (unsigned long)&blkcg_policy_cfq,
 		.seq_show_cft = blkg_print_stat_bytes_recursive,
 	},
 	{
 		.name = "io_serviced_recursive",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = (unsigned long)&blkcg_policy_cfq,
 		.seq_show_cft = blkg_print_stat_ios_recursive,
 	},
 	{
 		.name = "io_service_time_recursive",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.service_time),
 		.seq_show_cft = cfqg_print_rwstat_recursive,
 	},
 	{
 		.name = "io_wait_time_recursive",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.wait_time),
 		.seq_show_cft = cfqg_print_rwstat_recursive,
 	},
 	{
 		.name = "io_merged_recursive",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.merged),
 		.seq_show_cft = cfqg_print_rwstat_recursive,
 	},
 	{
 		.name = "io_queued_recursive",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.queued),
 		.seq_show_cft = cfqg_print_rwstat_recursive,
 	},
 #ifdef CONFIG_DEBUG_BLK_CGROUP
 	{
 		.name = "avg_queue_size",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.seq_show = cfqg_print_avg_queue_size,
 	},
 	{
 		.name = "group_wait_time",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.group_wait_time),
 		.seq_show_cft = cfqg_print_stat,
 	},
 	{
 		.name = "idle_time",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.idle_time),
 		.seq_show_cft = cfqg_print_stat,
 	},
 	{
 		.name = "empty_time",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.empty_time),
 		.seq_show_cft = cfqg_print_stat,
 	},
 	{
 		.name = "dequeue",
+		.owner_name = "cfq",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = offsetof(struct cfq_group, stats.dequeue),
 		.seq_show_cft = cfqg_print_stat,
 	},
 	{
 		.name = "unaccounted_time",
+		.owner_name = "cfq",
 		.private = offsetof(struct cfq_group, stats.unaccounted_time),
 		.seq_show_cft = cfqg_print_stat,
 	},
@@ -2181,7 +2225,8 @@ static ssize_t cfq_set_weight_on_dfl(struct kernfs_open_file *of,
 static struct cftype cfq_blkcg_files[] = {
 	{
 		.name = "weight",
-		.flags = CFTYPE_NOT_ON_ROOT,
+		.owner_name = "cfq",
+		.flags = CFTYPE_NOT_ON_ROOT | CFTYPE_SHARES_FILE,
 		.seq_show = cfq_print_weight_on_dfl,
 		.write = cfq_set_weight_on_dfl,
 	},
-- 
2.16.1

