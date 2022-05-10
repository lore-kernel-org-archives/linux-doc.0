Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53C8C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 10 May 2022 02:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234454AbiEJCGJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 May 2022 22:06:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231464AbiEJCGI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 May 2022 22:06:08 -0400
Received: from smtpbg.qq.com (smtpbg138.qq.com [106.55.201.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ABCC5132D
        for <linux-doc@vger.kernel.org>; Mon,  9 May 2022 19:02:05 -0700 (PDT)
X-QQ-mid: bizesmtp63t1652148104tqs3krxi
Received: from localhost.localdomain ( [182.148.14.205])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Tue, 10 May 2022 10:01:42 +0800 (CST)
X-QQ-SSF: 00000000002000B0F000B00A0000000
X-QQ-FEAT: veLmM2oPw1kV3kfPjMR33ME1OPLfrgioNi6Pfs93s8T3P3lG6hsUXFclkaYMm
        /uqxxhgGbSVYJhGmG7WMUYZohqPT9q9nB5nnJIF3U+pWbhZbwfIJp24714U2Y0fIA/IM2+o
        HrrExL9wuskKdaVc+I9eSakfxdSQ52HKBTmAVu9h92ApzwHszX6h/0xz45IJzw0+UBXtHQv
        Rri2sAVUKokyPUA1NYjqcZg4AtfSbS2e8qE6/THIvJsjj/fyDwRqCIXStmOXNe8nJqMxhpj
        DIUXD/2shI9/5LhWykAxNqa9VxyhLyid6/laZsrRKJZ6HkU9bAOHJMFBTlhF4gYDHOrQ==
X-QQ-GoodBg: 0
From:   Huilong Deng <denghuilong@cdjrlc.com>
To:     alexs@kernel.org, corbet@lwn.net
Cc:     siyanteng01@gmail.com, linux-doc@vger.kernel.org,
        Huilong Deng <denghuilong@cdjrlc.com>
Subject: [PATCH v3] docs/zh_CN: fix devicetree usage-model translation
Date:   Tue, 10 May 2022 10:01:35 +0800
Message-Id: <20220510020135.55452-1-denghuilong@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam10
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

machine_desc is a item in devicetree, shouldn't be half translated. Let's
keep a whole word untranslated.

Signed-off-by: Huilong Deng <denghuilong@cdjrlc.com>
---
 .../translations/zh_CN/devicetree/usage-model.rst         | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/devicetree/usage-model.rst b/Documentation/translations/zh_CN/devicetree/usage-model.rst
index 318a3c6a0114..accdc33475a0 100644
--- a/Documentation/translations/zh_CN/devicetree/usage-model.rst
+++ b/Documentation/translations/zh_CN/devicetree/usage-model.rst
@@ -120,24 +120,24 @@ dt_compat列表（如果你好奇，该列表定义在arch/arm/include/asm/mach/
 表示什么。在Documentation/devicetree/bindings中添加兼容字符串的文档。
 
 同样在ARM上，对于每个machine_desc，内核会查看是否有任何dt_compat列表条
-目出现在兼容属性中。如果有，那么该机器_desc就是驱动该机器的候选者。在搜索
+目出现在兼容属性中。如果有，那么该machine_desc就是驱动该机器的候选者。在搜索
 了整个machine_descs表之后，setup_machine_fdt()根据每个machine_desc
 在兼容属性中匹配的条目，返回 “最兼容” 的machine_desc。如果没有找到匹配
 的machine_desc，那么它将返回NULL。
 
 这个方案背后的原因是观察到，在大多数情况下，如果它们都使用相同的SoC或相同
-系列的SoC，一个机器_desc可以支持大量的电路板。然而，不可避免地会有一些例
+系列的SoC，一个machine_desc可以支持大量的电路板。然而，不可避免地会有一些例
 外情况，即特定的板子需要特殊的设置代码，这在一般情况下是没有用的。特殊情况
 可以通过在通用设置代码中明确检查有问题的板子来处理，但如果超过几个情况下，
 这样做很快就会变得很难看和/或无法维护。
 
-相反，兼容列表允许通用机器_desc通过在dt_compat列表中指定“不太兼容”的值
+相反，兼容列表允许通用machine_desc通过在dt_compat列表中指定“不太兼容”的值
 来提供对广泛的通用板的支持。在上面的例子中，通用板支持可以声称与“ti,ompa3”
 或“ti,ompa3450”兼容。如果在最初的beagleboard上发现了一个bug，需要在
 早期启动时使用特殊的变通代码，那么可以添加一个新的machine_desc，实现变通，
 并且只在“ti,omap3-beagleboard”上匹配。
 
-PowerPC使用了一个稍微不同的方案，它从每个机器_desc中调用.probe()钩子，
+PowerPC使用了一个稍微不同的方案，它从每个machine_desc中调用.probe()钩子，
 并使用第一个返回TRUE的钩子。然而，这种方法没有考虑到兼容列表的优先级，对于
 新的架构支持可能应该避免。
 
-- 
2.36.1

