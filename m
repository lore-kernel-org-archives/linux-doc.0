Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C3E2C7DC5B
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Nov 2018 09:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729447AbeKLTuD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Nov 2018 14:50:03 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:38622 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729427AbeKLTuC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Nov 2018 14:50:02 -0500
Received: by mail-wm1-f68.google.com with SMTP id f2-v6so7461815wme.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 01:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MpOWBJhYX62m+dv0e4xXNBLs0Dhr3TZXbDUpfWqj7Ic=;
        b=VFGD5aONmJPgDKVWuSsADhnuupo20davPrcXxMNwaQMZewp7EC2pNfPmhVeF7QXgpS
         akGJu9VK0L9wXDLo3UCtHJXHfph1HyHmjiXaGZ/dtlh85gW/caRxP0MJp6ZsuOqy8afm
         oR3leMzaETYNT3djwxxEJi91rWG0izRRGxgJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MpOWBJhYX62m+dv0e4xXNBLs0Dhr3TZXbDUpfWqj7Ic=;
        b=tWzKZDBDMn62guaFPjIxPoIOoPUKkKDO498jqRRhIk3rTzu72Ndb5hA3Sy3mC7CTmR
         94bnRdSD2QybQ2pUIy9yWFJyfAbP8K0Mw5twNsCHqSXnZXfePGToQUVkNH5Tql/Di2rx
         440SQIb6LTneMqTQFVaw8cYS+NuzkTatdJH/aiC5LGudG3iiL7DAiAZRB9Bc3kDcXD5J
         EFBmgS52PnNeRDblp2SSrFBVLphupe4dVCF/KDxMKcN9oJ32kOquOQ/cZqtjR6b0J26R
         ah5Rc0SmPJKnH6VuBTeb4WCZMlaclCp8/eDw2jpmdbD441KJykF+NDEiTI5o2Yc0XcEB
         aE5w==
X-Gm-Message-State: AGRZ1gKyJAV2xs7o0eGAHI/Gf3QWcCsP/JqINHdUicOJVoqHgMo06HEZ
        Y5PVY4DsPmDjmFBP5oAtsmVOEQ==
X-Google-Smtp-Source: AJdET5fFs+lCHzRwboWRo84U8qMS4Iw1ZzFVDfw3E3P+yyuWPwOR1BS7Eetdc7j7kFYPiTHMWupTEg==
X-Received: by 2002:a1c:111:: with SMTP id 17-v6mr1356272wmb.55.1542016652729;
        Mon, 12 Nov 2018 01:57:32 -0800 (PST)
Received: from localhost.localdomain ([93.68.220.21])
        by smtp.gmail.com with ESMTPSA id r14-v6sm21273089wro.8.2018.11.12.01.57.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Nov 2018 01:57:32 -0800 (PST)
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
Subject: [PATCH 12/12] doc, bfq-iosched: make it consistent with the new cgroup interface
Date:   Mon, 12 Nov 2018 10:56:32 +0100
Message-Id: <20181112095632.69114-13-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181112095632.69114-1-paolo.valente@linaro.org>
References: <20181112095632.69114-1-paolo.valente@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

BFQ now shares interface files with CFQ, for the proportional-share
policy. Make documentation consistent with that.

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 Documentation/block/bfq-iosched.txt | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/Documentation/block/bfq-iosched.txt b/Documentation/block/bfq-iosched.txt
index 6d7dd5ab8554..b1faf091266e 100644
--- a/Documentation/block/bfq-iosched.txt
+++ b/Documentation/block/bfq-iosched.txt
@@ -508,12 +508,11 @@ process.
 To get proportional sharing of bandwidth with BFQ for a given device,
 BFQ must of course be the active scheduler for that device.
 
-Within each group directory, the names of the files associated with
-BFQ-specific cgroup parameters and stats begin with the "bfq."
-prefix. So, with cgroups-v1 or cgroups-v2, the full prefix for
-BFQ-specific files is "blkio.bfq." or "io.bfq." For example, the group
-parameter to set the weight of a group with BFQ is blkio.bfq.weight
-or io.bfq.weight.
+BFQ shares interface files with CFQ. So, if one reads/writes a file
+provided by the proportional share policy for a group, then the
+associated operation is performed by/on BFQ for each device where BFQ
+is the active scheduler, and by/on CFQ for each device where CFQ is
+the active scheduler.
 
 As for cgroups-v1 (blkio controller), the exact set of stat files
 created, and kept up-to-date by bfq, depends on whether
@@ -521,13 +520,13 @@ CONFIG_DEBUG_BLK_CGROUP is set. If it is set, then bfq creates all
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
 
@@ -536,8 +535,8 @@ Parameters to set
 
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

