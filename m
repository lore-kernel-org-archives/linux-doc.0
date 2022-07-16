Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA355C43334
	for <linux-doc@archiver.kernel.org>; Sat, 16 Jul 2022 08:41:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbiGPIlj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 16 Jul 2022 04:41:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229571AbiGPIli (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Jul 2022 04:41:38 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 131331AF16
        for <linux-doc@vger.kernel.org>; Sat, 16 Jul 2022 01:41:35 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx79C7edJicV8iAA--.28080S3;
        Sat, 16 Jul 2022 16:41:32 +0800 (CST)
Message-ID: <6904a35b-6425-36af-66a0-ecd0a222a15f@loongson.cn>
Date:   Sat, 16 Jul 2022 16:41:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/4] docs/zh_CN: core-api: Add idr Chinese translation
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        zhoubb.aaron@gmail.com, linux-doc@vger.kernel.org
References: <cover.1657796498.git.zhoubinbin@loongson.cn>
 <173707ec644d2a8ba394254f5596d5ce80290f23.1657796499.git.zhoubinbin@loongson.cn>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <173707ec644d2a8ba394254f5596d5ce80290f23.1657796499.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx79C7edJicV8iAA--.28080S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZFW5GF47JrW8Aw13CF4rZrb_yoWrKFykpF
        97KryxKa1IyFy7Cas7WFyUXrnrAF4xCanrGa4xX3WFqr95AFWIkrW7tas8K3y7Gry0ya4k
        CFWrKFWjkryjk3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE
        67vIY487MxkIecxEwVAFwVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
        73UjIFyTuYvjfUeHUDDUUUU
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/7/14 21:06, Binbin Zhou 写道:
> Translate core-api/idr.rst into Chinese.
>
> Last English version used:
>
> commit 85656ec193e9 ("IDR: Note that the IDR API is deprecated").
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>   .../translations/zh_CN/core-api/idr.rst       | 74 +++++++++++++++++++
>   .../translations/zh_CN/core-api/index.rst     |  2 +-
>   2 files changed, 75 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/core-api/idr.rst
>
> diff --git a/Documentation/translations/zh_CN/core-api/idr.rst b/Documentation/translations/zh_CN/core-api/idr.rst
> new file mode 100644
> index 000000000000..73458247deb7
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/idr.rst
> @@ -0,0 +1,74 @@
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
> +IDR接口已经被废弃，请使用 `XArray <xarray>` 代替。
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
> +一些用户需要分配大于 ``INT_MAX`` 的ID。到目前为止，所有这些用户都满足于 ``UINT_MAX``
> +限制，他们使用idr_alloc_u32()。如果您需要的ID不适合在u32中使用，我们将与您合作以
> +满足您的需求。
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
> +相关API请见以下内核文件：

该API在以下内核代码中:

see .../zh_CN/core-api/kernel-api.rst


Thanks,

Yanteng

> +
> +include/linux/idr.h
> +
> +lib/idr.c
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index 080643bac459..f7210018d7f9 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -43,12 +43,12 @@
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

