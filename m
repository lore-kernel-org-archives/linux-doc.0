Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D09C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 16 Jul 2022 09:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230059AbiGPJTA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 16 Jul 2022 05:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiGPJS7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Jul 2022 05:18:59 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 37FAEE090
        for <linux-doc@vger.kernel.org>; Sat, 16 Jul 2022 02:18:57 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.110.136])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9F+gtJidGwiAA--.28196S3;
        Sat, 16 Jul 2022 17:18:54 +0800 (CST)
Message-ID: <86118122-2885-78e3-677e-b3a6ca47a20c@loongson.cn>
Date:   Sat, 16 Jul 2022 17:18:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] docs/zh_CN: core-api: Add packing Chinese translation
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        zhoubb.aaron@gmail.com, linux-doc@vger.kernel.org
References: <cover.1657796498.git.zhoubinbin@loongson.cn>
 <275084e9fd0af8f1886cf3fbeea13f3dde8e1846.1657796499.git.zhoubinbin@loongson.cn>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <275084e9fd0af8f1886cf3fbeea13f3dde8e1846.1657796499.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxz9F+gtJidGwiAA--.28196S3
X-Coremail-Antispam: 1UD129KBjvJXoW3ArW7tF4UJF45XFWxJryrWFg_yoW3ur4UpF
        97K34xC3W2yryj9wn3CryUK3WkArWxC3Z29ay8KF18tF1rG39rtFW7KFy5W3y7Wry0ya4j
        vrs3tr9rA34SyFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CE
        bIxvr21lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
        nxnUUI43ZEXa7VUbgyCJUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/7/14 21:06, Binbin Zhou 写道:
> Translate core-api/packing.rst into Chinese.
>
> Last English version used:
>
> commit 1ec779b9fabc ("docs: packing: move it to core-api book
> and adjust markups").
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>   .../translations/zh_CN/core-api/index.rst     |   2 +-
>   .../translations/zh_CN/core-api/packing.rst   | 154 ++++++++++++++++++
>   2 files changed, 155 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/core-api/packing.rst
>
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index aa376da1800e..2f00210a12b8 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -46,12 +46,12 @@
>      idr
>      circular-buffers
>      generic-radix-tree
> +   packing
>   
>   Todolist:
>   
>   
>   
> -   packing
>      this_cpu_ops
>      timekeeping
>      errseq
> diff --git a/Documentation/translations/zh_CN/core-api/packing.rst b/Documentation/translations/zh_CN/core-api/packing.rst
> new file mode 100644
> index 000000000000..6d606c41709e
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/packing.rst
> @@ -0,0 +1,154 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/packing.rst
> +
> +:翻译:
> +
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +========================
> +通用的位域打包和解包函数
> +========================
> +
> +问题陈述
> +--------
> +
> +使用硬件时，必须在几种与其交互的方法之间进行选择。
> +
> +可以将指针映射到在硬件设备的内存区域上精心设计的结构，并将其字段作为结构成员（可

结构 -> 结构体

内存区域 -> 内存区 （just like 缓冲区）

> +能声明为位域）访问。但是由于CPU和硬件设备之间潜在的字节顺序不匹配，以这种方式编
> +写代码会降低其可移植性。
> +
> +此外，必须密切注意将硬件文档中的寄存器定义转换为结构的位域索引。此外，一些硬件
> +（通常是网络设备）倾向于以违反任何合理字边界（有时甚至是64位）的方式对其寄存器字
> +段进行分组。这就造成了不得不在结构中定义寄存器字段的“高”和“低”部分的不便。
> +
> +结构域定义的更可靠的替代方法是通过移动适当数量的位来提取所需的字段。但这仍然不能
> +防止字节顺序不匹配，除非所有内存访问都是逐字节执行的。此外，代码很容易变得杂乱无
> +章，同时可能会在所需的许多位移操作中丢失一些高层次的想法。
> +
> +许多驱动程序采用了位移的方法，然后试图用定制的宏来减少杂乱无章的东西，但更多的时
> +候，这些宏所采用的捷径依旧妨碍了代码真正的可移植性。
> +
> +解决方案
> +--------
> +
> +该API涉及2个基本操作：
> +
> +  - 将一个CPU可使用的数字打包到内存缓冲区中（具有硬件约束/特殊性）。
> +  - 将内存缓冲区（具有硬件约束/特殊性）解压缩为一个CPU可使用的数字。
> +
> +该API提供了对所述硬件约束和特殊性以及CPU字节序的抽象，因此这两者之间可能不匹配。
> +
> +这些API函数的基本单元是u64。从CPU的角度来看，位63总是意味着字节7的位偏移量7，尽管
> +只是逻辑上的。问题是：我们将这个位放在什么内存的位置？
我们在内存中把这个比特放在哪里？
> +
> +以下示例介绍了打包u64字段的内存布局。打包缓冲区中的字节偏移量始终默认为0，1...7。
> +示例显示的是逻辑字节和位所在的位置。
> +
> +1. 通常情况下（无特殊性），我们会这样做：
> +
> +::
> +
> +  63 62 61 60 59 58 57 56 55 54 53 52 51 50 49 48 47 46 45 44 43 42 41 40 39 38 37 36 35 34 33 32
> +  7                       6                       5                        4
> +  31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0
> +  3                       2                       1                        0
> +
> +也就是说，CPU可使用的u64的MSByte(7)位于内存偏移量0处，而u64的LSByte(0)位于内存偏移量7处。
> +
> +这对应于大多数人认为的“大端”，其中位i对应于数字2^i。这在代码注释中也称为“逻辑”符号。
> +
> +
> +2. 如果设置了QUIRK_MSB_ON_THE_RIGHT，我们按如下方式操作：
> +
> +::
> +
> +  56 57 58 59 60 61 62 63 48 49 50 51 52 53 54 55 40 41 42 43 44 45 46 47 32 33 34 35 36 37 38 39
> +  7                       6                        5                       4
> +  24 25 26 27 28 29 30 31 16 17 18 19 20 21 22 23  8  9 10 11 12 13 14 15  0  1  2  3  4  5  6  7
> +  3                       2                        1                       0
> +
> +也就是说，QUIRK_MSB_ON_THE_RIGHT不会影响字节定位，但会反转字节内的位偏移量。
> +
> +
> +3. 如果设置了QUIRK_LITTLE_ENDIAN，我们按如下方式操作：
> +
> +::
> +
> +  39 38 37 36 35 34 33 32 47 46 45 44 43 42 41 40 55 54 53 52 51 50 49 48 63 62 61 60 59 58 57 56
> +  4                       5                       6                       7
> +  7  6  5  4  3  2  1  0  15 14 13 12 11 10  9  8 23 22 21 20 19 18 17 16 31 30 29 28 27 26 25 24
> +  0                       1                       2                       3
> +
> +因此，QUIRK_LITTLE_ENDIAN意味着在内存区域内，每个4字节的字的每个字节都被放置在与
> +该字的边界相比的镜像位置。
> +
> +
> +4. 如果设置了QUIRK_MSB_ON_THE_RIGHT和QUIRK_LITTLE_ENDIAN，我们这样做：
> +
> +::
> +
> +  32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63
> +  4                       5                       6                       7
> +  0  1  2  3  4  5  6  7  8   9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
> +  0                       1                       2                       3
> +
> +
> +5. 如果只设置了QUIRK_LSW32_IS_FIRST，我们这样做：
> +
> +::
> +
> +  31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0
> +  3                       2                       1                        0
> +  63 62 61 60 59 58 57 56 55 54 53 52 51 50 49 48 47 46 45 44 43 42 41 40 39 38 37 36 35 34 33 32
> +  7                       6                       5                        4
> +
> +在这种情况下，8字节内存区域解释如下：前4字节对应最不重要的4字节的字，后4字节对应
> +更重要的4字节的字。
> +
> +6. 如果设置了QUIRK_LSW32_IS_FIRST和QUIRK_MSB_ON_THE_RIGHT，我们这样做：
> +
> +::
> +
> +  24 25 26 27 28 29 30 31 16 17 18 19 20 21 22 23  8  9 10 11 12 13 14 15  0  1  2  3  4  5  6  7
> +  3                       2                        1                       0
> +  56 57 58 59 60 61 62 63 48 49 50 51 52 53 54 55 40 41 42 43 44 45 46 47 32 33 34 35 36 37 38 39
> +  7                       6                        5                       4
> +
> +
> +7. 如果设置了QUIRK_LSW32_IS_FIRST和QUIRK_LITTLE_ENDIAN，则如下所示：
> +
> +::
> +
> +  7  6  5  4  3  2  1  0  15 14 13 12 11 10  9  8 23 22 21 20 19 18 17 16 31 30 29 28 27 26 25 24
> +  0                       1                       2                       3
> +  39 38 37 36 35 34 33 32 47 46 45 44 43 42 41 40 55 54 53 52 51 50 49 48 63 62 61 60 59 58 57 56
> +  4                       5                       6                       7
> +
> +
> +8. 如果设置了QUIRK_LSW32_IS_FIRST，QUIRK_LITTLE_ENDIAN和QUIRK_MSB_ON_THE_RIGHT，
> +   则如下所示：
> +
> +::
> +
> +  0  1  2  3  4  5  6  7  8   9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
> +  0                       1                       2                       3
> +  32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63
> +  4                       5                       6                       7
> +
> +
> +我们总是认为我们的偏移量好像没有特殊性，然后在访问内存区域之前翻译它们。
> +
> +预期用途
> +--------
> +
> +选择使用该API的驱动程序首先需要确定上述3种quirk组合（共8种）中的哪一种与硬件文档
> +中描述的相匹配。然后，他们应该封装packing()函数，创建一个新的xxx_packing()，使用
> +适当的QUIRK_* one-hot 位集合来调用它。
> +
> +packing()函数返回一个int类型的错误码，以防止程序员使用不正确的API。这些错误预计不
> +会在运行时发生，因此xxx_packing()返回void并简单地接受这些错误是合理的。它可以选择
> +转储堆栈或打印错误描述。

堆栈 -> 栈


Thanks,

Yanteng

