Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F77C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  8 Sep 2021 13:20:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03A6761164
	for <linux-doc@archiver.kernel.org>; Wed,  8 Sep 2021 13:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347852AbhIHNVv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Sep 2021 09:21:51 -0400
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]:54618 "EHLO
        atcsqa06.andestech.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S238360AbhIHNVu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Sep 2021 09:21:50 -0400
X-Greylist: delayed 375 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Sep 2021 09:21:50 EDT
Received: by atcsqa06.andestech.com (Postfix, from userid 5427)
        id B78FAC014F; Wed,  8 Sep 2021 21:14:26 +0800 (CST)
From:   Leo Yu-Chi Liang <ycliang@andestech.com>
To:     corbet@lwn.net, src.res@email.cn,
        linux-doc-tw-discuss@lists.sourceforge.net
Cc:     linux-doc@vger.kernel.org, Leo Yu-Chi Liang <ycliang@andestech.com>
Subject: [PATCH 1/1] docs/zh_TW: Add translation for riscv/patch-acceptance
Date:   Wed,  8 Sep 2021 21:14:25 +0800
Message-Id: <20210908131425.31710-1-ycliang@andestech.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add new translation for Documentation/riscv/patch-acceptance.rst

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 .../zh_TW/riscv/patch-acceptance.rst          | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/translations/zh_TW/riscv/patch-acceptance.rst

diff --git a/Documentation/translations/zh_TW/riscv/patch-acceptance.rst b/Documentation/translations/zh_TW/riscv/patch-acceptance.rst
new file mode 100644
index 000000000000..f3bb8392454c
--- /dev/null
+++ b/Documentation/translations/zh_TW/riscv/patch-acceptance.rst
@@ -0,0 +1,33 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_TW.rst
+
+:Original: Documentation/riscv/patch-acceptance.rst
+
+:譯者:
+
+ 梁育齊 Liang YuChi <ycliang@andestech.com>
+
+arch/riscv 開發人員的維護守則
+=============================
+
+概述
+----
+RISC-V 指令集架構是公開開發的：
+正在開發中的草案可供所有人檢閱和實驗自己的實作。
+新模組或擴充指令集的草案可能會在開發過程中發生變化——
+有時會變化的與先前的草案不相容。
+這樣的彈性可能會對 RISC-V Linux 的維護帶來挑戰。
+Linux 維護者反對混亂，且 Linux 開發過程更傾向接受，經過仔細審查和測試的程式碼而非實驗性質的程式碼。
+我們希望將相同的原則，運用在檢視這些可能被接受且放進核心的 RISC-V 相關程式碼中。
+
+附註提交檢查事項
+------------------
+我們將只會接受，和那些被 RISC-V 基金會列為"凍結"或是"批准生效"的模組和擴充指令集相關的 patches。
+（當然，開發人員可以自行維護含有他們想要有的擴充指令集的 Linux 核心程式碼。）
+
+此外，RISC-V 規格允許實作者創造自己的擴充指令集。
+這些自己定義的擴充指令集不需要經過 RISC-V 基金會的任何審查或批准過程。
+為了避免這些擴充指令集造成維護的複雜性，以及對效能產生影響，
+我們將只接受已被 RISC-V 基金會正式"凍結"或"批准"的擴充指令集實作。
+（當然，實作者可以自行維護含有自己擴充指令集實作的 Linux 核心程式碼。）
--
2.25.1

