Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCEBC433E0
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 07:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA15D2312D
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 07:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731129AbhASHrS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jan 2021 02:47:18 -0500
Received: from mail.loongson.cn ([114.242.206.163]:39526 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728663AbhASHqv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 19 Jan 2021 02:46:51 -0500
Received: from localhost.localdomain (unknown [112.3.198.184])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxFb02jgZgLE8HAA--.9009S3;
        Tue, 19 Jan 2021 15:46:01 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 2/3] doc/zh_CN: add mips  ep93xx_adc.rst translation
Date:   Tue, 19 Jan 2021 15:46:16 +0800
Message-Id: <20210119074617.3109276-2-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210119074617.3109276-1-siyanteng@loongson.cn>
References: <20210119074617.3109276-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxFb02jgZgLE8HAA--.9009S3
X-Coremail-Antispam: 1UD129KBjvJXoW7ur4xKrWfGF48Jw1kuw1kAFb_yoW8tFWkpF
        93GryfJa1UJry3Xr17Gr4UJr1UGrs5Ga1UtF1xtFy8Xrs8Aw4Utr18Jry8JryUKry8AFWU
        XFy5JrW5Kr1jyw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
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
+.. _cn_ep93xx_adc:
+
+
+======================================
+Cirrus Logic EP93xx 模拟数字转换器驱动
+======================================
+
+1. 概述
+=======
+
+该驱动同时适用于具有5通道模拟数字转换器的低端 (EP9301, Ep9302) 设备和10通道
+触摸屏/模拟数字转换器的高端 (EP9307, EP9312, EP9315)设备。
+
+2. 通道编号
+===========
+
+EP9301和EP9302数据表定义了通道0..4的编号方案。虽然EP9307, EP9312和EP9315多
+了3个通道（一共8个），但是编号并没有定义。所以说最后三个通道是随机编号的。
+
+假设ep93xx_adc是IIO设备0，您将在以下位置找到以下条目
+/sys/bus/iio/devices/iio:device0/:
+
+  +-----------------+---------------+
+  | sysfs entry     | ball/pin name |
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

