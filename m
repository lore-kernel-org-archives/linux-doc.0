Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AA25C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 05:56:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42C4E2389B
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 05:56:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbhAUDcA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jan 2021 22:32:00 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49474 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392394AbhAUBYf (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:24:35 -0500
Received: from localhost.localdomain (unknown [112.3.198.184])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn7+V1whgk1cIAA--.13107S3;
        Thu, 21 Jan 2021 09:23:37 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 2/3] docs/zh_CN: add iio ep93xx_adc.rst translation
Date:   Thu, 21 Jan 2021 09:23:51 +0800
Message-Id: <20210121012352.449558-2-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210121012352.449558-1-siyanteng@loongson.cn>
References: <20210121012352.449558-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn7+V1whgk1cIAA--.13107S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4fWrWDCr15AryxJFyfCrg_yoW8KryUpF
        93GryfJa1UJry3Xr17Gr1UJr1UGrs5Ga1UtF4xtFy8Xrs5Aw4Utr1kJry8JryUKry8AF4U
        XFy5JrW5Kr1jyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l4I
        8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
        xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
        AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
        cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
        4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5SoXUUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/iio/ep93xx_adc.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
---
 .../translations/zh_CN/iio/ep93xx_adc.rst     | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/iio/ep93xx_adc.rst

diff --git a/Documentation/translations/zh_CN/iio/ep93xx_adc.rst b/Documentation/translations/zh_CN/iio/ep93xx_adc.rst
new file mode 100644
index 000000000000..727a48d09090
--- /dev/null
+++ b/Documentation/translations/zh_CN/iio/ep93xx_adc.rst
@@ -0,0 +1,46 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../iio/ep93xx_adc`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_iio_ep93xx_adc:
+
+
+==================================
+思睿逻辑 EP93xx 模拟数字转换器驱动
+==================================
+
+1. 概述
+=======
+
+该驱动同时适用于具有5通道模拟数字转换器的低端 (EP9301, Ep9302) 设备和10通道
+触摸屏/模拟数字转换器的高端设备(EP9307, EP9312, EP9315)。
+
+2. 通道编号
+===========
+
+EP9301和EP9302数据表定义了通道0..4的编号方案。虽然EP9307, EP9312和EP9315多
+了3个通道（一共8个），但是编号并没有定义。所以说最后三个通道是随机编号的。
+
+如果ep93xx_adc是IIO设备0，您将在以下位置找到条目
+/sys/bus/iio/devices/iio:device0/:
+
+  +-----------------+---------------+
+  | sysfs 入口      | ball/pin 名称 |
+  +=================+===============+
+  | in_voltage0_raw | YM            |
+  +-----------------+---------------+
+  | in_voltage1_raw | SXP           |
+  +-----------------+---------------+
+  | in_voltage2_raw | SXM           |
+  +-----------------+---------------+
+  | in_voltage3_raw | SYP           |
+  +-----------------+---------------+
+  | in_voltage4_raw | SYM           |
+  +-----------------+---------------+
+  | in_voltage5_raw | XP            |
+  +-----------------+---------------+
+  | in_voltage6_raw | XM            |
+  +-----------------+---------------+
+  | in_voltage7_raw | YP            |
+  +-----------------+---------------+
-- 
2.27.0

