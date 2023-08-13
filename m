Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57521EB64DD
	for <linux-doc@archiver.kernel.org>; Sun, 13 Aug 2023 13:25:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjHMNZO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 13 Aug 2023 09:25:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjHMNZO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 13 Aug 2023 09:25:14 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CF31712
        for <linux-doc@vger.kernel.org>; Sun, 13 Aug 2023 06:25:14 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-26b53e38858so42159a91.1
        for <linux-doc@vger.kernel.org>; Sun, 13 Aug 2023 06:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smartx-com.20221208.gappssmtp.com; s=20221208; t=1691933114; x=1692537914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fq9yFSMeFITasAMS/3yyXNAHvRnkfWa8YD9NQqS5Txw=;
        b=opngp+1v0+sG2qQBoDuwbZji5efufIlQizEopi1kpijPyyPxWo6PmpWcypU7VkBdor
         TM8E3lw3Vtb3rZXZ0QvLFLLXWx44RYbyegHG2x5hwL4XvG/9BmgUJWU5FKzVeXdMQTvO
         LFFd0SzTxgQTDXIeJ7r0jjCts5Pagk8kXlz6eqOPEFxIy9laQ1xkicgSjsUVgxeDHxy4
         19VuqKwwjiQPx/giK4o6tvWfAc7YXcu0xu+pOq+p8AQpMN7KLSYas4U2Gi/2Jr/piu6Y
         4QebHQGfdIyS9larlkjGh3cEx8yGDbpOX0e9RZ458PwJaO4D9uou3/E4kvzY4MTmGcBe
         0LcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691933114; x=1692537914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fq9yFSMeFITasAMS/3yyXNAHvRnkfWa8YD9NQqS5Txw=;
        b=EnSGMBjV9Q7tezuqYpHP0420ghXIkdCOnQWXAicRcW4dBM66xsycyg85L87Ptovndw
         y0x/ISSOcSZUc4Mzhg1ZQuMImR2JvwXbrzefigNw/HZY8r/xLB7AHkmvFwFQALVpArmA
         XUgb0EycbEMb1C4ESWLtAI48wcNdr9k53C4+P3Acl4zb2JFZGlfbc2NMZlg0i+tri5yZ
         qyo+VrC+noDVzIu/eg33ZoBOk15ZWIihxQwsfjW+VOTEFrbyNheNxr8OJJujlXpa5KzP
         2tTkETQNRLBg5ldp2n0m3wgGFYQ6pEuyBe9x/dz7Y4B1hElvh4CFunLhPeJV0iFABG+5
         BOIA==
X-Gm-Message-State: AOJu0YyEvjp7Mw9n9WoTNqkuDj/jehO1dlBW5W8ri86r461BeeiyLhya
        y6qGG0jxUoabGN2K21UhQEN2Yw==
X-Google-Smtp-Source: AGHT+IHYqdGm+Bzbw5l0il9dl/ZqqeSbFWJr+plvXKLg/mvqEbep4ONqrMWjK6gNPvo1aG24f4z5wQ==
X-Received: by 2002:a17:90a:304d:b0:263:ac11:c6d2 with SMTP id q13-20020a17090a304d00b00263ac11c6d2mr3912444pjl.25.1691933114042;
        Sun, 13 Aug 2023 06:25:14 -0700 (PDT)
Received: from nixos.tailf4e9e.ts.net ([47.75.78.161])
        by smtp.googlemail.com with ESMTPSA id p2-20020a17090a284200b00264044cca0fsm15851905pjf.1.2023.08.13.06.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Aug 2023 06:25:13 -0700 (PDT)
From:   Xueshi Hu <xueshi.hu@smartx.com>
To:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, Xueshi Hu <xueshi.hu@smartx.com>
Subject: [PATCH] docs/zh_CN: correct regi_chg(),regi_add() to region_chg(),region_add()
Date:   Sun, 13 Aug 2023 21:24:17 +0800
Message-Id: <20230813132417.815036-1-xueshi.hu@smartx.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Minor typo fix in translations.

Signed-off-by: Xueshi Hu <xueshi.hu@smartx.com>
---
 Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst b/Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst
index b7a0544224ad..45048a30f736 100644
--- a/Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst
+++ b/Documentation/translations/zh_CN/mm/hugetlbfs_reserv.rst
@@ -296,7 +296,7 @@ COW和预留
    调用代码执行全局检查和分配，以确定是否有足够的巨页使操作成功。
 
 2)
-  a) 如果操作能够成功，regi_add()将被调用，以实际修改先前传递给regi_chg()的相同范围
+  a) 如果操作能够成功，region_add()将被调用，以实际修改先前传递给region_chg()的相同范围
      [f, t]的预留映射。
   b) 如果操作不能成功，region_abort被调用，在相同的范围[f, t]内中止操作。
 
@@ -307,7 +307,7 @@ COW和预留
 如上所述，region_chg()确定该范围内当前没有在映射中表示的页面的数量。region_add()返回添加
 到映射中的范围内的页数。在大多数情况下， region_add() 的返回值与 region_chg() 的返回值相
 同。然而，在共享映射的情况下，有可能在调用 region_chg() 和 region_add() 之间对预留映射进
-行更改。在这种情况下，regi_add()的返回值将与regi_chg()的返回值不符。在这种情况下，全局计数
+行更改。在这种情况下，region_add()的返回值将与region_chg()的返回值不符。在这种情况下，全局计数
 和子池计数很可能是不正确的，需要调整。检查这种情况并进行适当的调整是调用者的责任。
 
 函数region_del()被调用以从预留映射中移除区域。
-- 
2.40.1

