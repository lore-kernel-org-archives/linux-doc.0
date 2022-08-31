Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408B3ECAAD1
	for <linux-doc@archiver.kernel.org>; Wed, 31 Aug 2022 06:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbiHaGqS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 31 Aug 2022 02:46:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbiHaGqR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 31 Aug 2022 02:46:17 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 00FDC1AF08
        for <linux-doc@vger.kernel.org>; Tue, 30 Aug 2022 23:45:14 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.110.237])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxvmtsAw9jNYINAA--.47895S3;
        Wed, 31 Aug 2022 14:45:01 +0800 (CST)
Message-ID: <746803ff-df6d-49ab-f353-fa3dc7498d53@loongson.cn>
Date:   Wed, 31 Aug 2022 14:44:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] docs/zh_CN: Update zh_CN/process/coding-style.rst to
 6.0-rc2
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>,
        Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Andy Deng <theandy.deng@gmail.com>,
        Zefan Li <lizefan.x@bytedance.com>
References: <Yw2ewM4wfaDDLjTk@bobwxc.mipc>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <Yw2ewM4wfaDDLjTk@bobwxc.mipc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxvmtsAw9jNYINAA--.47895S3
X-Coremail-Antispam: 1UD129KBjvAXoWfZw4DGr4fCw1UJryxGrWkXrb_yoW5Cr1rZo
        W5Zr15Zw1kCF45JF15tF45GayUXFn5GF4xCrsxtr43GryDGF1Sva18Aw17GryfZrn8tFnx
        GF1fJFy5CFyUJF1Dn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUY47k0a2IF6w4kM7kC6x804xWl14x267AKxVW8JVW5JwAFc2x0
        x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj4
        1l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0
        I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4
        vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487
        MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s
        026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_
        JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20x
        vEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE
        14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa
        7IU5GFAtUUUUU==
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/8/30 13:23, Wu XiangCheng 写道:
> From: Wu XiangCheng <bobwxc@email.cn>
>
> * update to commit c04639a7d2fb ("coding-style.rst: trivial: fix
>    location of driver model macros")
>
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>   .../zh_CN/process/coding-style.rst            | 274 +++++++++++++-----
>   1 file changed, 202 insertions(+), 72 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/process/coding-style.rst b/Documentation/translations/zh_CN/process/coding-style.rst
> index 638d714bec83..b4e6b4d0e4c1 100644
> --- a/Documentation/translations/zh_CN/process/coding-style.rst
> +++ b/Documentation/translations/zh_CN/process/coding-style.rst
> @@ -1,21 +1,23 @@
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: :ref:`Documentation/process/coding-style.rst <codingstyle>`
> +:Original: Documentation/process/coding-style.rst
>   
>   .. _cn_codingstyle:
>   
> -译者::
> +:译者:
> + - 张乐 Zhang Le <r0bertz@gentoo.org>
> + - Andy Deng <theandy.deng@gmail.com>
> + - 吴想成 <bobwxc@email.cn>
>   
> -  中文版维护者： 张乐 Zhang Le <r0bertz@gentoo.org>
> -  中文版翻译者： 张乐 Zhang Le <r0bertz@gentoo.org>
> -  中文版校译者： 王聪 Wang Cong <xiyou.wangcong@gmail.com>
> -                 wheelz <kernel.zeng@gmail.com>
> -                 管旭东 Xudong Guan <xudong.guan@gmail.com>
> -                 Li Zefan <lizf@cn.fujitsu.com>
> -                 Wang Chen <wangchen@cn.fujitsu.com>
> +:校译:
> + - 王聪 Wang Cong <xiyou.wangcong@gmail.com>
> + - wheelz <kernel.zeng@gmail.com>
> + - 管旭东 Xudong Guan <xudong.guan@gmail.com>
> + - Li Zefan <lizf@cn.fujitsu.com>
> + - Wang Chen <wangchen@cn.fujitsu.com>
>   
>   Linux 内核代码风格
> -=========================
> +==================
>   
>   这是一个简短的文档，描述了 linux 内核的首选代码风格。代码风格是因人而异的，
>   而且我不愿意把自己的观点强加给任何人，但这就像我去做任何事情都必须遵循的原则
> @@ -29,7 +31,7 @@ Linux 内核代码风格
>   
>   
>   1) 缩进
> ---------------
> +-------
>   
>   制表符是 8 个字符，所以缩进也是 8 个字符。有些异端运动试图将缩进变为 4 (甚至
>   2！) 字符深，这几乎相当于尝试将圆周率的值定义为 3。
> @@ -73,6 +75,22 @@ Linux 内核代码风格
>   	if (condition) do_this;
>   	  do_something_everytime;
>   
> +不要使用逗号来避免使用大括号：
> +
> +.. code-block:: c
> +
> +	if (condition)
> +		do_this(), do_that();
> +
> +使用大括号包裹多语句：
> +
> +.. code-block:: c
> +
> +	if (condition) {
> +		do_this();
> +		do_that();
> +	}
> +
>   也不要在一行里放多个赋值语句。内核代码风格超级简单。就是避免可能导致别人误读
>   的表达式。
>   
> @@ -83,20 +101,25 @@ Linux 内核代码风格
>   
>   
>   2) 把长的行和字符串打散
> -------------------------------
> +-----------------------
>   
>   代码风格的意义就在于使用平常使用的工具来维持代码的可读性和可维护性。
>   
>   每一行的长度的限制是 80 列，我们强烈建议您遵守这个惯例。
>   
>   长于 80 列的语句要打散成有意义的片段。除非超过 80 列能显著增加可读性，并且不
> -会隐藏信息。子片段要明显短于母片段，并明显靠右。这同样适用于有着很长参数列表
> -的函数头。然而，绝对不要打散对用户可见的字符串，例如 printk 信息，因为这样就
> +会隐藏信息。
> +
> +子片段要明显短于母片段，并明显靠右。一种非常常用的样式是将子体与函数左括号对齐。
> +
> +这同样适用于有着很长参数列表的函数头。
> +
> +然而，绝对不要打散对用户可见的字符串，例如 printk 信息，因为这样就
>   很难对它们 grep。
>   
>   
>   3) 大括号和空格的放置
> -------------------------------
> +---------------------
>   
>   C 语言风格中另外一个常见问题是大括号的放置。和缩进大小不同，选择或弃用某种放
>   置策略并没有多少技术上的原因，不过首选的方式，就像 Kernighan 和 Ritchie 展示
> @@ -132,12 +155,12 @@ C 语言风格中另外一个常见问题是大括号的放置。和缩进大小
>   		body of function
>   	}
>   
> -全世界的异端可能会抱怨这个不一致性是... 呃... 不一致的，不过所有思维健全的人
> +全世界的异端可能会抱怨这个不一致性是……呃……不一致，不过所有思维健全的人
>   都知道 (a) K&R 是 **正确的** 并且 (b) K&R 是正确的。此外，不管怎样函数都是特
>   殊的 (C 函数是不能嵌套的)。
>   
>   注意结束大括号独自占据一行，除非它后面跟着同一个语句的剩余部分，也就是 do 语
> -句中的 "while" 或者 if 语句中的 "else"，像这样：
> +句中的 ``while`` 或者 if 语句中的 ``else`` ，像这样：
>   
>   .. code-block:: c
>   
> @@ -191,7 +214,7 @@ C 语言风格中另外一个常见问题是大括号的放置。和缩进大小
>   	}
>   
>   3.1) 空格
> -********************
> +*********
>   
>   Linux 内核的空格使用方式 (主要) 取决于它是用于函数还是关键字。(大多数) 关键字
>   后要加一个空格。值得注意的例外是 sizeof, typeof, alignof 和 __attribute__，这
> @@ -254,7 +277,7 @@ Linux 内核的空格使用方式 (主要) 取决于它是用于函数还是关
>   
>   
>   4) 命名
> -------------------------------
> +-------
>   
>   C 是一个简朴的语言，你的命名也应该这样。和 Modula-2 和 Pascal 程序员不同，
>   C 程序员不使用类似 ThisVariableIsATemporaryCounter 这样华丽的名字。C 程序员会
> @@ -275,11 +298,31 @@ C 程序员不使用类似 ThisVariableIsATemporaryCounter 这样华丽的名字
>   可能的话。类似的， ``tmp`` 可以用来称呼任意类型的临时变量。
>   
>   如果你怕混淆了你的本地变量名，你就遇到另一个问题了，叫做函数增长荷尔蒙失衡综
> -合症。请看第六章 (函数)。
> +合征。请看第六章 (函数)。
>   
> +对于符号名称和文档，避免引入新的“master/slave”（或独立于“master”的“slave”）
> +和“blacklist/whitelist”。
> +
> +“master/slave”推荐替换为：
> +    '{primary,main} / {secondary,replica,subordinate}'
> +    '{initiator,requester} / {target,responder}'
> +    '{controller,host} / {device,worker,proxy}'
> +    'leader/follower'
> +    'director/performer'
> +
> +“blacklist/whitelist”推荐替换为：
> +    'denylist/allowlist'
> +    'blocklist/passlist'
> +
> +引入新用法的例外情况是：维护用户空间ABI/API，或更新现有（截至2020年）硬件或
> +协议规范的代码时要求这些术语。对于新规范，尽可能将术语的规范用法转换为内核
> +编码标准。
> +
> +.. warning::
> +	以上主从、黑白名单规则不适用于中文文档，请勿更改中文术语！
>   
>   5) Typedef
> ------------
> +----------
>   
>   不要使用类似 ``vps_t`` 之类的东西。
>   
> @@ -308,7 +351,7 @@ C 程序员不使用类似 ThisVariableIsATemporaryCounter 这样华丽的名字
>   
>        .. note::
>   
> -       不透明性和 "访问函数" 本身是不好的。我们使用 pte_t 等类型的原因在于真
> +       不透明性和“访问函数”本身是不好的。我们使用 pte_t 等类型的原因在于真
>          的是完全没有任何共用的可访问信息。
>   
>    (b) 清楚的整数类型，如此，这层抽象就可以 **帮助** 消除到底是 ``int`` 还是
> @@ -353,7 +396,7 @@ C 程序员不使用类似 ThisVariableIsATemporaryCounter 这样华丽的名字
>   
>   
>   6) 函数
> -------------------------------
> +-------
>   
>   函数应该简短而漂亮，并且只完成一件事情。函数应该可以一屏或者两屏显示完 (我们
>   都知道 ISO/ANSI 屏幕大小是 80x24)，只做一件事情，而且把它做好。
> @@ -383,12 +426,46 @@ C 程序员不使用类似 ThisVariableIsATemporaryCounter 这样华丽的名字
>   	}
>   	EXPORT_SYMBOL(system_is_up);
>   
> -在函数原型中，包含函数名和它们的数据类型。虽然 C 语言里没有这样的要求，在
> +6.1) 函数原型
> +*************
> +
> +在函数原型中包含参数名和它们的数据类型。虽然 C 语言里没有这样的要求，但在
>   Linux 里这是提倡的做法，因为这样可以很简单的给读者提供更多的有价值的信息。
>   
> +不要在函数声明里使用 ``extern`` 关键字，因为这会导致代码行变长，并且不是严格
> +必需的。
> +
> +写函数原型时，请保持 `元素顺序规则 <https://lore.kernel.org/mm-commits/CAHk-=wiOCLRny5aifWNhr621kYrJwhfURsa0vFPeUEm8mF0ufg@mail.gmail.com/>`_ 。
> +例如下列函数声明::
> +
> + __init void * __must_check action(enum magic value, size_t size, u8 count,
> +				   char *fmt, ...) __printf(4, 5) __malloc;
> +
> +推荐的函数原型元素顺序是：
> +
> +- 储存类型（下方的 ``static __always_inline`` ，注意 ``__always_inline``
> +  技术上来讲是个属性但被当做 ``inline`` ）
> +- 储存类型属性（上方的 ``__init`` ——即节声明，但也像 ``__cold`` ）
> +- 返回类型（上方的 ``void *`` ）
> +- 返回类型属性（上方的 ``__must_check`` ）
> +- 函数名（上方的 ``action`` ）
> +- 函数参数（上方的 ``(enum magic value, size_t size, u8 count, char *fmt, ...)`` ，
> +  注意必须写上参数名）
> +- 函数参数属性（上方的 ``__printf(4, 5)`` ）
> +- 函数行为属性（上方的 ``__malloc`` ）
> +
> +请注意，对于函数 **定义** （即实际函数体），编译器不允许在函数参数之后添加函
> +数参数属性。在这种情况下，它们应该跟随存储类型属性（例如，与上面的 **声明**
> +示例相比，请注意下面的 ``__printf(4, 5)`` 的位置发生了变化）::
> +
> + static __always_inline __init __printf(4, 5) void * __must_check action(enum magic value,
> +		size_t size, u8 count, char *fmt, ...) __malloc
> + {
> +	...
> + }
>   
>   7) 集中的函数退出途径
> -------------------------------
> +---------------------
>   
>   虽然被某些人声称已经过时，但是 goto 语句的等价物还是经常被编译器所使用，具体
>   形式是无条件跳转指令。
> @@ -432,7 +509,7 @@ Linux 里这是提倡的做法，因为这样可以很简单的给读者提供
>   		return result;
>   	}
>   
> -一个需要注意的常见错误是 ``一个 err 错误`` ，就像这样：
> +一个需要注意的常见错误是 ``单 err 错误`` ，就像这样：
>   
>   .. code-block:: c
>   
> @@ -456,19 +533,19 @@ Linux 里这是提倡的做法，因为这样可以很简单的给读者提供
>   
>   
>   8) 注释
> -------------------------------
> +-------
>   
>   注释是好的，不过有过度注释的危险。永远不要在注释里解释你的代码是如何运作的：
>   更好的做法是让别人一看你的代码就可以明白，解释写的很差的代码是浪费时间。
>   
> -一般的，你想要你的注释告诉别人你的代码做了什么，而不是怎么做的。也请你不要把
> +一般来说你用注释告诉别人你的代码做了什么，而不是怎么做的。也请你不要把
>   注释放在一个函数体内部：如果函数复杂到你需要独立的注释其中的一部分，你很可能
>   需要回到第六章看一看。你可以做一些小注释来注明或警告某些很聪明 (或者槽糕) 的
>   做法，但不要加太多。你应该做的，是把注释放在函数的头部，告诉人们它做了什么，
>   也可以加上它做这些事情的原因。
>   
> -当注释内核 API 函数时，请使用 kernel-doc 格式。请看
> -Documentation/doc-guide/ 和 scripts/kernel-doc 以获得详细信息。
> +当注释内核 API 函数时，请使用 kernel-doc 格式。详见
> +Documentation/translations/zh_CN/doc-guide/index.rst 和 scripts/kernel-doc 。
>   
>   长 (多行) 注释的首选风格是：
>   
> @@ -500,17 +577,18 @@ Documentation/doc-guide/ 和 scripts/kernel-doc 以获得详细信息。
>   
>   
>   9) 你已经把事情弄糟了
> -------------------------------
> +---------------------
>   
> -这没什么，我们都是这样。可能你的使用了很长时间 Unix 的朋友已经告诉你
> +这没什么，我们都是这样。可能你长期使用 Unix 的朋友已经告诉你
>   ``GNU emacs`` 能自动帮你格式化 C 源代码，而且你也注意到了，确实是这样，不过它
>   所使用的默认值和我们想要的相去甚远 (实际上，甚至比随机打的还要差——无数个猴子
> -在 GNU emacs 里打字永远不会创造出一个好程序) (译注：Infinite Monkey Theorem)
> +在 GNU emacs 里打字永远不会创造出一个好程序)
> +*(译注：Infinite Monkey Theorem)*
>   
>   所以你要么放弃 GNU emacs，要么改变它让它使用更合理的设定。要采用后一个方案，
>   你可以把下面这段粘贴到你的 .emacs 文件里。
>   
> -.. code-block:: none
> +.. code-block:: elisp
>   
>     (defun c-lineup-arglist-tabs-only (ignored)
>       "Line up argument lists by tabs, not spaces"
> @@ -529,7 +607,7 @@ Documentation/doc-guide/ 和 scripts/kernel-doc 以获得详细信息。
>             (c-offsets-alist . (
>                     (arglist-close         . c-lineup-arglist-tabs-only)
>                     (arglist-cont-nonempty .
> -		      (c-lineup-gcc-asm-reg c-lineup-arglist-tabs-only))
> +                      (c-lineup-gcc-asm-reg c-lineup-arglist-tabs-only))
>                     (arglist-intro         . +)
>                     (brace-list-intro      . +)
>                     (c                     . c-lineup-C-comments)
> @@ -573,9 +651,14 @@ Documentation/doc-guide/ 和 scripts/kernel-doc 以获得详细信息。
>   ``indent`` 有很多选项，特别是重新格式化注释的时候，你可能需要看一下它的手册。
>   不过记住： ``indent`` 不能修正坏的编程习惯。
>   
> +请注意，您还可以使用 ``clang-format`` 工具帮助您处理这些规则，快速自动重新格
> +式化部分代码，并审阅整个文件以发现代码风格错误、打字错误和可能的改进。它还可
> +以方便地排序 ``#include`` ，对齐变量/宏，重排文本和其他类似任务。
> +详见 Documentation/process/clang-format.rst 。
> +
>   
>   10) Kconfig 配置文件
> -------------------------------
> +--------------------
>   
>   对于遍布源码树的所有 Kconfig* 配置文件来说，它们缩进方式有所不同。紧挨着
>   ``config`` 定义的行，用一个制表符缩进，然而 help 信息的缩进则额外增加 2 个空
> @@ -598,11 +681,11 @@ Documentation/doc-guide/ 和 scripts/kernel-doc 以获得详细信息。
>   	depends on ADFS_FS
>   	...
>   
> -要查看配置文件的完整文档，请看 Documentation/kbuild/kconfig-language.rst。
> +要查看配置文件的完整文档，请看 Documentation/kbuild/kconfig-language.rst 。
>   
>   
>   11) 数据结构
> -------------------------------
> +------------
>   
>   如果一个数据结构，在创建和销毁它的单线执行环境之外可见，那么它必须要有一个引
>   用计数器。内核里没有垃圾收集 (并且内核之外的垃圾收集慢且效率低下)，这意味着你
> @@ -626,7 +709,7 @@ mm_count)，和文件系统 (``struct super_block``: s_count 和 s_active) 中
>   
>   
>   12) 宏，枚举和RTL
> -------------------------------
> +-----------------
>   
>   用于定义常量的宏的名字及枚举里的标签需要大写。
>   
> @@ -638,7 +721,7 @@ mm_count)，和文件系统 (``struct super_block``: s_count 和 s_active) 中
>   
>   宏的名字请用大写字母，不过形如函数的宏的名字可以用小写字母。
>   
> -一般的，如果能写成内联函数就不要写成像函数的宏。
> +通常如果能写成内联函数就不要写成像函数的宏。
>   
>   含有多个语句的宏应该被包含在一个 do-while 代码块里：
>   
> @@ -696,18 +779,18 @@ mm_count)，和文件系统 (``struct super_block``: s_count 和 s_active) 中
>   		(ret);				\
>   	})
>   
> -ret 是本地变量的通用名字 - __foo_ret 更不容易与一个已存在的变量冲突。
> +ret 是本地变量的通用名字—— __foo_ret 更不容易与一个已存在的变量冲突。
>   
>   cpp 手册对宏的讲解很详细。gcc internals 手册也详细讲解了 RTL，内核里的汇编语
>   言经常用到它。
>   
>   
>   13) 打印内核消息
> -------------------------------
> +----------------
>   
> -内核开发者应该是受过良好教育的。请一定注意内核信息的拼写，以给人以好的印象。
> +内核开发者应该看起来有文化。请一定注意内核信息的拼写，以给人良好的印象。
>   不要用不规范的单词比如 ``dont``，而要用 ``do not`` 或者 ``don't`` 。保证这些信
> -息简单明了,无歧义。
> +息简单明了、无歧义。
>   
>   内核信息不必以英文句号结束。
>   
> @@ -724,17 +807,18 @@ dev_info() 等等。对于那些不和某个特定设备相关连的信息，<li
>   或设定了 CONFIG_DYNAMIC_DEBUG。实际这同样是为了 dev_dbg()，一个相关约定是在一
>   个已经开启了 DEBUG 时，使用 VERBOSE_DEBUG 来添加 dev_vdbg()。
>   
> -许多子系统拥有 Kconfig 调试选项来开启 -DDEBUG 在对应的 Makefile 里面；在其他
> +许多子系统拥有 Kconfig 调试选项来开启对应 Makefile 里面的 -DDEBUG；在其他
>   情况下，特殊文件使用 #define DEBUG。当一条调试信息需要被无条件打印时，例如，
>   如果已经包含一个调试相关的 #ifdef 条件，printk(KERN_DEBUG ...) 就可被使用。
>   
>   
>   14) 分配内存
> -------------------------------
> +------------
>   
>   内核提供了下面的一般用途的内存分配函数：
>   kmalloc(), kzalloc(), kmalloc_array(), kcalloc(), vmalloc() 和 vzalloc()。
> -请参考 API 文档以获取有关它们的详细信息。
> +请参考 API 文档以获取有关它们的详细信息：
> +Documentation/translations/zh_CN/core-api/memory-allocation.rst 。
>   
>   传递结构体大小的首选形式是这样的：
>   
> @@ -761,11 +845,13 @@ kmalloc(), kzalloc(), kmalloc_array(), kcalloc(), vmalloc() 和 vzalloc()。
>   
>   	p = kcalloc(n, sizeof(...), ...);
>   
> -两种形式检查分配大小 n * sizeof(...) 的溢出，如果溢出返回 NULL。
> +两种形式都会检查分配 n * sizeof(...) 大小时内存的溢出，如果溢出返回 NULL。
>   
> +在没有 __GFP_NOWARN 的情况下使用时，这些通用分配函数都会在失败时发起堆栈转储，
> +因此当返回NULL时，没有必要发出额外的失败消息。
>   
>   15) 内联弊病
> -------------------------------
> +------------
>   
>   有一个常见的误解是 ``内联`` 是 gcc 提供的可以让代码运行更快的一个选项。虽然使
>   用内联函数有时候是恰当的 (比如作为一种替代宏的方式，请看第十二章)，不过很多情
> @@ -786,7 +872,7 @@ inline gcc 也可以自动使其内联。而且其他用户可能会要求移除
>   
>   
>   16) 函数返回值及命名
> -------------------------------
> +--------------------
>   
>   函数可以返回多种不同类型的值，最常见的一种是表明函数执行成功或者失败的值。这样
>   的一个值可以表示为一个错误代码整数 (-Exxx＝失败，0＝成功) 或者一个 ``成功``
> @@ -797,7 +883,7 @@ inline gcc 也可以自动使其内联。而且其他用户可能会要求移除
>   产生这种 bug，请遵循下面的惯例::
>   
>   	如果函数的名字是一个动作或者强制性的命令，那么这个函数应该返回错误代
> -	码整数。如果是一个判断，那么函数应该返回一个 "成功" 布尔值。
> +	码整数。如果是一个判断，那么函数应该返回一个“成功”布尔值。
>   
>   比如， ``add work`` 是一个命令，所以 add_work() 在成功时返回 0，在失败时返回
>   -EBUSY。类似的，因为 ``PCI device present`` 是一个判断，所以 pci_dev_present()
> @@ -806,13 +892,35 @@ inline gcc 也可以自动使其内联。而且其他用户可能会要求移除
>   所有 EXPORTed 函数都必须遵守这个惯例，所有的公共函数也都应该如此。私有
>   (static) 函数不需要如此，但是我们也推荐这样做。
>   
> -返回值是实际计算结果而不是计算是否成功的标志的函数不受此惯例的限制。一般的，
> +返回值是实际计算结果而不是计算是否成功的标志的函数不受此惯例的限制。通常
>   他们通过返回一些正常值范围之外的结果来表示出错。典型的例子是返回指针的函数，
>   他们使用 NULL 或者 ERR_PTR 机制来报告错误。
>   
> +17) 使用布尔类型
> +----------------
> +
> +Linux内核布尔（bool）类型是C99 _Bool类型的别名。布尔值只能为0或1，而对布尔的
> +隐式或显式转换将自动将值转换为true或false。在使用布尔类型时 **不需要** 构造，
> +它会消除一类错误。
> +
> +使用布尔值时，应使用true和false定义，而不是1和0。
>   
> -17) 不要重新发明内核宏
> -------------------------------
> +布尔函数返回类型和堆栈变量总是可以在适当的时候使用。鼓励使用布尔来提高可读性，
> +并且布尔值在存储时通常比“int”更好。
> +
> +如果缓存行布局或值的大小很重要，请不要使用布尔，因为其大小和对齐方式根据编译
> +的体系结构而不同。针对对齐和大小进行优化的结构体不应使用布尔。
> +
> +如果一个结构体有多个true/false值，请考虑将它们合并为具有1比特成员的位域，或使
> +用适当的固定宽度类型，如u8。
> +
> +类似地，对于函数参数，多个true/false值可以合并为单个按位的“标志”参数，如果调
> +用点具有裸true/false常量，“标志”参数通常是更具可读性的替代方法。
> +
> +总之，在结构体和参数中有限地使用布尔可以提高可读性。
> +
> +18) 不要重新发明内核宏
> +----------------------
>   
>   头文件 include/linux/kernel.h 包含了一些宏，你应该使用它们，而不要自己写一些
>   它们的变种。比如，如果你需要计算一个数组的长度，使用这个宏
> @@ -832,11 +940,11 @@ inline gcc 也可以自动使其内联。而且其他用户可能会要求移除
>   在你的代码里自己重新定义。
>   
>   
> -18) 编辑器模式行和其他需要罗嗦的事情
> ---------------------------------------------------
> +19) 编辑器模式行和其他需要罗嗦的事情
> +------------------------------------
>   
>   有一些编辑器可以解释嵌入在源文件里的由一些特殊标记标明的配置信息。比如，emacs
> -能够解释被标记成这样的行：
> +能够解析被标记成这样的行：
>   
>   .. code-block:: c
>   
> @@ -852,7 +960,7 @@ inline gcc 也可以自动使其内联。而且其他用户可能会要求移除
>   	End:
>   	*/
>   
> -Vim 能够解释这样的标记：
> +Vim 能够解析这样的标记：
>   
>   .. code-block:: c
>   
> @@ -863,8 +971,8 @@ Vim 能够解释这样的标记：
>   的模式，或者使用其他可以产生正确的缩进的巧妙方法。
>   
>   
> -19) 内联汇编
> -------------------------------
> +20) 内联汇编
> +------------
>   
>   在特定架构的代码中，你可能需要内联汇编与 CPU 和平台相关功能连接。需要这么做时
>   就不要犹豫。然而，当 C 可以完成工作时，不要平白无故地使用内联汇编。在可能的情
> @@ -880,8 +988,8 @@ Vim 能够解释这样的标记：
>   移除了。你不必总是这样做，尽管，这不必要的举动会限制优化。
>   
>   在写一个包含多条指令的单个内联汇编语句时，把每条指令用引号分割而且各占一行，
> -除了最后一条指令外，在每个指令结尾加上 \n\t，让汇编输出时可以正确地缩进下一条
> -指令：
> +除了最后一条指令外，在每个指令结尾加上 ``\n\t`` ，让汇编输出时可以正确地缩进
> +下一条指令：
>   
>   .. code-block:: c
>   
> @@ -890,10 +998,10 @@ Vim 能够解释这样的标记：
>   	     : /* outputs */ : /* inputs */ : /* clobbers */);
>   
>   
> -20) 条件编译
> -------------------------------
> +21) 条件编译
> +------------
>   
> -只要可能，就不要在 .c 文件里面使用预处理条件 (#if, #ifdef)；这样做让代码更难
> +只要可能，就不要在 .c 文件里面使用预处理条件 (#if, #ifdef)；这样做会让代码更难
>   阅读并且更难去跟踪逻辑。替代方案是，在头文件中用预处理条件提供给那些 .c 文件
>   使用，再给 #else 提供一个空桩 (no-op stub) 版本，然后在 .c 文件内无条件地调用
>   那些 (定义在头文件内的) 函数。这样做，编译器会避免为桩函数 (stub) 的调用生成
> @@ -904,8 +1012,8 @@ Vim 能够解释这样的标记：
>   条件到这个辅助函数内。
>   
>   如果你有一个在特定配置中，可能变成未使用的函数或变量，编译器会警告它定义了但
> -未使用，把它标记为 __maybe_unused 而不是将它包含在一个预处理条件中。(然而，如
> -果一个函数或变量总是未使用，就直接删除它。)
> +未使用，请把它标记为 __maybe_unused 而不是将它包含在一个预处理条件中。(然而，
> +如果一个函数或变量总是未使用，就直接删除它。)
>   
>   在代码中，尽可能地使用 IS_ENABLED 宏来转化某个 Kconfig 标记为 C 的布尔
>   表达式，并在一般的 C 条件中使用它：
> @@ -931,23 +1039,45 @@ Vim 能够解释这样的标记：
>   	#endif /* CONFIG_SOMETHING */
>   
>   
> -附录 I) 参考
> --------------------
> +附录 I) 参考资料
> +----------------
>   
> -The C Programming Language, 第二版
> +The C Programming Language, 2nd Edition
>   作者：Brian W. Kernighan 和 Denni M. Ritchie.
>   Prentice Hall, Inc., 1988.
> -ISBN 0-13-110362-8 (软皮), 0-13-110370-9 (硬皮).
> +ISBN 0-13-110362-8 (平装), 0-13-110370-9 (精装).
> +
> +.. note::
> +
> +    《C程序设计语言（第2版）》
> +    作者：[美] Brian W. Kernighan / [美] Dennis M. Ritchie
> +    译者：徐宝文 / 李志 / 尤晋元（审校）
> +    出版社：机械工业出版社，2019
> +    ISBN：9787111617945
>   
>   The Practice of Programming
>   作者：Brian W. Kernighan 和 Rob Pike.
>   Addison-Wesley, Inc., 1999.
>   ISBN 0-201-61586-X.
>   
> +.. note::
> +
> +    《程序设计实践》
> +    作者：[美] Brian W. Kernighan / [美] Rob Pike
> +    出版社：机械工业出版社，2005
> +    ISBN：9787111091578
> +
> +    《程序设计实践》
> +    作者：[美] Brian W. Kernighan / Rob Pike
> +    译者：裘宗燕
> +    出版社：机械工业出版社，2000
> +    ISBN：9787111075738
> +
>   GNU 手册 - 遵循 K&R 标准和此文本 - cpp, gcc, gcc internals and indent,
>   都可以从 https://www.gnu.org/manual/ 找到
>   
>   WG14 是 C 语言的国际标准化工作组，URL: http://www.open-std.org/JTC1/SC22/WG14/
>   
> -Kernel process/coding-style.rst，作者 greg@kroah.com 发表于 OLS 2002：
> +内核文档 Documentation/process/coding-style.rst，
> +作者 greg@kroah.com 发表于 OLS 2002：
>   http://www.kroah.com/linux/talks/ols_2002_kernel_codingstyle_talk/html/
>
> base-commit: e1a0cc8865e3152e9fe43c6436b44e64c0359dfb

