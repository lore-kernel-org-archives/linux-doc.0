Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5C23C43334
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jul 2022 07:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232348AbiGUHRF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jul 2022 03:17:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbiGUHRE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jul 2022 03:17:04 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB42F7B345
        for <linux-doc@vger.kernel.org>; Thu, 21 Jul 2022 00:17:01 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxE9Br_dhiFhUsAA--.29S3;
        Thu, 21 Jul 2022 15:17:00 +0800 (CST)
Message-ID: <73f83c92-5d5e-1d7e-8c9d-e5b0125bfce5@loongson.cn>
Date:   Thu, 21 Jul 2022 15:17:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/4] docs/zh_CN: core-api: Add generic-radix-tree
 Chinese translation
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org
References: <cover.1658196777.git.zhoubinbin@loongson.cn>
 <b19a0f518abb690cedd269be3b0f656d5ec0d3eb.1658196777.git.zhoubinbin@loongson.cn>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <b19a0f518abb690cedd269be3b0f656d5ec0d3eb.1658196777.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxE9Br_dhiFhUsAA--.29S3
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4kWFWUKw45Jr48AFy3XFb_yoW8uryfpF
        9agFyxGa1xJry7Crs3Wr1UWryUJF4xWa15Kayxtw1FqFn5Jay0yr4DKrZxK34fGr10vay0
        vrs3KryDC34jy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Gr0_Zr1lIxAIcVC2
        z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUbvPfPUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/7/19 21:04, Binbin Zhou 写道:
> Translate core-api/generic-radix-tree.rst into Chinese.
>
> Last English version used:
>
> commit ba20ba2e3743 ("generic radix trees").
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by:  Yanteng Si <siyanteng@loongson.cn>


Thanks,

Yanteng
> ---
>   .../zh_CN/core-api/generic-radix-tree.rst     | 23 +++++++++++++++++++
>   .../translations/zh_CN/core-api/index.rst     |  2 +-
>   2 files changed, 24 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
>
> diff --git a/Documentation/translations/zh_CN/core-api/generic-radix-tree.rst b/Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
> new file mode 100644
> index 000000000000..eacd1d2ebddc
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/generic-radix-tree.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/generic-radix-tree.rst
> +
> +:翻译:
> +
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +===================
> +通用基数树/稀疏数组
> +===================
> +
> +通用基数树/稀疏数组的相关内容请见include/linux/generic-radix-tree.h文件中的
> +“DOC: Generic radix trees/sparse arrays”。
> +
> +通用基数树函数
> +--------------
> +
> +该API在以下内核代码中:
> +
> +include/linux/generic-radix-tree.h
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index 854b923f3b30..60f76c83a9d8 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -46,12 +46,12 @@
>      rbtree
>      idr
>      circular-buffers
> +   generic-radix-tree
>   
>   Todolist:
>   
>   
>   
> -   generic-radix-tree
>      packing
>      bus-virt-phys-mapping
>      this_cpu_ops

