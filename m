Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 285B37DE6A
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Nov 2018 10:35:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728384AbeKSU6R (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Nov 2018 15:58:17 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39997 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727844AbeKSU6Q (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Nov 2018 15:58:16 -0500
Received: by mail-wr1-f66.google.com with SMTP id p4so22274959wrt.7
        for <linux-doc@vger.kernel.org>; Mon, 19 Nov 2018 02:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=95cHSgXhObq6AUCu/Rr/+wEQTPHLVt9I8/orFJ2tnV8=;
        b=N8iZHEZvKWz0J/nual7jk0fkuGeRXXZ7k/3ibe4bHVxzhla7D7v8KTcgOO8yVpWvFT
         B3vEIw+EBmC/yavIAvjOIiUz2wiAPEAIzT1RHvDAgZUu4MTPxiKzIwxtEJH+JHWk3fW/
         YZJUNoJLJnP75HF8BVdkglOlyHl+oOYs6W9pY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=95cHSgXhObq6AUCu/Rr/+wEQTPHLVt9I8/orFJ2tnV8=;
        b=uZEU7JwEND6LEbbVfsNSLPL+8TTN+5X7RwmE1pUjB9MW9gRTXAG14ltoAfOmasXY5C
         P8dGGw9baZ8KT8S2VwNftCedHBBnlEl4yaco453M11Tb/aFY0r83XE6cm7k58bqpqN6j
         YeZ0aIJrDutCmAx/eI5Er+henIrEoOTRoT7CYyJ8XIjlcVkZpOJz3h/kC8R/xiAHRN/m
         oEdololaBRGGJLNoCOvoQlZtGwOh5OcLpFalJos+YQyDsV19cbYPqJztbgnQMkIYN4Ce
         EItzHvxZvi0+2i8PgGraHdIPQvfBreEiDiSAV+uIiV3utdOuLodEoPEIdrRG7fhvlEEt
         Syrw==
X-Gm-Message-State: AGRZ1gLBbmow+C7idq0VdiCgk9lFKh8TQ16p5fdI+BGd1lk0yyNC7SwT
        kg34QCLV9SV+lSjOTYx7Oc++qQ==
X-Google-Smtp-Source: AJdET5dv/kwKsiWQBLYn+3+c+70Y68/WWV68w94tCu7QaX1LfXLzsVsfON/+RAR1/k+eJjYW/4XsJg==
X-Received: by 2002:adf:e247:: with SMTP id n7mr16869741wri.205.1542623702316;
        Mon, 19 Nov 2018 02:35:02 -0800 (PST)
Received: from localhost.localdomain ([37.162.18.180])
        by smtp.gmail.com with ESMTPSA id e9sm14973298wro.16.2018.11.19.02.34.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Nov 2018 02:35:01 -0800 (PST)
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
Subject: [PATCH V2 09/10] doc, bfq-iosched: fix a few clerical errors
Date:   Mon, 19 Nov 2018 11:34:23 +0100
Message-Id: <20181119103424.3853-10-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181119103424.3853-1-paolo.valente@linaro.org>
References: <20181119103424.3853-1-paolo.valente@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This commit fixes a few clerical errors in
Documentation/block/bfq-iosched.txt.

Signed-off-by: Paolo Valente <paolo.valente@linaro.org>
---
 Documentation/block/bfq-iosched.txt | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/block/bfq-iosched.txt b/Documentation/block/bfq-iosched.txt
index 8d8d8f06cab2..6d7dd5ab8554 100644
--- a/Documentation/block/bfq-iosched.txt
+++ b/Documentation/block/bfq-iosched.txt
@@ -42,7 +42,7 @@ sustainable throughputs, on the same systems as above:
 
 BFQ works for multi-queue devices too.
 
-The table of contents follow. Impatients can just jump to Section 3.
+The table of contents follows. Impatients can just jump to Section 3.
 
 CONTENTS
 
@@ -51,7 +51,7 @@ CONTENTS
  1-2 Server systems
 2. How does BFQ work?
 3. What are BFQ's tunables and how to properly configure BFQ?
-4. BFQ group scheduling
+4. Group scheduling with BFQ
  4-1 Service guarantees provided
  4-2 Interface
 
@@ -294,7 +294,7 @@ too.
 per-process ioprio and weight
 -----------------------------
 
-Unless the cgroups interface is used (see "4. BFQ group scheduling"),
+Unless the cgroups interface is used (see "4. Group scheduling with BFQ"),
 weights can be assigned to processes only indirectly, through I/O
 priorities, and according to the relation:
 weight = (IOPRIO_BE_NR - ioprio) * 10.
-- 
2.16.1

