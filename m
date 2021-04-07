Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCA1C433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:01:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF17861260
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 07:01:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346052AbhDGHCA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 03:02:00 -0400
Received: from [43.250.32.171] ([43.250.32.171]:22971 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S233740AbhDGHB7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 03:01:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=3D/yMnL/H7/Y2iJ3dzx8hFYgJKQrQ86XeBwyz
        gF5jaw=; b=dQmtH8/l6eiavOv6q6wPRPw6TAIhZT6GZBttbrogiHXPlndrK5G2x
        VqYwsh6iN4yNjxdKUk/kfIUUFM9GhYd5Qh1uXlac89ddr4v4iNhixP8BJ0kaglv9
        7ALtNxikirHY0POljbd2uYQKHILgvl6T89ObxgWIcEQu1YYMSDF+jU=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAXi9HMWG1gvVFQAA--.49723S2;
        Wed, 07 Apr 2021 15:01:34 +0800 (CST)
Date:   Wed, 7 Apr 2021 15:01:32 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH 08/11] docs/zh_CN: add openrisc openrisc_port.rst
 translation
Message-ID: <20210407070132.GB23907@bobwxc.top>
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-9-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210406130210.2725075-9-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgAXi9HMWG1gvVFQAA--.49723S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ar47tw4rCr1DGw1DCryDZFb_yoW7uw4rpF
        ZxGryfJr1UAryUt3W7Kr1UXr1UAw18Jr4UGas7Xr18Jr1DAry7Jr1DG3W8JrZ8GryjyryU
        Xr1UKr17GF1UJrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUylb7Iv0xC_Kw4lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0x
        kIwI1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1U
        Jr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
        14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUTq2MUUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 06, 2021 at 09:02:07PM +0800, Yanteng Si wrote:
> This patch tranlates Documentation/openrisc/openrisc_port.rst into Chinese
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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
> +===================================================
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
> +	==========	=================================================
> +	二进制          https://github.com/openrisc/or1k-gcc/releases
> +	工具链          https://openrisc.io/software
> +	构建            https://github.com/stffrdhrn/or1k-toolchain-build
> +	==========	=================================================
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
> +===========
> +i

remove the 'i'

> +在代码中，为了将范围限制在或多或少的特定处理器实现上，在符号上使用了以下约定。

Maybe this better:

代码中使用了以下符号约定以将范围限制在几个特定处理器实现上，：

> +
> +========= =======================================
> +openrisc: OpenRISC类型处理器
> +or1k:     OpenRISC 1000系列处理器
> +or1200:   OpenRISC 1200处理器
> +========= =======================================
> +
> +---------------------------------------------------------------------
> +
> +历史
> +========

In following part， please check the using of Tab and Space.

> +
> +18-11-2003	Matjaz Breskvar (phoenix@bsemi.com)

maybe YYYY-MM-DD is better for zh translation.

> +    将linux初步移植到OpenRISC或32架构。
> +        所有的核心功能都实现了，并且可以使用。
> +
> +08-12-2003	Matjaz Breskvar (phoenix@bsemi.com)
> +    彻底改变TLB失误处理。
> +    重写异常处理。
> +    在默认的initrd中实现了sash-3.6的所有功能。
> +    大幅改进的版本。
> +
> +10-04-2004	Matjaz Breskvar (phoenix@bsemi.com)
> +    大量的bug修复。
> +    支持以太网，http和telnet服务器功能。
> +    可以运行许多标准的linux应用程序。
> +
> +26-06-2004	Matjaz Breskvar (phoenix@bsemi.com)
> +	移植到2.6.x。
> +
> +30-11-2004	Matjaz Breskvar (phoenix@bsemi.com)
> +    大量的bug修复和增强功能。
> +    增加了opencores framebuffer驱动。
> +
> +09-10-2010    Jonas Bonn (jonas@southpole.se)
> +	重大重写，使其与上游的Linux 2.6.36看齐。
> -- 
> 2.27.0

Thanks!

Wu X.C.

