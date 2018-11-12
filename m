Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 396857D8E7
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Nov 2018 09:57:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726443AbeKLTuU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Nov 2018 14:50:20 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:33636 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729278AbeKLTt6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Nov 2018 14:49:58 -0500
Received: by mail-wm1-f65.google.com with SMTP id f19-v6so8476968wmb.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 01:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tJzqIZ4whiBiBt1HUGz+jcfYWcwBBnR88Hf7l4Y3mww=;
        b=FDIijxyzwzKUw8K/20a1vK7NhMkivhaxGdBShwBbInbBKMPrlnQRfW4Q14WNLJlAgk
         +5kolkin8wKT5bN1KavHsyCPbdwxMplfi0IRkntZ056n0gKQV+UuCM8samekxvyVvzGV
         rA+3TSy9ixB0Rhl9TjcTj+dGLIzKf73wxGTX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tJzqIZ4whiBiBt1HUGz+jcfYWcwBBnR88Hf7l4Y3mww=;
        b=YF3aYuGvwZw7IajDoYogrnJDaqlmdwc9IJHop4YuSazcoX3tsETzjkDRfBtxyXyhwa
         HHMao2cRzwRapHF51hHUlfj8caQh/U7xEVvRocR12U+bdkRerE/c9+ItSTqixIPzo6hB
         zJ+1f8j6D8kgLXEQuF4cyLvhBaCR8TTNNbBq4XAMd7YF7MrdO7DsSvz+1FPAbMVgKJJ/
         BVE9Xct+EplzGsyIajC8B1miKB1Whj06p49xAFbBCdxilQK4RQTKePMDZKIcgauKb8lR
         78fAP8LNtbgJoeL0Xe1ZWlx8ITHZ7zZnaLpks2BfKYo/fdA4EV1qWf7vofkOnBqG0tzD
         boOQ==
X-Gm-Message-State: AGRZ1gI1q42aScd600zrMwh1ZbFTJo/cY31oBjvfA2UTyPFylSaaxIBF
        4fDGZPUNpA2Pz4TbXmsZAneqmQ==
X-Google-Smtp-Source: AJdET5fawr7GnsFjWBfAqQNwc0WTsbuL0TF0A5Vo5Qb1Eh1UMzTSTTRDuv41Dqraj6jvyVn0dIwu2g==
X-Received: by 2002:a1c:58c5:: with SMTP id m188-v6mr6705885wmb.85.1542016647902;
        Mon, 12 Nov 2018 01:57:27 -0800 (PST)
Received: from localhost.localdomain ([93.68.220.21])
        by smtp.gmail.com with ESMTPSA id r14-v6sm21273089wro.8.2018.11.12.01.57.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Nov 2018 01:57:27 -0800 (PST)
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
Subject: [PATCH 10/12] block, throttle: allow sharing cgroup statistic files
Date:   Mon, 12 Nov 2018 10:56:30 +0100
Message-Id: <20181112095632.69114-11-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181112095632.69114-1-paolo.valente@linaro.org>
References: <20181112095632.69114-1-paolo.valente@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Angelo Ruocco <angeloruocco90@gmail.com>

Some of the cgroup files defined in the throttle policy have the same
meaning as those defined in the proportional share policy.

This commit uses the new file sharing interface in cgroup to share
these files.

Signed-off-by: Angelo Ruocco <angeloruocco90@gmail.com>
Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 block/blk-throttle.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/block/blk-throttle.c b/block/blk-throttle.c
index 5c43821dc528..239957c12d34 100644
--- a/block/blk-throttle.c
+++ b/block/blk-throttle.c
@@ -1491,22 +1491,30 @@ static struct cftype throtl_legacy_files[] = {
 		.write = tg_set_conf_uint,
 	},
 	{
-		.name = "throttle.io_service_bytes",
+		.name = "io_service_bytes",
+		.owner_name = "throttle",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = (unsigned long)&blkcg_policy_throtl,
 		.seq_show_cft = blkg_print_stat_bytes,
 	},
 	{
-		.name = "throttle.io_service_bytes_recursive",
+		.name = "io_service_bytes_recursive",
+		.owner_name = "throttle",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = (unsigned long)&blkcg_policy_throtl,
 		.seq_show_cft = blkg_print_stat_bytes_recursive,
 	},
 	{
-		.name = "throttle.io_serviced",
+		.name = "io_serviced",
+		.owner_name = "throttle",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = (unsigned long)&blkcg_policy_throtl,
 		.seq_show_cft = blkg_print_stat_ios,
 	},
 	{
-		.name = "throttle.io_serviced_recursive",
+		.name = "io_serviced_recursive",
+		.owner_name = "throttle",
+		.flags = CFTYPE_SHARES_FILE,
 		.private = (unsigned long)&blkcg_policy_throtl,
 		.seq_show_cft = blkg_print_stat_ios_recursive,
 	},
-- 
2.16.1

