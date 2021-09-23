Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA74C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 09:39:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 622506023F
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 09:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240157AbhIWJks (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Sep 2021 05:40:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238217AbhIWJkr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Sep 2021 05:40:47 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 878D9C061574
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 02:39:16 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id s69so8771874oie.13
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 02:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=B8A2uJpt6M7HX3t+q4wVAO13CJ+WOFcn718WoIdO3Wk=;
        b=GCglrExBFVIHr8FNLadzBAwydflGhViHIDDAplFyE1QCFukH3xXrOaaQsLIuv6sOab
         JrXk+3PrFuFZTKMtdX65c8/Z6rS6uU1Td0rA33r39s2ononpF/nB9QsgmR6C78h0zoeT
         Dm17e9mARHLnAzBHKjYRm3f7i3VUg1Elwu1q8S2johJ0SWodv2giJt30T7w+GzWnrokS
         6XzpTiYYf8sN0CtSeX1lfeeBT/UVzMO59SkIM2w3KxbG/IzFoh5Wh+F+SF2Ab+VYMoGD
         FO9Bqse6S74TqCP7f5hC/+XHvZZJee6D1dNYqg0+cBP0HWHi6ZZFVn1fFnWrykrMpwV4
         RUhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=B8A2uJpt6M7HX3t+q4wVAO13CJ+WOFcn718WoIdO3Wk=;
        b=aLA3bBn/vwZh5a03MmHJxOz2fCSFTUN8svDiIYbjOvWC4IojSfYbGIGnULwNlfk3t6
         l4AWHuYUwZbY8U/q4ZAgyv99VFVC4un/fKJGhhIDY5oeVq+XxT+qJ2XPxLhEdw/hpuMV
         LQ47NAD4VBikU/2SpNYLABXgySVSpaG2lCQo5qoSojNBHkU2GuhQOQjdeOZKaEtnfVu3
         I4RuB4pXd5769KK1t+DDw4s0XIZErGHLVc/6P0ChB3Mtc53uj5hgGCrXETrmNDpFYL/K
         C0yuSCcbF2Q/LVbVFch+eog2NMmbNsSL4JSgVXwPDatGCr/BBZD8YXTgc/vS9yHADWDK
         PEWg==
X-Gm-Message-State: AOAM532W3RiwctRCftK0iT+5nD6rBjYiVGmL5CGPB8VR3+DPWR0OD103
        n4qYQTK8gje03y8bX73MKXQ=
X-Google-Smtp-Source: ABdhPJxsDqe2E4ZY4dWJ79fP7+a7t7CkuYayFV/DtSdMV6yCwvjfDq1cporrjp3TyxogLtWjNUnz2w==
X-Received: by 2002:a54:4f1d:: with SMTP id e29mr11488585oiy.129.1632389955495;
        Thu, 23 Sep 2021 02:39:15 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.165])
        by smtp.gmail.com with ESMTPSA id a67sm1158328otb.0.2021.09.23.02.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 02:39:15 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 1/3] docs/zh_CN: Improve zh_CN/process/howto.rst
Date:   Thu, 23 Sep 2021 17:37:54 +0800
Message-Id: <587fca686d8d7aa828dec2d803bf9f5d59819c57.1632389476.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1632389476.git.siyanteng@loongson.cn>
References: <cover.1632389476.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Yanteng Si <siyanteng01@gmail.com>

   - Improve grammar of zh_CN/process/howto.rst.
   - Resolve potential problems in documentation.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 Documentation/translations/zh_CN/process/howto.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/howto.rst b/Documentation/translations/zh_CN/process/howto.rst
index ee3dee476d57..2903d7161bc8 100644
--- a/Documentation/translations/zh_CN/process/howto.rst
+++ b/Documentation/translations/zh_CN/process/howto.rst
@@ -381,7 +381,7 @@ MAINTAINERS文件中可以找到不同话题对应的邮件列表。
 
 内核社区的工作模式同大多数传统公司开发队伍的工作模式并不相同。下面这些例
 子，可以帮助你避免某些可能发生问题：
-用这些话介绍你的修改提案会有好处：
+用这些话介绍你的修改提案会有好处：（在任何时候你都不应该用中文写提案）
 
     - 它同时解决了多个问题
     - 它删除了2000行代码
@@ -448,8 +448,8 @@ Linux内核社区并不喜欢一下接收大段的代码。修改需要被恰当
 保证修改分成很多小块，这样在整个项目都准备好被包含进内核之前，其中的一部
 分可能会先被接收。
 
-必须了解这样做是不可接受的：试图将未完成的工作提交进内核，然后再找时间修
-复。
+你必须明白这么做是无法令人接受的：试图将不完整的代码提交进内核，然后再找
+时间修复。
 
 
 证明修改的必要性
@@ -475,8 +475,8 @@ Linux内核社区并不喜欢一下接收大段的代码。修改需要被恰当
   	 https://www.ozlabs.org/~akpm/stuff/tpp.txt
 
 
-这些事情有时候做起来很难。要在任何方面都做到完美可能需要好几年时间。这是
-一个持续提高的过程，它需要大量的耐心和决心。只要不放弃，你一定可以做到。
+这些事情有时候做起来很难。想要在任何方面都做到完美可能需要好几年时间。这
+是一个持续提高的过程，它需要大量的耐心和决心。只要不放弃，你一定可以做到。
 很多人已经做到了，而他们都曾经和现在的你站在同样的起点上。
 
 
-- 
2.27.0

