Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F307C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 03:42:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9A5B64E77
	for <linux-doc@archiver.kernel.org>; Wed, 24 Feb 2021 03:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233168AbhBXDmf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 23 Feb 2021 22:42:35 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:54662 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232936AbhBXDmf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Feb 2021 22:42:35 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e01424;MF=alex.shi@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UPQGk5i_1614138108;
Received: from IT-FVFX43SYHV2H.local(mailfrom:alex.shi@linux.alibaba.com fp:SMTPD_---0UPQGk5i_1614138108)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 24 Feb 2021 11:41:51 +0800
Subject: Re: [PATCH v2 1/5] docs/zh_CN:add riscv boot-image-header.rst
 translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Harry Wei <harryxiyou@gmail.com>,
        Yanteng Si <siyanteng01@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, Huacai Chen <chenhuacai@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210224031149.15179-1-siyanteng@loongson.cn>
 <20210224031149.15179-2-siyanteng@loongson.cn>
From:   Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <c242fdec-71a1-feca-1840-457cd7e4fe89@linux.alibaba.com>
Date:   Wed, 24 Feb 2021 11:41:47 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.0; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210224031149.15179-2-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

在 2021/2/24 上午11:11, Yanteng Si 写道:
> This patch translates Documentation/riscv/boot-image-header.rst intoChinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/riscv/boot-image-header.rst         | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/riscv/boot-image-header.rst
> 
> diff --git a/Documentation/translations/zh_CN/riscv/boot-image-header.rst b/Documentation/translations/zh_CN/riscv/boot-image-header.rst
> new file mode 100644
> index 000000000000..3e9a9abb5d6f
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/riscv/boot-image-header.rst
> @@ -0,0 +1,67 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../riscv/boot-image-header`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_boot-image-header.rst:
> +
> +
> +==========================
> +RISC-V Linux启动镜像文件头
> +==========================
> +
> +:Author: Atish Patra <atish.patra@wdc.com>
> +:Date:   20 May 2019
> +
> +此文档仅描述RISC-V Linux 启动文件头的详情。
> +
> +TODO:
> +  写一个完整的启动指南。
> +
> +在解压后的Linux内核镜像中存在以下64字节的文件头::
> +
> +	u32 code0;		  /* Executable code */
> +	u32 code1;		  /* Executable code */
> +	u64 text_offset;	  /* Image load offset, little endian */
> +	u64 image_size;		  /* Effective Image size, little endian */
> +	u64 flags;		  /* kernel flags, little endian */
> +	u32 version;		  /* Version of this header */
> +	u32 res1 = 0;		  /* Reserved */
> +	u64 res2 = 0;		  /* Reserved */
> +	u64 magic = 0x5643534952; /* Magic number, little endian, "RISCV" */
> +	u32 magic2 = 0x05435352;  /* Magic number 2, little endian, "RSC\x05" */
> +	u32 res3;		  /* Reserved for PE COFF offset */
> +
> +这种头格式与PE/COFF文件头兼容，并在很大程度上受到ARM64文件头的启发。因此，ARM64
> +和RISC-V文件头可以在未来合并为一个共同的头。
> +
> +注意
> +====
> +
> +- 将来也可以复用这个文件头，用来对RISC-V的EFI桩提供支持。为了使内核镜像如同一个
> +  EFI应用程序一样加载，EFI规范中规定在内核镜像的开始需要PE/COFF镜像文件头。为了
> +  支持EFI桩，应该用“MZ”魔术字符替换掉code0，并且res3（偏移量未0x3c）应指向PE/COFF
> +  文件头的其余部分.
> +
> +- 表示文件头的版本号的bit位域
> +
> +	==========  ==========
> +	Bits 0:15   次要  版本
> +	Bits 16:31  主要  版本
> +	==========  ==========
> +
> +  这保持了新旧版本之间的兼容性。
> +  当前版本被定义为0.2。
> +
> +- 从版本0.2开始，结构体成员“magic”就已经被弃用，在之后的版本中，可能会移除掉它。
> +  最初，该成员应该与ARM64头的“magic”成员匹配，但遗憾的是并没有。
> +  “magic2”成员代替“magic”成员与ARM64头相匹配。
> +
> +- 在当前的文件头，标志位域只剩下了一个。
> +
> +	=====  ==============================
> +	Bit 0  内核字节序。1 if BE, 0 if LE.
> +	=====  ==============================
> +
> +- 对于引导加载程序加载内核映像来说，image_size成员是强制性要写进文件头的，否则将引
> +  导失败。
> 
