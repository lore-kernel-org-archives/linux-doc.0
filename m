Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D4F1C7DD29
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Nov 2018 09:57:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728810AbeKLTtr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Nov 2018 14:49:47 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39618 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726221AbeKLTtr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Nov 2018 14:49:47 -0500
Received: by mail-wr1-f65.google.com with SMTP id b13so8549092wrx.6
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 01:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=P3gM8CEth45UYnNHSZF98Zi/zDAo21J+oNJpFvTMXDU=;
        b=F+07G256OoZzsTmnbt0RELuT0heBN/K8A2OrFVYc5axzgzepR5T2xKkZNXlibAtKAJ
         809E2WdhkOSlr2VxSQawiDZ9b1WIzjE9faJ7tuvvOP/NGFenBt5I92R4MWTVciVtbKU9
         TdhCVPR+K7VkxBtuZ276fOv470Q1nrjMDL6vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=P3gM8CEth45UYnNHSZF98Zi/zDAo21J+oNJpFvTMXDU=;
        b=Axm7u4rvRURqSFrdvvvwzxZ2B85pbQJNmcD/aXEKxUpnfcU1QfMJklPZ8icAabAdFA
         eMPAqXtqm3/hFcEmasd1xUsby8qcpaRBZgDONP2vfuU0vVOCbv1uW8+fIL4EHc2cKqXj
         Ya/HbxgCvDAs0JJvceWddBor3g1sLcln65+fjX0iLL94lyOOlQPA39hHxgKDBUBkNGUm
         Gkc1HH0YRQqqtfVeOLSk9jhN55dB0mShf3qn0VHDvy3+8x6bMI6rHy0h5zl9HbXbuNKR
         7IMcHS2JF4hEH/EKvOjHIdkTTxGZSaNCr3bh7qfJNnnG24f2oPObzSoWcP43UKGgpEEe
         3u9Q==
X-Gm-Message-State: AGRZ1gJ8BHcY3ayy/SlmeN1jsYRyu895TYbB8xQpO4liG6nJ86b3kOVx
        PwTu/X5gHOWK0uoTwD4UEXhHpA==
X-Google-Smtp-Source: AJdET5dmQXJVy08gMpQhoMpmynlctBhE45z6FLv3NNiUP+8moCL8RqcGeq1AsRtgkq2/wuSqduDtxw==
X-Received: by 2002:a5d:5544:: with SMTP id g4-v6mr311353wrw.222.1542016637942;
        Mon, 12 Nov 2018 01:57:17 -0800 (PST)
Received: from localhost.localdomain ([93.68.220.21])
        by smtp.gmail.com with ESMTPSA id r14-v6sm21273089wro.8.2018.11.12.01.57.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Nov 2018 01:57:17 -0800 (PST)
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
Subject: [PATCH 06/12] block, bfq: align min and default weights with cfq
Date:   Mon, 12 Nov 2018 10:56:26 +0100
Message-Id: <20181112095632.69114-7-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181112095632.69114-1-paolo.valente@linaro.org>
References: <20181112095632.69114-1-paolo.valente@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Angelo Ruocco <angeloruocco90@gmail.com>

The I/O schedulers bfq and cfq expose a cgroup attribute with the same
meaning: weight.

This commit changes bfq default and min weights to match the ones set
by cfq.

Signed-off-by: Angelo Ruocco <angeloruocco90@gmail.com>
Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 block/bfq-iosched.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/bfq-iosched.h b/block/bfq-iosched.h
index 77651d817ecd..249d8128d3ee 100644
--- a/block/bfq-iosched.h
+++ b/block/bfq-iosched.h
@@ -22,13 +22,13 @@
 #define BFQ_IOPRIO_CLASSES	3
 #define BFQ_CL_IDLE_TIMEOUT	(HZ/5)
 
-#define BFQ_MIN_WEIGHT			1
+#define BFQ_MIN_WEIGHT			10
 #define BFQ_MAX_WEIGHT			1000
 #define BFQ_WEIGHT_CONVERSION_COEFF	10
 
 #define BFQ_DEFAULT_QUEUE_IOPRIO	4
 
-#define BFQ_WEIGHT_LEGACY_DFL	100
+#define BFQ_WEIGHT_LEGACY_DFL	500
 #define BFQ_DEFAULT_GRP_IOPRIO	0
 #define BFQ_DEFAULT_GRP_CLASS	IOPRIO_CLASS_BE
 
-- 
2.16.1

