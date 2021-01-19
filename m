Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9EC5C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 07:57:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9CD6B2311C
	for <linux-doc@archiver.kernel.org>; Tue, 19 Jan 2021 07:57:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727430AbhASH4K (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 19 Jan 2021 02:56:10 -0500
Received: from mail.loongson.cn ([114.242.206.163]:39538 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730869AbhASHqq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 19 Jan 2021 02:46:46 -0500
Received: from localhost.localdomain (unknown [112.3.198.184])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxFb02jgZgLE8HAA--.9009S4;
        Tue, 19 Jan 2021 15:46:02 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH 3/3] doc/zh_CN: add mips iio_configfs.rst translation
Date:   Tue, 19 Jan 2021 15:46:17 +0800
Message-Id: <20210119074617.3109276-3-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210119074617.3109276-1-siyanteng@loongson.cn>
References: <20210119074617.3109276-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxFb02jgZgLE8HAA--.9009S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZF4DAr17tFWDuFyUGw4kZwb_yoWrWF4rpF
        sa9r97tFWUJFyrAF48KFy8WryfJwnayF4UJrWxXw1rt3s8Aryqkr4DtF4rJ397W34qvF47
        J34rCryYvrsrCaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9l14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vIr41l4I
        8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
        xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
        AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
        cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
        4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8BMNUUUUU
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
+	* hrtimer, uses high resolution timers as interrupt source
+
+3.1 Hrtimer Hrtimer触发器创建与销毁
+-----------------------------------
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
+它确实将采样频率属性引入触发目录。
-- 
2.27.0

