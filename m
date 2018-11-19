Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 524BA7DE6D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 10:35:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728430AbeKSU6U (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 15:58:20 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51228 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbeKSU6T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 15:58:19 -0500
Received: by mail-wm1-f68.google.com with SMTP id w7-v6so4742505wmc.1
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 02:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=2PZH8WwXkvnGeOOTNTp/CB09k6USJvSSB6C0CaaMGjI=;
        b=hcuU6/VqTQwptGHjtIMvqO0p51x14o0CH8VynZz+6pAYFV8wdEQyx+ljlgfV6rV2w7
         ITCCyWJsgcX5EmmWYweoyDAMoKM4kZS/0KIuLLINuDr3CFzBBAYSz+58G1YiRCRMTQrt
         ivc6Bbj1bt5nmThOu57faArw/3BCDnwjUELl8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=2PZH8WwXkvnGeOOTNTp/CB09k6USJvSSB6C0CaaMGjI=;
        b=Eyl01SzB2dYTM/w+mY6Ucv8w1ZLspZ01WhL1wtMl1hh3Rw6SZ28Dw/m7FmYsCgdZr5
         9DPVH4IHS9QNh5kLuYEbGTIXA5ePOPgBeCkAHiMiQ5frzR3oL+dtDmKPQuUPb4Tf/+Th
         q7E+LuHgs4BwZxVurliEoCWOzJNPXWwHSUgLlC07sM+QC1Ve9uYScwf+D1kFwMIBiNUc
         VRGtUJXib3d8QZT0rr2hP2atxvf/A0xwcA1bWjDBluRTVgeHYTL6dxkTg1ieSDoDTD2D
         vb+WJfICUMrCIvNjdhqF9NBhty9t4VfIc0oiNPCnhVPuE467JmQVQFHE9u7JuTbkwOjX
         t6uA==
X-Gm-Message-State: AGRZ1gKg9Brw8vUSY/g1NAqLzI9ApGTmCcEBBbIZ5Ww+tLXbvJ9Tr0vk
        kf4wju3QHID4Vw3WQXgYqIvb9g==
X-Google-Smtp-Source: AFSGD/V/PzPvdMmgio2MMuksaWEdLCDo8SfjRuu380b7ZwE1q0ngjmXv93lavCq2gXUdRW2aWbo06w==
X-Received: by 2002:a1c:ddc3:: with SMTP id u186mr6436592wmg.110.1542623705169;
        Mon, 19 Nov 2018 02:35:05 -0800 (PST)
Received: from localhost.localdomain ([37.162.18.180])
        by smtp.gmail.com with ESMTPSA id e9sm14973298wro.16.2018.11.19.02.35.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Nov 2018 02:35:04 -0800 (PST)
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
Subject: [PATCH V2 10/10] doc, bfq-iosched: make it consistent with the new cgroup interface
Date:   Mon, 19 Nov 2018 11:34:24 +0100
Message-Id: <20181119103424.3853-11-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181119103424.3853-1-paolo.valente@linaro.org>
References: <20181119103424.3853-1-paolo.valente@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

BFQ now shares interface files with CFQ, for the proportional-share
policy. Make documentation consistent with that.

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 Documentation/block/bfq-iosched.txt | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/Documentation/block/bfq-iosched.txt b/Documentation/block/bfq-iosched.txt
index 6d7dd5ab8554..3d7ef138ce6a 100644
--- a/Documentation/block/bfq-iosched.txt
+++ b/Documentation/block/bfq-iosched.txt
@@ -508,12 +508,14 @@ process.
 To get proportional sharing of bandwidth with BFQ for a given device,
 BFQ must of course be the active scheduler for that device.
 
-Within each group directory, the names of the files associated with
-BFQ-specific cgroup parameters and stats begin with the "bfq."
-prefix. So, with cgroups-v1 or cgroups-v2, the full prefix for
-BFQ-specific files is "blkio.bfq." or "io.bfq." For example, the group
-parameter to set the weight of a group with BFQ is blkio.bfq.weight
-or io.bfq.weight.
+BFQ uses the standard interface files of the proportional-share
+policy, previously used by CFQ. If one such file is read/written, then
+the operation associated with the file is performed by BFQ for each
+device where BFQ is the active scheduler. In addition, BFQ is
+configured so as to share interface files with other entities (if some
+of these files does happen to be shared, then its associated operation
+is performed also by any of the other entities that is using the
+file).
 
 As for cgroups-v1 (blkio controller), the exact set of stat files
 created, and kept up-to-date by bfq, depends on whether
@@ -521,13 +523,13 @@ CONFIG_DEBUG_BLK_CGROUP is set. If it is set, then bfq creates all
 the stat files documented in
 Documentation/cgroup-v1/blkio-controller.txt. If, instead,
 CONFIG_DEBUG_BLK_CGROUP is not set, then bfq creates only the files
-blkio.bfq.io_service_bytes
-blkio.bfq.io_service_bytes_recursive
-blkio.bfq.io_serviced
-blkio.bfq.io_serviced_recursive
+blkio.io_service_bytes
+blkio.io_service_bytes_recursive
+blkio.io_serviced
+blkio.io_serviced_recursive
 
 The value of CONFIG_DEBUG_BLK_CGROUP greatly influences the maximum
-throughput sustainable with bfq, because updating the blkio.bfq.*
+throughput sustainable with BFQ, because updating the blkio.*
 stats is rather costly, especially for some of the stats enabled by
 CONFIG_DEBUG_BLK_CGROUP.
 
@@ -536,8 +538,8 @@ Parameters to set
 
 For each group, there is only the following parameter to set.
 
-weight (namely blkio.bfq.weight or io.bfq-weight): the weight of the
-group inside its parent. Available values: 1..10000 (default 100). The
+weight (namely blkio.weight or io.weight): the weight of the group
+inside its parent. Available values: 1..10000 (default 100). The
 linear mapping between ioprio and weights, described at the beginning
 of the tunable section, is still valid, but all weights higher than
 IOPRIO_BE_NR*10 are mapped to ioprio 0.
-- 
2.16.1

