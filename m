Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE13C433E6
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 05:56:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF2B12389B
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 05:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726158AbhAUDdW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Jan 2021 22:33:22 -0500
Received: from mail.loongson.cn ([114.242.206.163]:49440 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392390AbhAUBYi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 20 Jan 2021 20:24:38 -0500
Received: from localhost.localdomain (unknown [112.3.198.184])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn7+V1whgk1cIAA--.13107S2;
        Thu, 21 Jan 2021 09:23:34 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 1/3] docs/zh_CN: add iio iio_configfs.rst translation
Date:   Thu, 21 Jan 2021 09:23:50 +0800
Message-Id: <20210121012352.449558-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn7+V1whgk1cIAA--.13107S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4DAr17tFWDuFyUGw4kZwb_yoWrWF15pF
        sI9r97tFWUJFyrAF48KFy8WryfJrnayF4UJrWxXw1rt3s8Aryqkr4DtFWrJ397W392vF47
        J34rCFyYvrsrCaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
        WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
        r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
        xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/iio/iio_configfs.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 .../translations/zh_CN/iio/iio_configfs.rst   | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/iio/iio_configfs.rst

diff --git a/Documentation/translations/zh_CN/iio/iio_configfs.rst b/Documentation/translations/zh_CN/iio/iio_configfs.rst
new file mode 100644
index 000000000000..223bc732ce66
--- /dev/null
+++ b/Documentation/translations/zh_CN/iio/iio_configfs.rst
@@ -0,0 +1,102 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../iio/iio_configfs`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_iio_configfs:
+
+
+=====================
+工业 IIO configfs支持
+=====================
+
+1. 概述
+=======
+
+Configfs是一种内核对象的基于文件系统的管理系统，IIO使用一些可以通过
+configfs轻松配置的对象（例如：设备，触发器）。
+
+关于configfs是如何运行的，请查阅Documentation/filesystems/configfs.rst
+了解更多信息。
+
+2. 用法
+=======
+为了使configfs支持IIO，我们需要在编译时选中config的CONFIG_IIO_CONFIGFS
+选项。
+
+然后，挂载configfs文件系统(通常在 /config directory目录下）：：
+
+  $ mkdir/config
+  $ mount -t configfs none/config
+
+此时，将创建所有默认IIO组，并可以在/ config / iio下对其进行访问。 下一章
+将介绍可用的IIO配置对象。
+
+3. 软件触发器
+=============
+
+IIO默认configfs组之一是“触发器”组。 挂载configfs后可以自动访问它，并且可
+以在/config/iio/triggers下找到。
+
+IIO软件触发器为创建多种触发器类型提供了支持。 通常在include/linux/iio
+/sw_trigger.h：中的接口下将新的触发器类型实现为单独的内核模块：
+
+  /*
+   * drivers/iio/trigger/iio-trig-sample.c
+   * 一种新触发器类型的内核模块实例
+   */
+  #include <linux/iio/sw_trigger.h>
+
+
+  static struct iio_sw_trigger *iio_trig_sample_probe(const char *name)
+  {
+	/*
+	 * 这将分配并注册一个IIO触发器以及其他触发器类型特性的初始化。
+	 */
+  }
+
+  static int iio_trig_sample_remove(struct iio_sw_trigger *swt)
+  {
+	/*
+	 * 这会废弃iio_trig_sample_probe中的操作
+	 */
+  }
+
+  static const struct iio_sw_trigger_ops iio_trig_sample_ops = {
+	.probe		= iio_trig_sample_probe,
+	.remove		= iio_trig_sample_remove,
+  };
+
+  static struct iio_sw_trigger_type iio_trig_sample = {
+	.name = "trig-sample",
+	.owner = THIS_MODULE,
+	.ops = &iio_trig_sample_ops,
+  };
+
+module_iio_sw_trigger_driver(iio_trig_sample);
+
+每种触发器类型在/config/iio/triggers下都有其自己的目录。 加载iio-trig-sample
+模块将创建“ trig-sample”触发器类型目录/config/iio/triggers/trig-sample.
+
+我们支持以下中断源（触发器类型）
+
+	* hrtimer,使用高分辨率定时器作为中断源
+
+3.1 Hrtimer触发器创建与销毁
+---------------------------
+
+加载iio-trig-hrtimer模块将注册hrtimer触发器类型，从而允许用户在
+/config/iio/triggers/hrtimer下创建hrtimer触发器。
+
+例如::
+
+  $ mkdir /config/iio/triggers/hrtimer/instance1
+  $ rmdir /config/iio/triggers/hrtimer/instance1
+
+每个触发器可以具有一个或多个独特的触发器类型的属性。
+
+3.2 "hrtimer" 触发器类型属性
+----------------------------
+
+"hrtimer”触发器类型没有来自/config dir的任何可配置属性。
+但它确实将采样频率属性引入了触发目录。
-- 
2.27.0

