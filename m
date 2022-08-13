Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A220EC19F2D
	for <linux-doc@archiver.kernel.org>; Sat, 13 Aug 2022 14:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237374AbiHMOP1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 13 Aug 2022 10:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237284AbiHMOP0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 13 Aug 2022 10:15:26 -0400
Received: from out0.migadu.com (out0.migadu.com [IPv6:2001:41d0:2:267::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AB7E11822
        for <linux-doc@vger.kernel.org>; Sat, 13 Aug 2022 07:15:23 -0700 (PDT)
Date:   Sat, 13 Aug 2022 22:14:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1660400121;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=azvNvHhOx7dK4E7CK+UDRbKs2/4UoCpOn8DOupC90N8=;
        b=tNdwMeQwrJBK2/aEIkrtvGKslWFTLVIcHNvW1GQmNgPAyqiOywWKjTfdQ28lA2ow32P7jH
        YAIRf3pBBLdjjamtPqSjyjeBzeohpEt4XalUkbflo3niV/4Qv8ZAAEQKRH+75LKxmPvzey
        PUZkvMii8rZ1QCoe+Bu0NLYQ8WOaUEQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-doc@vger.kernel.org
Subject: [PATCH] docs: kernel-doc.rst: move label "_kernel_doc" to top
Message-ID: <Yvex3fQSXFX3alIu@bobwxc.mipc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Wu XiangCheng <bobwxc@email.cn>

"_kernel_doc" label which should refer to the entire document was in the
middle, move it to top. Also fix zh translation.

Fixes: 46347502b099 ("Restructure kernel-doc.rst")
Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
---
 Documentation/doc-guide/kernel-doc.rst                    | 3 ++-
 Documentation/translations/zh_CN/doc-guide/kernel-doc.rst | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
index 9c779bd7a751..e494f907231e 100644
--- a/Documentation/doc-guide/kernel-doc.rst
+++ b/Documentation/doc-guide/kernel-doc.rst
@@ -1,5 +1,7 @@
 .. title:: Kernel-doc comments
 
+.. _kernel_doc:
+
 ===========================
 Writing kernel-doc comments
 ===========================
@@ -525,7 +527,6 @@ The kernel-doc extension is included in the kernel source tree, at
 ``scripts/kernel-doc`` script to extract the documentation comments from the
 source.
 
-.. _kernel_doc:
 
 How to use kernel-doc to generate man pages
 -------------------------------------------
diff --git a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
index ccfb9b8329c2..48aad9868d4c 100644
--- a/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
+++ b/Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
@@ -4,6 +4,8 @@
 
 :译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
 
+.. _kernel_doc_zh:
+
 编写kernel-doc注释
 ==================
 
@@ -475,7 +477,6 @@ doc: *title*
 kernel-doc扩展包含在内核源代码树中，位于 ``Documentation/sphinx/kerneldoc.py`` 。
 在内部，它使用 ``scripts/kernel-doc`` 脚本从源代码中提取文档注释。
 
-.. _kernel_doc_zh:
 
 如何使用kernel-doc生成手册（man）页
 -----------------------------------
-- 
2.30.2

