Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 32ED37D04D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 10 Apr 2019 05:15:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725838AbfDJFPQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 10 Apr 2019 01:15:16 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39742 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfDJFPQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 10 Apr 2019 01:15:16 -0400
Received: by mail-qk1-f196.google.com with SMTP id c189so479064qke.6
        for <linux-doc@vger.kernel.org>; Tue, 09 Apr 2019 22:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=SFKPgoTlfhejuGwm6gMRCefTFRULz3hgwemumv3gp/0=;
        b=kL76OatMAw7/HiHkBU6XzZ0wZjksrcJGfIwmEVo/s3Vq+03l9Q9Vuci0F4UgYhl1e1
         Sw7qdVhs83pq5sZgj0lo9CQo+8GV8LjAfS+k6YgZgmEI5pqapBCMvilSY9V99cmDv3za
         q6S4My94/Ks60FjBMVFj5N2isUWvYbbNaEYBMv6N1K5wsCiWR6FUNjb8//xNN8psDlZI
         h2JtVlZ+kA2gXAweaqVvinAttjoPDYng9XsmFh0bNW8b2OkVDEyRFu5EKe1Vya2skAlF
         FsH2Q8dt4U+rj5nfykEo935c3UO7mq38zvrxIFm1hlTA5rNN93cyFym/kjZ4tFYg+J9F
         xN5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=SFKPgoTlfhejuGwm6gMRCefTFRULz3hgwemumv3gp/0=;
        b=PayJgWRNNvly9fEvJBW/xn168s9oBA3P+wO+dKryrvANNSV7EZ6d4cO4lRj6p1klIB
         nJ4NynMALiJ2WKyS4AQtywR0aAyoBl9RrA2bc9ZlmaD7GxO0xHPnVbNWbK3jOmlUHAk+
         S99lason6ZjN6Wz4mhkEDHM+/jfkPteq7+cvF4hpdWqVAv3TWw3l1Y4Cm8o96ZF6jrB0
         WAvyE1p7l8EdtbFPviAWhbVlJUz0c9MdbiNSJVE+dAdRji3qkegkLEAZaTt7NSf29mz4
         aVgvIg4vnpA4Mp5zNVgp8EYx+qTnearMuNZqMdWinIcHeEDtBv2hNyIVnT9e2tUKvraG
         y1Tw==
X-Gm-Message-State: APjAAAW2cPgHbs1s39S9A/g+BdZKqsYc4vUOrXnKB83M1tuqmOpUSnAg
        TwEaSOA63yw+NvWPwioPXAs=
X-Google-Smtp-Source: APXvYqx0bwKzLfEHY4cs3u/aUwsyoyLot2fGmcLK/TRc1fpA+915PFku8uuR/5AAL/g1AlZ0wxal0g==
X-Received: by 2002:a37:69c3:: with SMTP id e186mr11175507qkc.308.1554873315791;
        Tue, 09 Apr 2019 22:15:15 -0700 (PDT)
Received: from localhost ([2601:98a:4100:d293:3216:135d:22bc:397f])
        by smtp.gmail.com with ESMTPSA id 204sm19449646qki.58.2019.04.09.22.15.15
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2019 22:15:15 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     maxk@qti.qualcomm.com, davem@davemloft.net, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, Dongliang Mu <mudongliangabcd@gmail.com>
Subject: [PATCH] docs: fix typo in networking/tuntap.txt
Date:   Wed, 10 Apr 2019 01:15:28 -0400
Message-Id: <20190410051528.21275-1-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Modify "can uses" to "can use"

Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 Documentation/networking/tuntap.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/tuntap.txt b/Documentation/networking/tuntap.txt
index 949d5dcdd9a3..59f1c6b55249 100644
--- a/Documentation/networking/tuntap.txt
+++ b/Documentation/networking/tuntap.txt
@@ -107,7 +107,7 @@ Copyright (C) 1999-2000 Maxim Krasnyansky <max_mk@yahoo.com>
 
   3.3 Multiqueue tuntap interface:
 
-  From version 3.8, Linux supports multiqueue tuntap which can uses multiple
+  From version 3.8, Linux supports multiqueue tuntap which can use multiple
   file descriptors (queues) to parallelize packets sending or receiving. The
   device allocation is the same as before, and if user wants to create multiple
   queues, TUNSETIFF with the same device name must be called many times with
-- 
2.11.0

