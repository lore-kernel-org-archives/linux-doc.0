Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D8AC43460
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 13:36:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CD47613B2
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 13:36:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhDMNgw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 09:36:52 -0400
Received: from [43.250.32.171] ([43.250.32.171]:33390 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S244225AbhDMNgt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Apr 2021 09:36:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=AIWCVfWUgpd321b0tE14iHZr1lFTbF1YzDaDo
        nlJANA=; b=YmjHhMgjvMB1IrXO8mnhM0vfz6F/W7R3Z999j1toyU7MyKuI8d4HX
        tAoO+mQFjv5qplqx5TWC/TPFMvDdwiJ1vwX1vZR1105p3ABHffjBGDiFSWApzq5R
        6lPRlz/dL+4crp1VYI3/4liaz94ztaguP7kqbfVAGmK1p6zAJm1AUQ=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgC3KtFPnnVgHfBaAA--.10197S2;
        Tue, 13 Apr 2021 21:36:17 +0800 (CST)
Date:   Tue, 13 Apr 2021 21:36:15 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v3 08/11] docs/zh_CN: add openrisc openrisc_port.rst
 translation
Message-ID: <20210413133615.GC15813@bobwxc.top>
References: <20210413131237.2253955-1-siyanteng@loongson.cn>
 <20210413131237.2253955-9-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413131237.2253955-9-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgC3KtFPnnVgHfBaAA--.10197S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar47tw4rCr1DGw1DCryDZFb_yoW7Cr45pF
        ZxGryfJr1UJryjy3W7Kr18Xr18Aw18GF4UJas7Xr18Jr1qyrW7Jr1DGw1rJrZ8GryjyryU
        JF1UGr17KFy7ArJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUylb7Iv0xC_KF4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_Xr4l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1U
        JwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
        vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
        x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
        xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
        wI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU089NUUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 13, 2021 at 09:12:34PM +0800, Yanteng Si wrote:
> This patch tranlates Documentation/openrisc/openrisc_port.rst into Chinese
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../zh_CN/openrisc/openrisc_port.rst          | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/openrisc/openrisc_port.rst
> 
> diff --git a/Documentation/translations/zh_CN/openrisc/openrisc_port.rst b/Documentation/translations/zh_CN/openrisc/openrisc_port.rst
> new file mode 100644
> index 000000000000..77754f2639cf
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/openrisc/openrisc_port.rst
> @@ -0,0 +1,124 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../openrisc/openrisc_port`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_openrisc_port:
> +
> +==============
> +OpenRISC Linux
> +==============
> +
> +这是Linux对OpenRISC类微处理器的移植；具体来说，最早移植目标是32位
> +OpenRISC 1000系列（或1k）。
> +
> +关于OpenRISC处理器和正在进行中的开发的信息:
> +
> +	=======		=============================
> +	网站		https://openrisc.io
> +	邮箱		openrisc@lists.librecores.org
> +	=======		=============================
> +
> +---------------------------------------------------------------------
> +
> +OpenRISC工具链和Linux的构建指南
> +===============================
> +
> +为了构建和运行Linux for OpenRISC，你至少需要一个基本的工具链，或许
> +还需要架构模拟器。 这里概述了准备就位这些部分的步骤。
> +
> +1) 工具链
> +
> +工具链二进制文件可以从openrisc.io或我们的github发布页面获得。不同
> +工具链的构建指南可以在openrisc.io或Stafford的工具链构建和发布脚本
> +中找到。
> +
> +	======      =================================================
> +	二进制      https://github.com/openrisc/or1k-gcc/releases
> +	工具链      https://openrisc.io/software
> +	构建        https://github.com/stffrdhrn/or1k-toolchain-build
> +	======      =================================================
> +
> +2) 构建
> +
> +像往常一样构建Linux内核::
> +
> +	make ARCH=openrisc CROSS_COMPILE="or1k-linux-" defconfig
> +	make ARCH=openrisc CROSS_COMPILE="or1k-linux-"
> +
> +3) 在FPGA上运行（可选)
> +
> +OpenRISC社区通常使用FuseSoC来管理构建和编程SoC到FPGA中。 下面是用
> +OpenRISC SoC对De0 Nano开发板进行编程的一个例子。 在构建过程中，
> +FPGA RTL是从FuseSoC IP核库中下载的代码，并使用FPGA供应商工具构建。
> +二进制文件用openocd加载到电路板上。
> +
> +::
> +
> +	git clone https://github.com/olofk/fusesoc
> +	cd fusesoc
> +	sudo pip install -e .
> +
> +	fusesoc init
> +	fusesoc build de0_nano
> +	fusesoc pgm de0_nano
> +
> +	openocd -f interface/altera-usb-blaster.cfg \
> +		-f board/or1k_generic.cfg
> +
> +	telnet localhost 4444
> +	> init
> +	> halt; load_image vmlinux ; reset
> +
> +4) 在模拟器上运行（可选）
> +
> +QEMU是一个处理器仿真器，我们推荐它来模拟OpenRISC平台。 请按照QEMU网
> +站上的OpenRISC说明，让Linux在QEMU上运行。 你可以自己构建QEMU，但你的
> +Linux发行版可能提供了支持OpenRISC的二进制包。
> +
> +	=============	======================================================
> +	qemu openrisc	https://wiki.qemu.org/Documentation/Platforms/OpenRISC
> +	=============	======================================================
> +
> +---------------------------------------------------------------------
> +
> +术语表
> +======
> +
> +代码中使用了以下符号约定以将范围限制在几个特定处理器实现上：
> +
> +========= =======================
> +openrisc: OpenRISC类型处理器
> +or1k:     OpenRISC 1000系列处理器
> +or1200:   OpenRISC 1200处理器
> +========= =======================
> +
> +---------------------------------------------------------------------
> +
> +历史
> +====
> +
> +2003-11-18	Matjaz Breskvar (phoenix@bsemi.com)
> +   将linux初步移植到OpenRISC或32架构。
> +       所有的核心功能都实现了，并且可以使用。
> +
> +2003-12-08	Matjaz Breskvar (phoenix@bsemi.com)
> +   彻底改变TLB失误处理。
> +   重写异常处理。
> +   在默认的initrd中实现了sash-3.6的所有功能。
> +   大幅改进的版本。
> +
> +2004-04-10	Matjaz Breskvar (phoenix@bsemi.com)
> +   大量的bug修复。
> +   支持以太网，http和telnet服务器功能。
> +   可以运行许多标准的linux应用程序。
> +
> +2004-06-26	Matjaz Breskvar (phoenix@bsemi.com)
> +   移植到2.6.x。
> +
> +2004-11-30	Matjaz Breskvar (phoenix@bsemi.com)
> +   大量的bug修复和增强功能。
> +   增加了opencores framebuffer驱动。
> +
> +2010-10-09    Jonas Bonn (jonas@southpole.se)
> +   重大重写，使其与上游的Linux 2.6.36看齐。
> -- 
> 2.27.0

