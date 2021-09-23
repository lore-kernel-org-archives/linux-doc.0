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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30E1C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 09:39:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B89C86023F
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 09:39:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240154AbhIWJkx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Sep 2021 05:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238217AbhIWJkx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Sep 2021 05:40:53 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D447DC061574
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 02:39:21 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id 97-20020a9d006a000000b00545420bff9eso7691709ota.8
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 02:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jr8iX9G3UhUpRfRv9u5Ok4WEBnefPrNqQZG3Ri2E4NY=;
        b=NL/uf19fG5UgmYhe1Mcwmh70KiFf1CS56dI9A5yBVcfBmwkke0HfG0cvXHYr32Sad0
         I1j7Ae2c1v+X/o6n0jIJdRY4Gpa69wRE9rRJ17QPb9dtk6urSRzERi264E2hYzqkO1pK
         deq1+khA9xh27wyZBxvzxSoDuI1p5ZVelaKr9BidQNRyI5vi4Rt/sdAzPnpjLPFKnuGK
         Fcuanh3SYjvM/OFVH+6F1aMaWBbGn7IW+YbUyiBK2aK4ahVCwGv6yiTo9FOQpceEM9pf
         sEzTEpggTk1fJi9NUaF7czpcEhoR59LzqZNVZL1vfzb576sGX8NxPx/iHzOBl0aF+kzG
         TEhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jr8iX9G3UhUpRfRv9u5Ok4WEBnefPrNqQZG3Ri2E4NY=;
        b=cHrLpIfYPLD6SfesXjpuzZ9Mx7n77SWozydIfOkCU8yP/ewa3AWYGdNhqTtdQOaWJp
         3Byq0bBySy0VWtXkKK1Ko8UhtY8M9dWryed62YjRWmaSwzwn/VRTE8K605ymI6GnW2Dn
         004u8XD9lNxvkE73xFW8CJyAFyFOvbsPk/4nqx8hFDjI7uGovwk+aildj3HtPwL0JKq5
         Jd6vls9p8aEtuKNzx8kbrC6i+zs0kQRWPPhupEBDKEXXp18NnAH0GAVpeeysy93NhINR
         nmHOu67XMjcA5fNPaGfSxh2awijBHjfwbEeKCjWJTZn3a8txeERGYJLRzq3Yw0kvziOF
         eL5g==
X-Gm-Message-State: AOAM531ieIvZKAQg51Nx0i7kQPv12CE08g/iyhVXh8LsndzNiP+E+A4Z
        +W7HH6O5/gERYB/cSG5grQI=
X-Google-Smtp-Source: ABdhPJynC3Q+PqnlVs/kpG5L8YbpUBsoGkbal+r7F6PKe35eaZpisddfgTcCQUJqihJKbWsxP2VNzA==
X-Received: by 2002:a9d:7093:: with SMTP id l19mr3408391otj.15.1632389960880;
        Thu, 23 Sep 2021 02:39:20 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.165])
        by smtp.gmail.com with ESMTPSA id a67sm1158328otb.0.2021.09.23.02.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 02:39:20 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 2/3] docs/zh_CN: typo fix and improve translation
Date:   Thu, 23 Sep 2021 17:37:55 +0800
Message-Id: <3adedda2b247be53defc9078104221f00b4c78cd.1632389476.git.siyanteng@loongson.cn>
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

- fix a typo.
- modify some word to improve zh_CN/process/5.Posting.rst.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/process/5.Posting.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/5.Posting.rst b/Documentation/translations/zh_CN/process/5.Posting.rst
index b0c65614844d..4ee7de13f373 100644
--- a/Documentation/translations/zh_CN/process/5.Posting.rst
+++ b/Documentation/translations/zh_CN/process/5.Posting.rst
@@ -23,7 +23,7 @@
 :ref:`Documentation/translations/zh_CN/process/submitting-drivers.rst <cn_submittingdrivers>`
 和 :ref:`Documentation/translations/zh_CN/process/submit-checklist.rst <cn_submitchecklist>`。
 
-何时邮寄
+何时寄送
 --------
 
 在补丁完全“准备好”之前，避免发布补丁是一种持续的诱惑。对于简单的补丁，这
@@ -142,7 +142,7 @@
 一般来说，你越把自己放在每个阅读你变更日志的人的位置上，变更日志（和内核
 作为一个整体）就越好。
 
-不消说，变更日志是将变更提交到版本控制系统时使用的文本。接下来将是：
+不需要说，变更日志是将变更提交到版本控制系统时使用的文本。接下来将是：
 
  - 补丁本身，采用统一的（“-u”）补丁格式。使用“-p”选项来diff将使函数名与
    更改相关联，从而使结果补丁更容易被其他人读取。
@@ -186,10 +186,10 @@
 
 在补丁中添加标签时要小心：只有Cc:才适合在没有指定人员明确许可的情况下添加。
 
-发送补丁
+寄送补丁
 --------
 
-在寄出补丁之前，您还需要注意以下几点：
+在寄送补丁之前，您还需要注意以下几点：
 
  - 您确定您的邮件发送程序不会损坏补丁吗？被邮件客户端更改空白或修饰了行的补丁
    无法被另一端接受，并且通常不会进行任何详细检查。如果有任何疑问，先把补丁寄
-- 
2.27.0

