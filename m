Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A3CECAAA2
	for <linux-doc@archiver.kernel.org>; Mon, 29 Aug 2022 01:56:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiH2B44 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 28 Aug 2022 21:56:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229447AbiH2B4z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 28 Aug 2022 21:56:55 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A1C5F3056B
        for <linux-doc@vger.kernel.org>; Sun, 28 Aug 2022 18:56:52 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxBOLbHAxjjZYLAA--.51180S3;
        Mon, 29 Aug 2022 09:56:45 +0800 (CST)
Message-ID: <a9c149cd-bca0-88e1-f93e-fdd620de7d54@loongson.cn>
Date:   Mon, 29 Aug 2022 09:56:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] docs/zh_CN: Update zh_CN/process/submit-checklist.rst to
 6.0-rc2
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>,
        Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Binbin Zhou <zhoubinbin@loongson.cn>, linux-doc@vger.kernel.org
References: <Ywli7VfhQVPHKiGw@bobwxc.mipc>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <Ywli7VfhQVPHKiGw@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxBOLbHAxjjZYLAA--.51180S3
X-Coremail-Antispam: 1UD129KBjvJXoWfJr1kWr15tr1xAFWkZFykuFg_yoWDZrW3pF
        yvqw13t3WxtF15CrW8KrWDuFy3CFsrCa92kw17Ja4xXr1kt39YyFWakF9xWF1DX34rCFW8
        XFs3WF9Ikr12v37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvm14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
        4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
        WUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7I2V7IY0VAS07Al
        zVAYIcxG8wCY02Avz4vE14v_KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
        x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnU
        UI43ZEXa7VUbYFAPUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/8/27 8:18, Wu XiangCheng 写道:
> From: Wu XiangCheng <bobwxc@email.cn>
>
> * update to commit 163ba35ff371 ("doc: use KCFLAGS instead of
>    EXTRA_CFLAGS to pass flags from command line")
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>
> One question here:
> 	Should we use `#)` to replace ordered list prefix `Number)` ?
> 	It's inconvenient to manually modify them every time. Auto
> 	generating is better.
>
>   .../zh_CN/process/submit-checklist.rst        | 82 ++++++++++---------
>   1 file changed, 43 insertions(+), 39 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/process/submit-checklist.rst b/Documentation/translations/zh_CN/process/submit-checklist.rst
> index a64858d321fc..a84b4d8361f4 100644
> --- a/Documentation/translations/zh_CN/process/submit-checklist.rst
> +++ b/Documentation/translations/zh_CN/process/submit-checklist.rst
> @@ -1,105 +1,111 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: :ref:`Documentation/process/submit-checklist.rst <submitchecklist>`
> -:Translator: Alex Shi <alex.shi@linux.alibaba.com>
> +:Original: Documentation/process/submit-checklist.rst
> +:Translator:
> + - Alex Shi <alexs@kernel.org>
> + - Wu XiangCheng <bobwxc@email.cn>
>   
>   .. _cn_submitchecklist:
>   
> -Linux内核补丁提交清单
> -~~~~~~~~~~~~~~~~~~~~~
> +Linux内核补丁提交检查单
> +~~~~~~~~~~~~~~~~~~~~~~~
>   
>   如果开发人员希望看到他们的内核补丁提交更快地被接受，那么他们应该做一些基本
>   的事情。
>   
> -这些都是在
> -:ref:`Documentation/translations/zh_CN/process/submitting-patches.rst <cn_submittingpatches>`
> +这些都是在 Documentation/translations/zh_CN/process/submitting-patches.rst
>   和其他有关提交Linux内核补丁的文档中提供的。
>   
> -1) 如果使用工具，则包括定义/声明该工具的文件。不要依赖于其他头文件拉入您使用
> +1) 如果使用工具，则包括定义/声明该工具的文件。不要依赖其他头文件来引入您使用
>      的头文件。
>   
>   2) 干净的编译：
>   
> -   a) 使用适用或修改的 ``CONFIG`` 选项 ``=y``、``=m`` 和 ``=n`` 。没有GCC
> +   a) 使用合适的 ``CONFIG`` 选项 ``=y``、``=m`` 和 ``=n`` 。没有 ``gcc``
>         警告/错误，没有链接器警告/错误。
>   
> -   b) 通过allnoconfig、allmodconfig
> +   b) 通过 ``allnoconfig`` 、 ``allmodconfig``
>   
>      c) 使用 ``O=builddir`` 时可以成功编译
>   
> -3) 通过使用本地交叉编译工具或其他一些构建场在多个CPU体系结构上构建。
> +   d) 任何 Doucmentation/ 下的变更都能成功构建且不引入新警告/错误。
> +      用 ``make htmldocs`` 或 ``make pdfdocs`` 检验构建情况并修复问题。
> +
> +3) 通过使用本地交叉编译工具或其他一些构建设施在多个CPU体系结构上构建。
>   
>   4) PPC64是一种很好的交叉编译检查体系结构，因为它倾向于对64位的数使用无符号
>      长整型。
>   
> -5) 如下所述 :ref:`Documentation/translations/zh_CN/process/coding-style.rst <cn_codingstyle>`.
> -   检查您的补丁是否为常规样式。在提交（ ``scripts/check patch.pl`` ）之前，
> -   使用补丁样式检查器检查是否有轻微的冲突。您应该能够处理您的补丁中存在的所有
> +5) 按 Documentation/translations/zh_CN/process/coding-style.rst 所述检查您的
> +   补丁是否为常规样式。在提交之前使用补丁样式检查器 ``scripts/checkpatch.pl``
> +   检查是否有轻微的冲突。您应该能够处理您的补丁中存在的所有
>      违规行为。
>   
> -6) 任何新的或修改过的 ``CONFIG`` 选项都不会弄脏配置菜单，并默认为关闭，除非
> -   它们符合 ``Documentation/kbuild/kconfig-language.rst`` 中记录的异常条件,
> -   菜单属性：默认值.
> +6) 任何新的或修改过的 ``CONFIG`` 选项都不应搞乱配置菜单，并默认为关闭，除非
> +   它们符合 ``Documentation/kbuild/kconfig-language.rst`` 菜单属性：默认值中
> +   记录的例外条件。
>   
>   7) 所有新的 ``kconfig`` 选项都有帮助文本。
>   
>   8) 已仔细审查了相关的 ``Kconfig`` 组合。这很难用测试来纠正——脑力在这里是有
>      回报的。
>   
> -9) 用 sparse 检查干净。
> +9) 通过 sparse 清查。
> +   （参见 Documentation/translations/zh_CN/dev-tools/sparse.rst ）
>   
>   10) 使用 ``make checkstack`` 和 ``make namespacecheck`` 并修复他们发现的任何
>       问题。
>   
>       .. note::
>   
> -        ``checkstack`` 并没有明确指出问题，但是任何一个在堆栈上使用超过512
> +        ``checkstack`` 并不会明确指出问题，但是任何一个在堆栈上使用超过512
>           字节的函数都可以进行更改。
>   
> -11) 包括 :ref:`kernel-doc <kernel_doc>` 内核文档以记录全局内核API。（静态函数
> -    不需要，但也可以。）使用 ``make htmldocs`` 或 ``make pdfdocs`` 检查
> -    :ref:`kernel-doc <kernel_doc>` 并修复任何问题。
> +11) 包括 :ref:`kernel-doc <kernel_doc_zh>` 内核文档以记录全局内核API。（静态
> +    函数不需要，但也可以。）使用 ``make htmldocs`` 或 ``make pdfdocs`` 检查
> +    :ref:`kernel-doc <kernel_doc_zh>` 并修复任何问题。
>   
> -12) 通过以下选项同时启用的测试 ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
> +12) 通过以下选项同时启用的测试： ``CONFIG_PREEMPT``, ``CONFIG_DEBUG_PREEMPT``,
>       ``CONFIG_DEBUG_SLAB``, ``CONFIG_DEBUG_PAGEALLOC``, ``CONFIG_DEBUG_MUTEXES``,
>       ``CONFIG_DEBUG_SPINLOCK``, ``CONFIG_DEBUG_ATOMIC_SLEEP``,
> -    ``CONFIG_PROVE_RCU`` and ``CONFIG_DEBUG_OBJECTS_RCU_HEAD``
> -
> -13) 已经过构建和运行时测试，包括有或没有 ``CONFIG_SMP``, ``CONFIG_PREEMPT``.
> +    ``CONFIG_PROVE_RCU`` 和 ``CONFIG_DEBUG_OBJECTS_RCU_HEAD`` 。
>   
> -14) 如果补丁程序影响IO/磁盘等：使用或不使用 ``CONFIG_LBDAF`` 进行测试。
> +13) 在 ``CONFIG_SMP``, ``CONFIG_PREEMPT`` 开启和关闭的情况下都进行构建和运行
> +    时测试。
>   
> -15) 所有代码路径都已在启用所有lockdep功能的情况下运行。
> +14) 所有代码路径都已在启用所有死锁检测（lockdep）功能的情况下运行。
>   
> -16) 所有新的/proc条目都记录在 ``Documentation/``
> +15) 所有新的 ``/proc`` 条目都记录在 ``Documentation/``
>   
> -17) 所有新的内核引导参数都记录在
> +16) 所有新的内核引导参数都记录在
>       Documentation/admin-guide/kernel-parameters.rst 中。
>   
> -18) 所有新的模块参数都记录在 ``MODULE_PARM_DESC()``
> +17) 所有新的模块参数都记录在 ``MODULE_PARM_DESC()``
>   
> -19) 所有新的用户空间接口都记录在 ``Documentation/ABI/`` 中。有关详细信息，
> +18) 所有新的用户空间接口都记录在 ``Documentation/ABI/`` 中。有关详细信息，
>       请参阅 ``Documentation/ABI/README`` 。更改用户空间接口的补丁应该抄送
>       linux-api@vger.kernel.org。
>   
> -20) 已通过至少注入slab和page分配失败进行检查。请参阅 ``Documentation/fault-injection/``
> +19) 已通过至少注入slab和page分配失败进行检查。请参阅 ``Documentation/fault-injection/`` 。
>       如果新代码是实质性的，那么添加子系统特定的故障注入可能是合适的。
>   
> -21) 新添加的代码已经用 ``gcc -W`` 编译（使用 ``make EXTRA-CFLAGS=-W`` ）。这
> +20) 新添加的代码已经用 ``gcc -W`` 编译（使用 ``make EXTRA-CFLAGS=-W`` ）。这
>       将产生大量噪声，但对于查找诸如“警告：有符号和无符号之间的比较”之类的错误
>       很有用。
>   
> -22) 在它被合并到-mm补丁集中之后进行测试，以确保它仍然与所有其他排队的补丁以
> +21) 在它被合并到-mm补丁集中之后进行测试，以确保它仍然与所有其他排队的补丁以
>       及VM、VFS和其他子系统中的各种更改一起工作。
>   
> -23) 所有内存屏障例如 ``barrier()``, ``rmb()``, ``wmb()`` 都需要源代码中的注
> +22) 所有内存屏障（例如 ``barrier()``, ``rmb()``, ``wmb()`` ）都需要源代码注
>       释来解释它们正在执行的操作及其原因的逻辑。
>   
> -24) 如果补丁添加了任何ioctl，那么也要更新 ``Documentation/userspace-api/ioctl/ioctl-number.rst``
> +23) 如果补丁添加了任何ioctl，那么也要更新
> +    ``Documentation/userspace-api/ioctl/ioctl-number.rst`` 。
>   
> -25) 如果修改后的源代码依赖或使用与以下 ``Kconfig`` 符号相关的任何内核API或
> +24) 如果修改后的源代码依赖或使用与以下 ``Kconfig`` 符号相关的任何内核API或
>       功能，则在禁用相关 ``Kconfig`` 符号和/或 ``=m`` （如果该选项可用）的情况
>       下测试以下多个构建[并非所有这些都同时存在，只是它们的各种/随机组合]：
>   
> -    ``CONFIG_SMP``, ``CONFIG_SYSFS``, ``CONFIG_PROC_FS``, ``CONFIG_INPUT``, ``CONFIG_PCI``, ``CONFIG_BLOCK``, ``CONFIG_PM``, ``CONFIG_MAGIC_SYSRQ``,
> -    ``CONFIG_NET``, ``CONFIG_INET=n`` (但是后者伴随 ``CONFIG_NET=y``).
> +    ``CONFIG_SMP``, ``CONFIG_SYSFS``, ``CONFIG_PROC_FS``, ``CONFIG_INPUT``,
> +    ``CONFIG_PCI``, ``CONFIG_BLOCK``, ``CONFIG_PM``, ``CONFIG_MAGIC_SYSRQ``,
> +    ``CONFIG_NET``, ``CONFIG_INET=n`` （但是最后一个需要 ``CONFIG_NET=y`` ）。

