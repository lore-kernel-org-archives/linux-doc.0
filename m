Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 99AAF7D982
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Nov 2018 09:57:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729426AbeKLTuB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Nov 2018 14:50:01 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50839 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729343AbeKLTuA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Nov 2018 14:50:00 -0500
Received: by mail-wm1-f66.google.com with SMTP id 124-v6so7858303wmw.0
        for <linux-doc@vger.kernel.org>; Mon, 12 Nov 2018 01:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=95cHSgXhObq6AUCu/Rr/+wEQTPHLVt9I8/orFJ2tnV8=;
        b=ZntydDL3A95QZ0Q9bqPS7efY9/AnOcRfFMoWhJjuF9Gk55eXToWWO0MFVufb41xZUb
         nHLiTbmFBZG9+1cdt8aSYqRhhgzNW6mvo/J47vdQ+DPObGyWLAiX1dVnw6VnyGsWrHIX
         7rTjNGD9VyfMoQr33985it7yVDU+01tI7ZnNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=95cHSgXhObq6AUCu/Rr/+wEQTPHLVt9I8/orFJ2tnV8=;
        b=OMSh9r5Esmu+qkJb+p6cmYLgbCotre94+UYmWzTEwVS+Of8clpxzVFTwn6+oLDWhwj
         Lfe+aO+uiY5v26NoUo+kSnLNSJkjGYEAwrtKZXpDP41G3zDrdcVdPnz8SGzo+2yfWrje
         rASSz69LbnuVBxJFoX+equ4K+Wi1SGAuNqRshFXVjajMNncb7iAR34GIkzIJS+WNtP0/
         9hhnCpyJXmyEocL2wrjEJLVvg4jd/e5GQsd98xE7IuxmfJVdZR8iQMO0Q69eWKlDYsRi
         xUC8neZ1SBs/6eRrF957HHGzeHJQIYeogEIjykeYzYtHqWc4it1KQJ1apT2wcgtXRsQe
         k8ZQ==
X-Gm-Message-State: AGRZ1gIdFKjLeYNNTroSlpc3hB9WANqfF7j954gVX29WuHrW4wMrqlMD
        R9bRxGHeOAkvFbauCOBNm6wbuw==
X-Google-Smtp-Source: AJdET5eIJV6u6HegcE4uV2vFatX404HGAoD92vBcn00/LSxYXW6IXRwdLIzD2IsbIvSV20KQIm8j7w==
X-Received: by 2002:a1c:3b06:: with SMTP id i6-v6mr6807918wma.18.1542016650265;
        Mon, 12 Nov 2018 01:57:30 -0800 (PST)
Received: from localhost.localdomain ([93.68.220.21])
        by smtp.gmail.com with ESMTPSA id r14-v6sm21273089wro.8.2018.11.12.01.57.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Nov 2018 01:57:29 -0800 (PST)
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
Subject: [PATCH 11/12] doc, bfq-iosched: fix a few clerical errors
Date:   Mon, 12 Nov 2018 10:56:31 +0100
Message-Id: <20181112095632.69114-12-paolo.valente@linaro.org>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20181112095632.69114-1-paolo.valente@linaro.org>
References: <20181112095632.69114-1-paolo.valente@linaro.org>
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

