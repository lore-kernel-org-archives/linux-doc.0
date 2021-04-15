Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4473CC433B4
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 06:38:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 233A961153
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 06:38:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhDOGi2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 02:38:28 -0400
Received: from mail.loongson.cn ([114.242.206.163]:58482 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230188AbhDOGi2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 15 Apr 2021 02:38:28 -0400
Received: from localhost.localdomain (unknown [223.106.57.161])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9CxCco+33dgfjIIAA--.15262S3;
        Thu, 15 Apr 2021 14:37:52 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v5 1/4] docs/zh_CN: add openrisc openrisc_port.rst translation
Date:   Thu, 15 Apr 2021 14:38:35 +0800
Message-Id: <20210415063838.2341827-2-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210415063838.2341827-1-siyanteng@loongson.cn>
References: <20210415063838.2341827-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9CxCco+33dgfjIIAA--.15262S3
X-Coremail-Antispam: 1UD129KBjvJXoWxuw17CFy5AFWxZF1DGFW7Jwb_yoW7WryrpF
        ZxWryxGF1UJryqyw1UKr1UXr18Gw18Jr4UJas7Xw18Jr1qyr1UJr1DGw1rJr98GryUZFyU
        ZF1UKr17GFyUAwUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUmj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
        8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
        jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kfnx
        nUUI43ZEXa7VUUBbkUUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch tranlates Documentation/openrisc/openrisc_port.rst into Chinese

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
---
 .../zh_CN/openrisc/openrisc_port.rst          | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/openrisc/openrisc_port.rst

diff --git a/Documentation/translations/zh_CN/openrisc/openrisc_port.rst b/Documentation/translations/zh_CN/openrisc/openrisc_port.rst
new file mode 100644
index 000000000000..e87d0eec281d
--- /dev/null
+++ b/Documentation/translations/zh_CN/openrisc/openrisc_port.rst
@@ -0,0 +1,124 @@
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: :doc:`../../../openrisc/openrisc_port`
+:Translator: Yanteng Si <siyanteng@loongson.cn>
+
+.. _cn_openrisc_port:
+
+==============
+OpenRISC Linux
+==============
+
+这是Linux对OpenRISC类微处理器的移植；具体来说，最早移植目标是32位
+OpenRISC 1000系列（或1k）。
+
+关于OpenRISC处理器和正在进行中的开发的信息:
+
+	=======		=============================
+	网站		https://openrisc.io
+	邮箱		openrisc@lists.librecores.org
+	=======		=============================
+
+---------------------------------------------------------------------
+
+OpenRISC工具链和Linux的构建指南
+===============================
+
+为了构建和运行Linux for OpenRISC，你至少需要一个基本的工具链，或许
+还需要架构模拟器。 这里概述了准备就位这些部分的步骤。
+
+1) 工具链
+
+工具链二进制文件可以从openrisc.io或我们的github发布页面获得。不同
+工具链的构建指南可以在openrisc.io或Stafford的工具链构建和发布脚本
+中找到。
+
+	======      =================================================
+	二进制      https://github.com/openrisc/or1k-gcc/releases
+	工具链      https://openrisc.io/software
+	构建        https://github.com/stffrdhrn/or1k-toolchain-build
+	======      =================================================
+
+2) 构建
+
+像往常一样构建Linux内核::
+
+	make ARCH=openrisc CROSS_COMPILE="or1k-linux-" defconfig
+	make ARCH=openrisc CROSS_COMPILE="or1k-linux-"
+
+3) 在FPGA上运行（可选)
+
+OpenRISC社区通常使用FuseSoC来管理构建和编程SoC到FPGA中。 下面是用
+OpenRISC SoC对De0 Nano开发板进行编程的一个例子。 在构建过程中，
+FPGA RTL是从FuseSoC IP核库中下载的代码，并使用FPGA供应商工具构建。
+二进制文件用openocd加载到电路板上。
+
+::
+
+	git clone https://github.com/olofk/fusesoc
+	cd fusesoc
+	sudo pip install -e .
+
+	fusesoc init
+	fusesoc build de0_nano
+	fusesoc pgm de0_nano
+
+	openocd -f interface/altera-usb-blaster.cfg \
+		-f board/or1k_generic.cfg
+
+	telnet localhost 4444
+	> init
+	> halt; load_image vmlinux ; reset
+
+4) 在模拟器上运行（可选）
+
+QEMU是一个处理器仿真器，我们推荐它来模拟OpenRISC平台。 请按照QEMU网
+站上的OpenRISC说明，让Linux在QEMU上运行。 你可以自己构建QEMU，但你的
+Linux发行版可能提供了支持OpenRISC的二进制包。
+
+	=============	======================================================
+	qemu openrisc	https://wiki.qemu.org/Documentation/Platforms/OpenRISC
+	=============	======================================================
+
+---------------------------------------------------------------------
+
+术语表
+======
+
+代码中使用了以下符号约定以将范围限制在几个特定处理器实现上：
+
+========= =======================
+openrisc: OpenRISC类型处理器
+or1k:     OpenRISC 1000系列处理器
+or1200:   OpenRISC 1200处理器
+========= =======================
+
+---------------------------------------------------------------------
+
+历史
+====
+
+2003-11-18	Matjaz Breskvar (phoenix@bsemi.com)
+   将linux初步移植到OpenRISC或32架构。
+       所有的核心功能都实现了，并且可以使用。
+
+2003-12-08	Matjaz Breskvar (phoenix@bsemi.com)
+   彻底改变TLB失误处理。
+   重写异常处理。
+   在默认的initrd中实现了sash-3.6的所有功能。
+   大幅改进的版本。
+
+2004-04-10	Matjaz Breskvar (phoenix@bsemi.com)
+   大量的bug修复。
+   支持以太网，http和telnet服务器功能。
+   可以运行许多标准的linux应用程序。
+
+2004-06-26	Matjaz Breskvar (phoenix@bsemi.com)
+   移植到2.6.x。
+
+2004-11-30	Matjaz Breskvar (phoenix@bsemi.com)
+   大量的bug修复和增强功能。
+   增加了opencores framebuffer驱动。
+
+2010-10-09    Jonas Bonn (jonas@southpole.se)
+   重大重写，使其与上游的Linux 2.6.36看齐。
-- 
2.27.0

