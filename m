Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2BBEB64DC
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jun 2023 09:54:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343538AbjFOJy2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Jun 2023 05:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245066AbjFOJyJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Jun 2023 05:54:09 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5CCEE297D
        for <linux-doc@vger.kernel.org>; Thu, 15 Jun 2023 02:53:40 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.35])
        by gateway (Coremail) with SMTP id _____8AxGuqS34pk2YMFAA--.11910S3;
        Thu, 15 Jun 2023 17:53:22 +0800 (CST)
Received: from user-pc.202.106.0.20 (unknown [10.20.42.35])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8CxXMqM34pk79UbAA--.5033S5;
        Thu, 15 Jun 2023 17:53:21 +0800 (CST)
From:   Yinbo Zhu <zhuyinbo@loongson.cn>
To:     zybsyzlz@163.com
Cc:     Yinbo Zhu <zhuyinbo@loongson.cn>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Akira Yokosawa <akiyks@gmail.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Boqun Feng <boqun.feng@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org
Subject: [PATCH 04/10] docs: Add atomic operations to the driver basic API documentation
Date:   Thu, 15 Jun 2023 17:53:09 +0800
Message-Id: <20230615095315.25120-4-zhuyinbo@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230615095315.25120-1-zhuyinbo@loongson.cn>
References: <20230615095315.25120-1-zhuyinbo@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxXMqM34pk79UbAA--.5033S5
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
        ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
        nUUI43ZEXa7xR_UUUUUUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Paul E. McKenney" <paulmck@kernel.org>

Add the include/linux/atomic/atomic-arch-fallback.h file to the
driver-api/basics.rst in order to provide documentation for the Linux
kernel's atomic operations.

Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Kees Cook <keescook@chromium.org>
Cc: Akira Yokosawa <akiyks@gmail.com>
Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: <linux-doc@vger.kernel.org>
---
 Documentation/driver-api/basics.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/driver-api/basics.rst b/Documentation/driver-api/basics.rst
index 4b4d8e28d3be..0ae07f0d8601 100644
--- a/Documentation/driver-api/basics.rst
+++ b/Documentation/driver-api/basics.rst
@@ -87,6 +87,9 @@ Atomics
 .. kernel-doc:: arch/x86/include/asm/atomic.h
    :internal:
 
+.. kernel-doc:: include/linux/atomic/atomic-arch-fallback.h
+   :internal:
+
 Kernel objects manipulation
 ---------------------------
 
-- 
2.20.1

