Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4486DC433F5
	for <linux-doc@archiver.kernel.org>; Thu,  9 Dec 2021 09:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhLIJFd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 9 Dec 2021 04:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231602AbhLIJFd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Dec 2021 04:05:33 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA8BC061746
        for <linux-doc@vger.kernel.org>; Thu,  9 Dec 2021 01:02:00 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id z6so3397002plk.6
        for <linux-doc@vger.kernel.org>; Thu, 09 Dec 2021 01:02:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9eP7ojGx+d4skddjEFevXKgn9UuJjx0QvIejnKRsFzk=;
        b=Pb3Di6ftMP4EagvtFEh2gw3vpXB4plshT5uETdqSMwiWth05zZXpsg2+mx+Mj4mbTb
         pwQw1fMQ19RaDt2AlR1K5cF67u02UOpzdv1VvLUxghYsQIGcDV5U31+zxLhLKr9ABlSd
         hFRJ1jJN0WSP/A+Wb3dmcAbnetiv2QpUh1w1qpDJmD9ZgPAXnJd/uuG6m7zmFKsxolNn
         tm+WDDkU6+XOSDFQusrYJ3eqlXcOztUr6KhOBAlUn2WySq5asvjqKy9ciRIpDJxirqpz
         3saq79h9dUi/4ipi2ipwEehwhuDXgIJm9kHeCmavZEwLIoyPVup1rJGfR/Bd4tM0btnq
         7bWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9eP7ojGx+d4skddjEFevXKgn9UuJjx0QvIejnKRsFzk=;
        b=PNSXGV5Expx9oAs6txi2jV0uVs5waVaaaAfqY2vS+v3Bbg9/b5HMI+J3Dwu86rN8jK
         Sd+YdAWHQvgUEvsi4XB58aBNty+Vmg4gmWX/eKH1d6KWipw9EB4xnrXkfNe+tBZRdztp
         VUHjyUPpC9MerkS8+uLC4RVchB2hE8DyOaYp2fMUcgeb7jIIRQKA+QZV+Tf/x45Xmy8h
         U2xl4aI0vRFi/1dXGcqbzRpDh+ozgY+/sfUWRLMcItoLC7P3/qUd2RuYSsapAxyeIjoG
         x/pOemRyO89f9jkYTn1g1MIZhL8c+0zSrt3Xdi2gXGEg9rjrrFocsMxA2x6oxkH5BA88
         muwA==
X-Gm-Message-State: AOAM5323gLQ6BZO2zyndxJY4N7NaR5SB28XspywbP0NwLaIp4o1jW0MZ
        x/qznEf4bZ+rkwPYIXzf4xo=
X-Google-Smtp-Source: ABdhPJyH/2+kj8NdalOrS2q/ZMpUZCTvufebyw5PktW9G4ZgM0j/qI1WCNCuYB/KnZhgHXG+wNegAg==
X-Received: by 2002:a17:90b:4d85:: with SMTP id oj5mr13892703pjb.188.1639040519847;
        Thu, 09 Dec 2021 01:01:59 -0800 (PST)
Received: from localhost.localdomain ([8.31.2.21])
        by smtp.gmail.com with ESMTPSA id u5sm4892879pgm.60.2021.12.09.01.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 01:01:59 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     weizhenliang@huawei.com
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] docs/zh_CN: add two colons to page_owner_sort
Date:   Thu,  9 Dec 2021 17:00:31 +0800
Message-Id: <20211209090031.537846-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Since f7df2b1cf03a ("tools/vm/page_owner_sort.c: count and sort by mem") which
introduce a warning:

linux/Documentation/vm/page_owner.rst:92: WARNING: Unexpected indentation.
linux/Documentation/vm/page_owner.rst:96: WARNING: Unexpected indentation.
linux/Documentation/vm/page_owner.rst:107: WARNING: Unexpected indentation.

A paragraph consisting of two colons ("::") signifies that the following text block(s) comprise a literal block.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/vm/page_owner.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/vm/page_owner.rst b/Documentation/vm/page_owner.rst
index 9837fc8147dd..14b5c45f43a3 100644
--- a/Documentation/vm/page_owner.rst
+++ b/Documentation/vm/page_owner.rst
@@ -85,7 +85,7 @@ Usage
 	cat /sys/kernel/debug/page_owner > page_owner_full.txt
 	./page_owner_sort page_owner_full.txt sorted_page_owner.txt
 
-   The general output of ``page_owner_full.txt`` is as follows:
+   The general output of ``page_owner_full.txt`` is as follows::
 
 	Page allocated via order XXX, ...
 	PFN XXX ...
@@ -100,7 +100,7 @@ Usage
    and pages of buf, and finally sorts them according to the times.
 
    See the result about who allocated each page
-   in the ``sorted_page_owner.txt``. General output:
+   in the ``sorted_page_owner.txt``. General output::
 
 	XXX times, XXX pages:
 	Page allocated via order XXX, ...
-- 
2.27.0

