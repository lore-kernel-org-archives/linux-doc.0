Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1A3C433E9
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 05:56:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 139ED238EC
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jan 2021 05:56:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726229AbhAUFzt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jan 2021 00:55:49 -0500
Received: from mail.loongson.cn ([114.242.206.163]:53576 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726222AbhAUDdc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 20 Jan 2021 22:33:32 -0500
Received: from localhost.localdomain (unknown [112.3.198.184])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxZb3b9QhgpWUIAA--.10503S2;
        Thu, 21 Jan 2021 11:32:45 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v4 1/3] docs/zh_CN: add iio iio_configfs.rst translation
Date:   Thu, 21 Jan 2021 11:33:00 +0800
Message-Id: <20210121033302.558935-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxZb3b9QhgpWUIAA--.10503S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4DAr17tFWDuFyUGw4kZwb_yoWrWw45pF
        sI9r97tFW8JFyrAF48KFy8WryfJrnayF4UJFWxXw1rt3s8Aryqkr4DtFWrJ397W392vF47
        J34rCryYvrZrCaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
        W0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0E
        wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
        80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0
        I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04
        k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY
        1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch translates Documentation/iio/iio_configfs.rst into Chinese.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>
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
+::
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

