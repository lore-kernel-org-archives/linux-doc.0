Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C8F5E7DD50
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 10:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbeKSU6N (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 15:58:13 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:34393 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728342AbeKSU6N (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 15:58:13 -0500
Received: by mail-wr1-f65.google.com with SMTP id j2so3066908wrw.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 02:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oBc3JwPq73FtDGvqk3t8T7Oot3rzsOXj87W1YQabmq0=;
        b=U+uluio6KwtbMMoH3Jp0DEoAQtuhcEmvMYrNiM5KHAwwCapWC33wQhLaMnZr9S/I/0
         Z6sK2Z1/uUcwEavzu8hwJhNC29Gt2B+bLxPWg0ogiXB9yWoJOlUzzK8ssUxgRpXHV3EU
         XnLEDqKsSc9kSrVv/zIWFoLbWLaZfx4laO4js=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=oBc3JwPq73FtDGvqk3t8T7Oot3rzsOXj87W1YQabmq0=;
        b=EkPH6JX/CWIfObjc8pE1MweE9cbr+GH9EiO5fhHxi/VxJUqYPfFXUbRNpkwN8a7HT+
         xyZxx18/zrtwindfX4c6zfz3LNH5OhoJAqRTZR5xCtc3AQrebU0F8XewnSdT0LwHr2SI
         kt6uSCp2Rg3XU9ADuVsEEcvQ/wTcOf2mA/bmAFSfPZqQKX8o0nniotHws9+S4/nKdJGC
         G2jxNOBcX9iPQEIwiXtkE6qboX14l5fXdk0dtuANuDICG4b4vAy/i+FztV3xoBvSxnJh
         gdyv1LVH2n5rRt6n15unwxKQnVLbgOS9OdsaihvCP8ez4CKNI/CLO50y2U0NGI6SXqXQ
         f/0w==
X-Gm-Message-State: AGRZ1gJRUDSrJvQg/Ku+0b3L7gaw7g6kT7erPO98cvG6soL16KSpUGbO
        2S77aK1AWsoCKoY5eC7NNEDzHA==
X-Google-Smtp-Source: AJdET5etp8BezkBcu9ThAO0d/Z0yFM4/7bg5m+zKB/fG+37fSeJxpTsIAFoYhNzjTlWgIzYfHEJTRQ==
X-Received: by 2002:a5d:4708:: with SMTP id y8-v6mr17551672wrq.16.1542623698837;
        Mon, 19 Nov 2018 02:34:58 -0800 (PST)
Received: from localhost.localdomain ([37.162.18.180])
        by smtp.gmail.com with ESMTPSA id e9sm14973298wro.16.2018.11.19.02.34.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Nov 2018 02:34:58 -0800 (PST)
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
Subject: [PATCH V2 08/10] block, throttle: allow sharing cgroup statistic files
Date:   Mon, 19 Nov 2018 11:34:22 +0100
Message-Id: <20181119103424.3853-9-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181119103424.3853-1-paolo.valente@linaro.org>
References: <20181119103424.3853-1-paolo.valente@linaro.org>
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
index 6bfdaac53b6f..95825448c031 100644
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

