Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CF3C433EF
	for <linux-doc@archiver.kernel.org>; Sun,  5 Dec 2021 13:45:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234248AbhLENtB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 5 Dec 2021 08:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbhLENtA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 5 Dec 2021 08:49:00 -0500
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C347C061714
        for <linux-doc@vger.kernel.org>; Sun,  5 Dec 2021 05:45:33 -0800 (PST)
Received: by mail-pg1-x530.google.com with SMTP id 137so7912477pgg.3
        for <linux-doc@vger.kernel.org>; Sun, 05 Dec 2021 05:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zMuVD0TWQTA5Y8LGMslSEVwymZfpOrrh0wVfdWaQVpA=;
        b=UBH5NwQWGUWJ8vUPPQqYdKhKu9/0K6Tz5TCAKzFHOTsu7J/zirDvrwvOqDJLbsWMl7
         k/aH4hvblkKqmi8rsknsnVm5/Rtx9oxYzVyY+P9I9h0rExT5suqh1RuZtba7OP9PkHAg
         2t08exkqKcXsztX+m5b1GvbAVxcGdAwHhR8iMyaLRlhvL7n/szQo/O2kzjyj8xWtSCF6
         lIYJGz+zB8UFhle5SWBwwfQqeFhNSi1HnNmkV7Cj09MjeaZz7ApTbAkLCy3i11etOHwB
         uxu1i+R4ahwY5YkmSyGGdudGepm+KcMziQCKAWHqIgN7WI3fsCnruWX6dBLz9JrCt02o
         RFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zMuVD0TWQTA5Y8LGMslSEVwymZfpOrrh0wVfdWaQVpA=;
        b=WXMH5/3PxLhyIV12qOdMb+Q8BVAbmuQ4nufbkhGAYZ9O6W1col60orVqANHJUXpcc/
         0A7NKJmakKUfB4nRZBHIRUgz48RS19LisknT9WouWRvwaMcMQWHZjxeGiIapdTwEoX4U
         0VtPSPepBgrepef+MsDlG4u/p2K+EK/eOmF3egU3EGrkrRN0wg0rJVFhtOCcMNoRNtLo
         o0ERa2DOIMQgctCSKGf7RcUyL0OW+MDlehgdCdEP5nbhC9agdLk52I2JsGAdbVy/h8qu
         E4GJlg0s7GnDzNSIZLNWwrOxMMkU4wd2iKrPujs73lkSH4cFfMRGyYahJTXK7HRS8DFm
         Mp5Q==
X-Gm-Message-State: AOAM531PuoG4dVGw4fQ823ATWi5APmdwOVL4LGrZrmbcEk8dT6u32muw
        wUgaCQY0Ne3GJL5dNPF/B/73G9GK9bD38Q==
X-Google-Smtp-Source: ABdhPJxRl1waVai/nIFqLCycml3DrNfkXexkuPGR55Xsc6Kb9g++jJu4t177OJQ7jqZIwGwP4EwetQ==
X-Received: by 2002:a63:4a42:: with SMTP id j2mr13963354pgl.113.1638711932556;
        Sun, 05 Dec 2021 05:45:32 -0800 (PST)
Received: from localhost.localdomain ([8.26.182.175])
        by smtp.gmail.com with ESMTPSA id g19sm4265114pfc.145.2021.12.05.05.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Dec 2021 05:45:32 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 04/11] docs/vm: delele three spaces from page_owner
Date:   Sun,  5 Dec 2021 21:43:53 +0800
Message-Id: <761f674199f426431c894c3a2eeda2e57ced925f.1638706875.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1638706875.git.siyanteng@loongson.cn>
References: <cover.1638706875.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix warning as:

linux-next/Documentation/vm/page_owner.rst:92: WARNING: Unexpected indentation.
linux-next/Documentation/vm/page_owner.rst:96: WARNING: Unexpected indentation.
linux-next/Documentation/vm/page_owner.rst:107: WARNING: Unexpected indentation.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/vm/page_owner.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/vm/page_owner.rst b/Documentation/vm/page_owner.rst
index 9837fc8147dd..9a3af6aafa09 100644
--- a/Documentation/vm/page_owner.rst
+++ b/Documentation/vm/page_owner.rst
@@ -89,11 +89,11 @@ Usage
 
 	Page allocated via order XXX, ...
 	PFN XXX ...
-	 // Detailed stack
+	// Detailed stack
 
 	Page allocated via order XXX, ...
 	PFN XXX ...
-	 // Detailed stack
+	// Detailed stack
 
    The ``page_owner_sort`` tool ignores ``PFN`` rows, puts the remaining rows
    in buf, uses regexp to extract the page order value, counts the times
@@ -104,7 +104,7 @@ Usage
 
 	XXX times, XXX pages:
 	Page allocated via order XXX, ...
-	 // Detailed stack
+	// Detailed stack
 
    By default, ``page_owner_sort`` is sorted according to the times of buf.
    If you want to sort by the pages nums of buf, use the ``-m`` parameter.
-- 
2.27.0

