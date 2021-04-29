Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B295C433ED
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 15:11:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 427A4613F9
	for <linux-doc@archiver.kernel.org>; Thu, 29 Apr 2021 15:11:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhD2PME (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Apr 2021 11:12:04 -0400
Received: from [43.250.32.171] ([43.250.32.171]:36500 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S233480AbhD2PMB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 29 Apr 2021 11:12:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=2TIr2dNpxT+f1MwI261HxKxw7IGnG3ZruDL3j
        5gGbJQ=; b=bt4HS2c3JGNyUAqo4Ow7XMKkcRbEiUiWfAPFEJ0gBhUFeMyEJZq8b
        zlCpyJgZwHLi7HYYrhv3YTIZ6kg0Jvsc9CWqpx8BsWWtn2BLYivK028VEnY9UsOz
        cb9/L1rXzYVzQeNFTUtPUoVetH/7bcrA7n780uLM8DzSGXVN6MQRnI=
Received: from bobwxc.top (unknown [110.64.86.229])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDnrkGCzIpguAcRAA--.44162S2;
        Thu, 29 Apr 2021 23:11:00 +0800 (CST)
Date:   Thu, 29 Apr 2021 23:10:58 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: Re: [PATCH 1/3] docs/zh_CN: add parisc index translation
Message-ID: <20210429151058.GA23087@bobwxc.top>
References: <cover.1619665430.git.siyanteng@loongson.cn>
 <7e64ac33597d69635497b03b29d63e17f905c96f.1619665430.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e64ac33597d69635497b03b29d63e17f905c96f.1619665430.git.siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDnrkGCzIpguAcRAA--.44162S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tF1kCF13AFyfuw1kZr4kXrb_yoW8Ar4DpF
        97KryfKa1fXry7C3yfKr17Gr15G3WfC3yDGw4IqwnYqr1DGr40yr1Ut345KFZrKrWSvFW8
        XF4fKFW5u34jkw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqqb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrwCF04
        k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
        wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
        0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AK
        xVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr
        1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUU3rc3UU
        UUU==
X-Originating-IP: [110.64.86.229]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 29, 2021 at 11:33:33AM +0800, Yanteng Si wrote:
> This path translates Documentation/parisc/index.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

PA-RISC docs are silent, lastest practical activity on 2013-07-09.

> ---
>  Documentation/translations/zh_CN/index.rst    |  1 +
>  .../translations/zh_CN/parisc/index.rst       | 24 +++++++++++++++++++
>  2 files changed, 25 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/parisc/index.rst
> 
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> index ee6b20ca9080..160a55f819bf 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -30,6 +30,7 @@
>     riscv/index
>     core-api/index
>     openrisc/index
> +   parisc/index
>  
>  目录和表格
>  ----------
> diff --git a/Documentation/translations/zh_CN/parisc/index.rst b/Documentation/translations/zh_CN/parisc/index.rst
> new file mode 100644
> index 000000000000..ef232d46b1ba
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/parisc/index.rst
> @@ -0,0 +1,24 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/parisc/index.rst
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_parisc_index:
> +
> +====================
> +PA-RISC体系架构
> +====================
> +
> +Todolist:
> +
> +   debugging
> +   registers
> +   features
> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`
> -- 
> 2.27.0

