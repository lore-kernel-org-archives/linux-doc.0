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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19F36C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 08:01:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EC5C861362
	for <linux-doc@archiver.kernel.org>; Tue, 14 Sep 2021 08:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbhINICE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Sep 2021 04:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbhINICD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Sep 2021 04:02:03 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5F68C061574
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 01:00:46 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id r2so11957728pgl.10
        for <linux-doc@vger.kernel.org>; Tue, 14 Sep 2021 01:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mgORfMxiOk/UIxcYd1QDOtKkCKlT2E4pau/yX9rjQxY=;
        b=BcuuvOSgTELnSvr9i4umu5VgBkkCzY5gg3PhdRFQx+XAVxvNHh3eR6m2Jeet5ggzAk
         0BO4BfDyJ4DMA/7F1/1Xnn4e6tiD1v1MVAuLSB5WR0VqHLL4qiXJ2oNMfGuoQE0foa/s
         37lF3KOF0WFTXeVFdw2K59j94yGisU6/tJFVNLbUDtYRV2qsT5pjOp5BMNBpKfrO9H6m
         dxgYrVsmtAGc+hjQavx3A5vRT7YIyxrL6yq1KS+LonvnBRV0co0kM3qkWzcz80umBfso
         RrvLREyiMrZe/EuQxCIqZcJT6eftWWqV/2mCS1sBIpiJOiT2iEhxwKJPjowNhli+PZno
         Rs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mgORfMxiOk/UIxcYd1QDOtKkCKlT2E4pau/yX9rjQxY=;
        b=8Jvna+T2VmKuThnWEUIoxHvSQJcOVz+Dtq1o6rn29n37WNlh2vG0oiZ39NkbtA2vHJ
         1GSNGDwbY1iqDmpupwsfnQqOK1fqGYFeQJ+O/g8j/spQDgqqqfhAO144OGJRux8WXSI+
         ZR7lRjCiZeEq9cSa61Ck+A0oM1L4XgDvmODaKfQfH7bM4YPt2v4j8l/cZSCjv0FZoKEi
         22blcDfE7NTIbfXfApNA8znIoetIpfaCtRFUjbjZNdAX53PXhZ2wCXVZsbHPXeXGdcrr
         1b27P6u08FNOp1nnJ+dS6DygcA7HvOSNvm2QlfuTn+Am51sBb9HIvf+Zog8veBS5DU69
         7Qug==
X-Gm-Message-State: AOAM531K4V0t8iY7cwEi0kVUX6Shl/gOJQvCS//R3cVvq96DNU6VHTbJ
        YiFXHkKiWr9n4NVImhPlz/0=
X-Google-Smtp-Source: ABdhPJzrEye1KN1B3UYRVKmbvnNQQP3hXIFiPnjKgt7N0DrP5hizgnRWCTZ8gyFY/z6AEB4eKWnuHQ==
X-Received: by 2002:a63:78c5:: with SMTP id t188mr14315885pgc.386.1631606446426;
        Tue, 14 Sep 2021 01:00:46 -0700 (PDT)
Received: from localhost.localdomain ([8.47.69.162])
        by smtp.gmail.com with ESMTPSA id w11sm10226721pgf.5.2021.09.14.01.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 01:00:45 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH 2/3] docs/zh_CN: typo fix and improve translation
Date:   Tue, 14 Sep 2021 15:59:48 +0800
Message-Id: <05ea58c7abf27ae451f2f3274d8dd41e1f8bc11d.1631605791.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1631605791.git.siyanteng@loongson.cn>
References: <cover.1631605791.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

- fix a typo.
- modify some word to improve zh_CN/process/5.Posting.rst.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 Documentation/translations/zh_CN/process/5.Posting.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/5.Posting.rst b/Documentation/translations/zh_CN/process/5.Posting.rst
index b0c65614844d..ce62cf0d81c3 100644
--- a/Documentation/translations/zh_CN/process/5.Posting.rst
+++ b/Documentation/translations/zh_CN/process/5.Posting.rst
@@ -23,7 +23,7 @@
 :ref:`Documentation/translations/zh_CN/process/submitting-drivers.rst <cn_submittingdrivers>`
 和 :ref:`Documentation/translations/zh_CN/process/submit-checklist.rst <cn_submitchecklist>`。
 
-何时邮寄
+何时发送
 --------
 
 在补丁完全“准备好”之前，避免发布补丁是一种持续的诱惑。对于简单的补丁，这
@@ -142,7 +142,7 @@
 一般来说，你越把自己放在每个阅读你变更日志的人的位置上，变更日志（和内核
 作为一个整体）就越好。
 
-不消说，变更日志是将变更提交到版本控制系统时使用的文本。接下来将是：
+不需要说，变更日志是将变更提交到版本控制系统时使用的文本。接下来将是：
 
  - 补丁本身，采用统一的（“-u”）补丁格式。使用“-p”选项来diff将使函数名与
    更改相关联，从而使结果补丁更容易被其他人读取。
@@ -189,10 +189,10 @@
 发送补丁
 --------
 
-在寄出补丁之前，您还需要注意以下几点：
+在发送补丁之前，您还需要注意以下几点：
 
  - 您确定您的邮件发送程序不会损坏补丁吗？被邮件客户端更改空白或修饰了行的补丁
-   无法被另一端接受，并且通常不会进行任何详细检查。如果有任何疑问，先把补丁寄
+   无法被另一端接受，并且通常不会进行任何详细检查。如果有任何疑问，先把补丁发
    给你自己，让你自己确定它是完好无损的。
 
    :ref:`Documentation/translations/zh_CN/process/email-clients.rst <cn_email_clients>`
@@ -206,7 +206,7 @@
 补丁应始终以纯文本形式发送。请不要将它们作为附件发送；这使得审阅者在答复中更难
 引用补丁的部分。相反，只需将补丁直接放到您的消息中。
 
-寄出补丁时，重要的是将副本发送给任何可能感兴趣的人。与其他一些项目不同，内核
+发出补丁时，重要的是将副本发送给任何可能感兴趣的人。与其他一些项目不同，内核
 鼓励人们甚至错误地发送过多的副本；不要假定相关人员会看到您在邮件列表中的发布。
 尤其是，副本应发送至：
 
-- 
2.27.0

