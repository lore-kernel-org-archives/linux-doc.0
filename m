Return-Path: <SRS0=nUK8=5W=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF4DC2BA1A
	for <linux-doc@archiver.kernel.org>; Mon,  6 Apr 2020 22:07:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4F1E2078C
	for <linux-doc@archiver.kernel.org>; Mon,  6 Apr 2020 22:07:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOLcSC6B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgDFWH4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 6 Apr 2020 18:07:56 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37545 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgDFWH4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 6 Apr 2020 18:07:56 -0400
Received: by mail-wr1-f67.google.com with SMTP id w10so1436033wrm.4
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2020 15:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qfW5u5mI/HAi3An+7O1maGs2wUrbGxWcL1AEWcmEKcE=;
        b=eOLcSC6B4NuFB+btcNH50FoR2npRkvnrf6OklYI0XZdJFc0YYI9loSYtt1+Uavxo8+
         r3zoH7blCCXY+v5ypg7B3Qko2jZ/jgCEABpKpbDEmsgPli/zCabKH2iRVTvUx/FNf3uY
         TqdfgSO/jkigIygEv8bldcBNP9OEuj5Oer+KHtSSk+99l/LCCY7HD+3b8NhFylQL5P24
         eTPI5JEnhAtDnI3cqqh3vD1nbNCNtZ3ZcjaKWxG244vi6d+glMH/Z87FNGwxlzLyaubT
         hzpQT0iBglIqJjBt2UWzX2T0ENCPsdQMv3gbBymgzAtkJK9bmJc9O6oQmBr50GMywiCF
         CG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qfW5u5mI/HAi3An+7O1maGs2wUrbGxWcL1AEWcmEKcE=;
        b=OdoKzZxj6cjE9s+f0jqOQEvQrVOb50bwL3asscg7GNdc5mIry+jf/qYWBeVN14tGqn
         yr+zHqGJbjuo2XYIvf3t5s2HPdRvqBiY5UyEob8c9TFuCjvlXZ3WXATdd8saGnR5f6LF
         +8oyYi18FSWj5pBQq6HwQ+BMH676FpsajGwaDK6/3JYD7+8b88T9rYParQ+jcuW6JMEq
         0IeZ5upAXCuen6CQQW8YK7EGXZ19uToe+lniTslfYphhJKgsQegdh4PExIM38CyE1LsW
         KKVqXgV3BYvatI5tqzf74Od97QQ7lvNokLk9HLT3WyX1kYoveWCX9AFyajED3zP0asai
         luOw==
X-Gm-Message-State: AGi0PuZQj4egcDtgvVYvwum6GxKNnb813n3eNnmvlWrtURddxiTViwyU
        /72Cx4APcYH82WV7/jZGm8phzfMDySk=
X-Google-Smtp-Source: APiQypL7AG4F3OeaDZxT2384smbTpMTrx7BbycfAtpQE3LwYJc2hstdVCfIV8MG05djmtD516WaFRw==
X-Received: by 2002:a5d:6742:: with SMTP id l2mr1551652wrw.124.1586210874350;
        Mon, 06 Apr 2020 15:07:54 -0700 (PDT)
Received: from de0709bef958.v.cablecom.net ([185.104.184.118])
        by smtp.gmail.com with ESMTPSA id c20sm1182830wmd.36.2020.04.06.15.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 15:07:53 -0700 (PDT)
From:   Lothar Rubusch <l.rubusch@gmail.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, Lothar Rubusch <l.rubusch@gmail.com>
Subject: [PATCH] Documentation: memory - fix warning
Date:   Mon,  6 Apr 2020 22:07:43 +0000
Message-Id: <20200406220743.22183-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The label in sphinx can refer to a document section but not to the document
header.

The handle 'memory_allocation' is used in another document(s) to refer to
GFP_KERNEL flags description in this modified document.

Since the sphinx label does not work as it is placed here, a proposal is to
better shift it to the section about memory allocation flags.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
 Documentation/core-api/memory-allocation.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/memory-allocation.rst b/Documentation/core-api/memory-allocation.rst
index 4aa82ddd01b8..4d66ddcb9883 100644
--- a/Documentation/core-api/memory-allocation.rst
+++ b/Documentation/core-api/memory-allocation.rst
@@ -1,5 +1,3 @@
-.. _memory_allocation:
-
 =======================
 Memory Allocation Guide
 =======================
@@ -26,6 +24,9 @@ answer, although very likely you should use
 Of course there are cases when other allocation APIs and different GFP
 flags must be used.
 
+
+.. _memory_allocation:
+
 Get Free Page flags
 ===================
 
-- 
2.20.1

