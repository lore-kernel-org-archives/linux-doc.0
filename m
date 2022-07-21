Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4724C43334
	for <linux-doc@archiver.kernel.org>; Thu, 21 Jul 2022 07:15:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232348AbiGUHPX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Jul 2022 03:15:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230238AbiGUHPW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Jul 2022 03:15:22 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7A40512636
        for <linux-doc@vger.kernel.org>; Thu, 21 Jul 2022 00:15:20 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxaeAE_dhisBQsAA--.9934S3;
        Thu, 21 Jul 2022 15:15:17 +0800 (CST)
Message-ID: <ff68ddbf-de81-68c3-73c1-93bdb7b81964@loongson.cn>
Date:   Thu, 21 Jul 2022 15:15:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/4] docs/zh_CN: core-api: Add idr Chinese translation
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org
References: <cover.1658196777.git.zhoubinbin@loongson.cn>
 <d98c444489ba3402f83a12524d83926048d559d2.1658196777.git.zhoubinbin@loongson.cn>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <d98c444489ba3402f83a12524d83926048d559d2.1658196777.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxaeAE_dhisBQsAA--.9934S3
X-Coremail-Antispam: 1UD129KBjvJXoWxXr1DXw48GFyrKF4fuF4fAFb_yoWrKFWkpF
        ykKryxKa18AFyjkF97WryUXr1kAF4xCanrGa4xX3WrXr95AFWxKrW7tas8K39rGry0ya4k
        CFWfKFWj9ry2y3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
        JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
        xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUQyCJUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/7/19 21:04, Binbin Zhou 写道:
> Translate core-api/idr.rst into Chinese.
>
> Last English version used:
>
> commit ec8213f89005 ("Core-api: Documentation: Replace deprecated
> :c:func: Usage").
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Reviewed-by: Yanteng Si<siyanteng@loongson.cn>


Thanks,

Yanteng
> ---
>   .../translations/zh_CN/core-api/idr.rst       | 77 +++++++++++++++++++
>   .../translations/zh_CN/core-api/index.rst     |  2 +-
>   2 files changed, 78 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/core-api/idr.rst
>
> diff --git a/Documentation/translations/zh_CN/core-api/idr.rst b/Documentation/translations/zh_CN/core-api/idr.rst
> new file mode 100644
> index 000000000000..adf79ff8e19a
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/idr.rst
> @@ -0,0 +1,77 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/idr.rst
> +
> +:翻译:
> +
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +:校译:
> +
> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
> + 吴想成 Wu Xiangcheng <bobwxc@email.cn>
> +
> +======
> +ID分配
> +======
> +
> +:作者: Matthew Wilcox
> +
> +概述
> +====
> +
> +要解决的一个常见问题是分配标识符（IDs）；它通常是标识事物的数字。比如包括文件描述
> +符、进程ID、网络协议中的数据包标识符、SCSI标记和设备实例编号。IDR和IDA为这个问题
> +提供了一个合理的解决方案，以避免每个人都自创。IDR提供将ID映射到指针的能力，而IDA
> +仅提供ID分配，因此内存效率更高。
> +
> +IDR的用法
> +=========
> +
> +首先初始化一个IDR，对于静态分配的IDR使用DEFINE_IDR()，或者对于动态分配的IDR使用
> +idr_init()。
> +
> +您可以调用idr_alloc()来分配一个未使用的ID。通过调用idr_find()查询与该ID相关的指针，
> +并通过调用idr_remove()释放该ID。
> +
> +如果需要更改与一个ID相关联的指针，可以调用idr_replace()。这样做的一个常见原因是通
> +过将 ``NULL`` 指针传递给分配函数来保留ID；用保留的ID初始化对象，最后将初始化的对
> +象插入IDR。
> +
> +一些用户需要分配大于 ``INT_MAX`` 的ID。到目前为止，所有这些用户都满足 ``UINT_MAX``
> +的限制，他们使用idr_alloc_u32()。如果您需要超出u32的ID，我们将与您合作以满足您的
> +需求。
> +
> +如果需要按顺序分配ID，可以使用idr_alloc_cyclic()。处理较大数量的ID时，IDR的效率会
> +降低，所以使用这个函数会有一点代价。
> +
> +要对IDR使用的所有指针进行操作，您可以使用基于回调的idr_for_each()或迭代器样式的
> +idr_for_each_entry()。您可能需要使用idr_for_each_entry_continue()来继续迭代。如果
> +迭代器不符合您的需求，您也可以使用idr_get_next()。
> +
> +当使用完IDR后，您可以调用idr_destroy()来释放IDR占用的内存。这并不会释放IDR指向的
> +对象；如果您想这样做，请使用其中一个迭代器来执行此操作。
> +
> +您可以使用idr_is_empty()来查看当前是否分配了任何ID。
> +
> +如果在从IDR分配一个新ID时需要带锁，您可能需要传递一组限制性的GFP标志，但这可能导
> +致IDR无法分配内存。为了解决该问题，您可以在获取锁之前调用idr_preload()，然后在分
> +配之后调用idr_preload_end()。
> +
> +IDR同步的相关内容请见include/linux/idr.h文件中的“DOC: idr sync”。
> +
> +IDA的用法
> +=========
> +
> +IDA的用法的相关内容请见lib/idr.c文件中的“DOC: IDA description”。
> +
> +函数和数据结构
> +==============
> +
> +该API在以下内核代码中:
> +
> +include/linux/idr.h
> +
> +lib/idr.c
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index 7ca44629860c..94eeef20c042 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -44,12 +44,12 @@
>      assoc_array
>      xarray
>      rbtree
> +   idr
>   
>   Todolist:
>   
>   
>   
> -   idr
>      circular-buffers
>      generic-radix-tree
>      packing

