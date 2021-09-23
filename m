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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 830A2C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 09:39:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AC586124F
	for <linux-doc@archiver.kernel.org>; Thu, 23 Sep 2021 09:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240204AbhIWJk6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Sep 2021 05:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238217AbhIWJk6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Sep 2021 05:40:58 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5C5DC061574
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 02:39:26 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso7656251otv.12
        for <linux-doc@vger.kernel.org>; Thu, 23 Sep 2021 02:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HtM1ldBd9rWQIguvbbxP2pEDIYD34l4V1N/0KWZQaGk=;
        b=gjugM6o/zOIt1ODlO3hT40QPE2YeGqQI8jYmtGBxKti564Nm6mmarVlbKXDlqS2ol8
         13Hv7BGqDepa9odvGv3nIcUceQSoDnI/fJQ+bnZET3Kc1HgB5bFvwgdxPRwkBKKQiJGr
         DCZ3D/GwqCNDntbTAbCmhog8ZJg6nDhFDoS2hgOdu/yI6xJMC5AMQvcc/guhgGMdxZo9
         rO3hUZZ42L3N+o/LoYvmtC9zLb8mbQuRfphCFwR49IEcodCYwuXRb45Cmkizj/epYdq/
         h0ShbJEJFSDJy3Gnewie42gJW8SW++M2VD5OjZOaE2J34FL3xEIqW35+0usw7GLO4s/8
         BfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HtM1ldBd9rWQIguvbbxP2pEDIYD34l4V1N/0KWZQaGk=;
        b=irSbrjk5If3w7gjOWZkfr7FSAd9zLqwdfk90HTJtPj71FXPwbuLQlHD4eLz6s6E5yb
         40qwSYSYUr8o9MO3RWptbZ54wI5BPzIPGSsyhoqtQydE9wMaxNR92q7mhDsCXlOw7rMW
         XFdC57K+67bpMHsx1tZ2vf6R9ZbsjT66HAq7yAMcsvG3pK+3ZTo3GWeVcMbsvg1XPZy1
         u/++J9nyfzDWmLhl5qETA584rSaO+LBTDVY5YqS+kNMvudWed+3/ymoQ2pcsrOxI/zfi
         tYMFXGkgL2oejdGzzoPfZw4KUG0WjyVLEe37FSZnp7H+lcvKRXYUT9wfqujA7Sp+A0t6
         Iu9g==
X-Gm-Message-State: AOAM533x9Frsntuv3Sq6GhYHX4MtQbBipYik5Hz9+8C+l2gvfKU4C4Jh
        l6PdEb5PMEhgTPZtnzLgGzs=
X-Google-Smtp-Source: ABdhPJwLWcE+0M5zR9Gxojjp6DtDwSwYvU76uYk2QrUbPkcnZpAN1yUErr3UkC+UTtsz6Y0kD4M55Q==
X-Received: by 2002:a9d:4681:: with SMTP id z1mr3486243ote.42.1632389966208;
        Thu, 23 Sep 2021 02:39:26 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.165])
        by smtp.gmail.com with ESMTPSA id a67sm1158328otb.0.2021.09.23.02.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Sep 2021 02:39:25 -0700 (PDT)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, bobwxc@email.cn,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng01@gmail.com>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v2 3/3] docs/zh_CN: modify some words
Date:   Thu, 23 Sep 2021 17:37:56 +0800
Message-Id: <c46432c5801edd44800e679dc34bce95c5e37f85.1632389476.git.siyanteng@loongson.cn>
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

commit message in English, we better not give the Chinese readers a wrong guidance.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
---
 .../translations/zh_CN/process/submitting-patches.rst         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/submitting-patches.rst b/Documentation/translations/zh_CN/process/submitting-patches.rst
index 4fc6d16f5196..3296b8f7bedf 100644
--- a/Documentation/translations/zh_CN/process/submitting-patches.rst
+++ b/Documentation/translations/zh_CN/process/submitting-patches.rst
@@ -127,8 +127,8 @@
 URL来查找补丁描述并将其放入补丁中。也就是说，补丁（系列）及其描述应该是独立的。
 这对维护人员和审查人员都有好处。一些评审者可能甚至没有收到补丁的早期版本。
 
-描述你在命令语气中的变化，例如“make xyzzy do frotz”而不是“[这个补丁]make
-xyzzy do frotz”或“[我]changed xyzzy to do frotz”，就好像你在命令代码库改变
+描述你在命令语气中的变化，例如“make xyzzy do frotz”而不是“[This patch]make
+xyzzy do frotz”或“[I]changed xyzzy to do frotz”，就好像你在命令代码库改变
 它的行为一样。
 
 如果修补程序修复了一个记录的bug条目，请按编号和URL引用该bug条目。如果补丁来
-- 
2.27.0

