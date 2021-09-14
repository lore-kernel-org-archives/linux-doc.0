Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB339C433FE
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 08:00:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD58861362
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 08:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhINICA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 04:02:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhINICA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Sep 2021 04:02:00 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEF5AC061574
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 01:00:43 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id g184so11972960pgc.6
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 01:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Odoz52B4Ks8370wEnYnyZxt1Zm1G/k1bWAcZd9s1NHQ=;
        b=a4hbIY5S3YjsAVxgxze1DO+styRqUlq8Puyrvj1YsNUd7XdZOYBK7RCpAo4DHzXoAW
         lsj7WL2mPMNdu631rcWJ9RCzoqculGE23egVVTRMEulfxlv5gLcPlkVPqrMsfTx2xxJS
         vEFwlRI4n4CVObpFCHZ/91QSr9pHy6D8xPU0QYi+q/oWGK4jjIjLBxYEf14EebCl3JCE
         9BLgs3yaH3zxfMveAaJC6DeB2fpU4ZuqsvA9dkB92Y22LRHQWqBwbtEAmju9XMzVTtGq
         Io8DNn0mXg5dvoianP//EjsnDw4NOTVZiFx61P/p1BSTTHVkjkJkJhc+LSpSC2/OoX8B
         8WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Odoz52B4Ks8370wEnYnyZxt1Zm1G/k1bWAcZd9s1NHQ=;
        b=vEm2G7BJu6ZThz4aItfk7Z/3oKzoFlhTWcxkBHdaVkQQ2JOEhc3800ciIMYd4uQC3i
         Vt1LlrReakcTOhY/CcLWywResvgGilJoxDAdO+qYZTIG/DMiX8uVrwW4q1ePV1Nai940
         DyI0W4fcy8OHqAE8m9MLqanGYkE9HYmc3WoUkygYAo48n5KQZu1LLTysTisFe3kJbuW+
         u0zKjJDpNCTyrgPMK9r33E38lYD4xsrHtsbNZkkzwMjLLAW0KKsPiRLSEQuHqzM0kc9b
         zrbTF39DHnWT/s0uCWDQI9DVUUzakBNIV4M4Ln2nbz/f71BAdHku50Upam6jd2VVJccr
         WbYA==
X-Gm-Message-State: AOAM5330peffsU9nwMiu4ekMeRu+YIPAD0ameyOnVocOel4XJpCzF/h6
        qhyzFbsQG9o1YC6GvRt1rgw=
X-Google-Smtp-Source: ABdhPJzJhdEQGgDWgbK8uNVSLFu1auo1Zpf+bfjg/my/go1rb++4K5fvxUbe1kM5HPh6fiFTznpx1Q==
X-Received: by 2002:a62:5185:0:b0:43e:79c:6b6 with SMTP id f127-20020a625185000000b0043e079c06b6mr762524pfb.79.1631606443268;
        Tue, 14 Sep 2021 01:00:43 -0700 (PDT)
Received: from localhost.localdomain ([8.47.69.162])
        by smtp.gmail.com with ESMTPSA id w11sm10226721pgf.5.2021.09.14.01.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 01:00:42 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 1/3] docs/zh_CN: Improve zh_CN/process/howto.rst
Date:   Tue, 14 Sep 2021 15:59:47 +0800
Message-Id: <6790175c0419d5d140f17d9c078c8538136e8190.1631605791.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1631605791.git.siyanteng@loongson.cn>
References: <cover.1631605791.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

   - Improve grammar of zh_CN/process/howto.rst.
   - Resolve potential problems in documentation.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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

