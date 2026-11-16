Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.243.161.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794840116;
	b=AGO7pZvLOH6Kj19Wu6w//qGwvysU5wSH9NyGAYFnWlsinQQP8QRx++cjmykKqGVn4oDX
	 DpiAs6XuUgKGYdBFfHBDiXph+3jlA0eeJljO00bb4617lyHJeSnEuNpC0NQfc5ZEpMsJT
	 IoOSBXjDs/+2gJMyhARJ8fyt/s0e75g+lEoBSsOd+xhIJoKxmOwzmulvJ2Gjdv+PlINZM
	 3XAOUyuYbL28OcUjKFfoOtNGWv+EjNCONUYNRR4T1RlKJv2BKcI88LcPPEP/p8rrjHuZH
	 z9NhWDvHC6Wrp0tgvup1BnpX4ON9Y9s1rPUCYN0YqDyd7xhYXYcO5s526GV0RrYsmPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794840116;
	h=DMARC-Filter:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=7PqrtJjum31H+I43w2fuhNsyhcL5At73YQdMT+XNoDY=;
	b=W3fRg82pb56EEPvVG/FQD5sbVb/l9uHvJDKznZwfjBhjcxwAI4X+pC5n/bLvN/DPXK4K
	 BpOqnZKaDo7v+KXsN6jqg0QxNtqjUYKvR9mLeLe9s3mdXwb8Wq8zA0fVEUfLHGN6Qz/1/
	 2By0xWwcb8Uzt4e8EvG5gVoVbnG2OPV/xYbDT7R/Q1ED3FcUKL1l2mLuAHi02Vm/Ob+6F
	 mGHq/KMtIcBT2JeBRllY5sRddHrSwLX7hAme/n/S9TS2+cS9zRaHX7bwshO8Y5UbwSEjP
	 yAoYE0D08bOk9V7pGecm+hiMoUihwSY6z05SC6sNku4NABDeo/M9OryGafbeMl1s2Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hust.edu.cn;
	spf=pass smtp.mailfrom=hust.edu.cn;
	arc=none smtp.remote-ip=162.243.161.220
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87AAA606A31C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 14:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87AAA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with UTF8SMTP id IAEQrMDGi2crFvtqtfJcAA--.12716S2;
	Mon, 16 Nov 2026 22:41:47 +0800 (CST)
Received: from [100.81.40.43] (unknown [10.12.191.55])
	by gateway (Coremail) with SMTP id _____wA3MMslFvtqNYgcAA--.33382S2;
	Mon, 16 Nov 2026 22:41:41 +0800 (CST)
Message-ID: <6a11fb6c-53f8-4804-859c-dcdb28ddce4b@hust.edu.cn>
Date: Mon, 16 Nov 2026 22:41:41 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: Add deprecated translation
To: YikunWei <YikunWei@126.com>, alexs@kernel.org
Cc: si.yanteng@linux.dev, linux-doc@vger.kernel.org
References: <20261113122844.24838-1-YikunWei@126.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20261113122844.24838-1-YikunWei@126.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:IAEQrMDGi2crFvtqtfJcAA--.12716S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvAXoWftw4UKF43Zr15JF4rurWkCrg_yoW8uw4kJo
	WavrWY9r4xuw45JFWYy397Jr47WF1rJF47JrZruFnI934UKa48Zan3Aa1rGFWrArs0vFs8
	XFyUtayrZ3WxAFsxn29KB7ZKAUJUUUU7529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UjIYCTnIWjp_UUUOf7k0a2IF6w1UM7kC6x804xWl1xkIjI8I6I8E6xAIw20EY4v2
	0xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7
	IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xv
	wVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxV
	WUXVWUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY
	07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI
	0_Gr1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4U
	JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK6svPMxAIw28IcxkI7V
	AKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCF
	I7km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
	106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
	xVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
	xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
	Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jhTmDUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/


On 11/13/26 8:28 PM, YikunWei wrote:
> From: Yikun Wei <YikunWei@126.com>
>
> Translate Documentation/process/deprecated.rst into Chinese.
>
> Update translations/zh_CN/process/index.rst to reference the new
> translation and drop the item from the TODOLIST.
>
> Signed-off-by: Yikun Wei <YikunWei@126.com>
> ---
>   .../translations/zh_CN/process/deprecated.rst | 361 ++++++++++++++++++
>   .../translations/zh_CN/process/index.rst      |   2 +-
>   2 files changed, 362 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/process/deprecated.rst
>
> diff --git a/Documentation/translations/zh_CN/process/deprecated.rst b/Documentation/translations/zh_CN/process/deprecated.rst
> new file mode 100644
> index 000000000000..1f1f19871481
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/process/deprecated.rst
> @@ -0,0 +1,361 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/process/deprecated.rst
> +
> +:翻译:
> +
> + Yikun Wei <YikunWei@126.com>
> +
> +.. _cn_deprecated:
> +
> +=====================================================================
> +已弃用的接口、语言特性、属性与约定
> +=====================================================================
> +
> +在一个理想的世界里，我们可以在单个开发周期内把某个已弃用 API 的所有用法都转换成
> +新 API，并彻底移除旧 API。然而，由于内核规模庞大、维护者层级分明，再加上时机问题，
> +这类转换往往无法一次性完成。这意味着，在旧用法被移除的同时，新的用法可能又悄悄混
> +进内核，结果只是让移除该 API 的工作量越积越多。为了让开发者了解哪些东西已被弃用、
> +以及为什么被弃用，我们整理出这份清单，当有人想把被弃用的东西加进内核时，就可以
> +拿它来作为依据。
> +
> +__deprecated
> +------------
> +
> +尽管这个属性在视觉上确实能将一个接口标记为“已弃用”，但它已经不会再在构建过程中
> +产生警告了，原因在于内核长期以来的目标之一就是“零警告构建”，而实际上并没有人在
> +真正着手移除这些被弃用的接口。虽然使用 __deprecated 可以方便地在头文件里标注某个
> +旧接口，但这并不是完整的解决方案。这类接口要么必须被彻底从内核中移除，要么应当被
> +写进本文件，以劝阻他人在将来继续使用它们。
> +
> +BUG() 与 BUG_ON()
> +-----------------
> +
> +请改用 WARN() 与 WARN_ON()，并尽可能优雅地处理这种“不可能发生”的错误状况。BUG()
> +系列接口最初被设计成一种“绝不该出现”的断言，用来“安全地”干掉某个内核线程，但
> +事实证明它们风险实在太大。（比如：“锁到底该按什么顺序释放？各种状态是否已经恢复？”
> +）使用 BUG() 极其常见地会让系统变得不稳定，甚至彻底崩溃，从而让人无从调试，连一份
> +像样的崩溃报告都拿不到。Linus 对这一点有着 `非常强烈
> +<https://lore.kernel.org/lkml/CA+55aFy6jNLsywVYdGp83AMrXBo_P-pkjkphPGrO=82SPKCpLQ@mail.gmail.com/>`_
> +的 `看法
> +<https://lore.kernel.org/lkml/CAHk-=whDHsbK3HTOpTF=ue_o04onRwTEaK_ZoJp_fjbqq4+=Jw@mail.gmail.com/>`_。
> +
> +请注意，WARN() 系列只应当用于“预期不可达”的情形。如果你想对“可达但不希望出现”
> +的情况发出警告，请改用 pr_warn() 系列函数。系统管理员可能设置了 *panic_on_warn*
> +这个 sysctl，以确保系统在遇到“不可达”状况时不会继续运行。（例如，参见类似 `这个
> +提交
> +<https://git.kernel.org/linus/d4689846881d160a4d12a514e991a740bcb5d65a>`_ 中的改动。）
> +
> +分配器参数里的明文算术
> +----------------------
> +
> +动态尺寸的计算（尤其是乘法）不应当直接写在内存分配器（或类似函数）的参数里，因为
> +存在溢出的风险。这可能导致数值回绕，从而分配出比调用者预期更小的内存块。使用这类
> +分配结果，可能造成堆内存的线性溢出以及其他各种异常行为。（唯一的例外是字面值，此时
> +编译器可以在可能溢出时发出警告。不过即便如此，推荐的做法仍是按下面建议的方式重构
> +代码，以避免这种明文算术。）
> +
> +例如，不要像下面这样把 ``count * size`` 当作参数使用::
> +
> +	foo = kmalloc(count * size, GFP_KERNEL);
> +
> +应当改用分配器的“双因子”形式::
> +
> +	foo = kmalloc_array(count, size, GFP_KERNEL);
> +
> +具体来说，kmalloc() 可以替换为 kmalloc_array()，而 kzalloc() 可以替换为 kcalloc()。
> +
> +如果没有对应的双因子形式，则应当使用“溢出饱和”辅助函数::
> +
> +	bar = dma_alloc_coherent(dev, array_size(count, size), &dma, GFP_KERNEL);
> +
> +另一个应当避免的常见情形，是计算“末尾带有其他结构体数组”的结构体大小，例如::
> +
> +	header = kzalloc(sizeof(*header) + count * sizeof(*header->item),
> +			 GFP_KERNEL);
> +
> +应当改用辅助函数::
> +
> +	header = kzalloc(struct_size(header, item, count), GFP_KERNEL);
> +
> +.. note:: 如果你在一个“以零长度数组或单元素数组作为末尾成员”的结构体上使用
> +        struct_size()，请重构这种数组用法，改用 `灵活数组成员
> +        <#zero-length-and-one-element-arrays>`_。
> +
> +对于其他计算，请组合使用 size_mul()、size_add() 与 size_sub() 这几个辅助函数。
> +例如，对于下面这种情况::
> +
> +	foo = krealloc(current_size + chunk_size * (count - 3), GFP_KERNEL);
> +
> +应当改用辅助函数::
> +
> +	foo = krealloc(size_add(current_size,
> +				size_mul(chunk_size,
> +					 size_sub(count, 3))), GFP_KERNEL);
> +
> +更多细节，另请参考 array3_size() 与 flex_array_size()，以及相关的
> +check_mul_overflow()、check_add_overflow()、check_sub_overflow() 与
> +check_shl_overflow() 这一系列函数。
> +
> +simple_strtol()、simple_strtoll()、simple_strtoul()、simple_strtoull()
> +-------------------------------------------------------------------
> +
> +simple_strtol()、simple_strtoll()、simple_strtoul() 与 simple_strtoull()
> +这几个函数会明确地忽略溢出，这可能给调用者带来意料之外的结果。对应的
> +kstrtol()、kstrtoll()、kstrtoul() 与 kstrtoull() 通常才是正确的替代函数，不过要
> +注意，它们要求字符串必须以 NUL 或换行符结尾。
> +
> +strcpy()
> +--------
> +
> +strcpy() 不会对目标缓冲区做边界检查。这可能导致缓冲区末尾之后的线性溢出，从而引发
> +各种异常行为。虽然开启 `CONFIG_FORTIFY_SOURCE=y` 以及使用各种编译器标志有助于降低
> +使用该函数的风险，但没有理由再引入它的新用法。安全的替代函数是 strscpy()，不过对于
> +原先使用了 strcpy() 返回值的地方要格外小心，因为 strscpy() 返回的不是指向目标的
> +指针，而是已拷贝的非 NUL 字节数（或者在发生截断时返回负的 errno）。
> +
> +strncpy()
> +---------
> +
> +strncpy() 已经从内核中移除，所有原先的调用者都已被迁移到更安全的替代方案。
> +
> +strncpy() 无法保证目标缓冲区以 NUL 结尾，这会导致线性读溢出以及其他异常行为。它
> +还会无条件地把目标填充 NUL，对于只使用以 NUL 结尾字符串的调用者而言，这是一种无谓
> +的性能损耗。由于这些行为各不相同，它成了一套含义模糊的 API，让人难以判断作者在做
> +这次拷贝时真正的意图是什么。
> +
> +strncpy() 的替代方案包括：
> +
> +- strscpy()：当目标必须是以 NUL 结尾时使用。
> +- strscpy_pad()：当目标必须是以 NUL 结尾，且需要零填充时（例如跨越特权边界的
> +  结构体）。
> +- memtostr()：当源是定宽、非 NUL 结尾，而目标是 NUL 结尾时使用（源需带有
> +  ``__nonstring`` 属性）。
> +- memtostr_pad()：同上，但进行零填充。
> +- strtomem()：当目标是定宽、非 NUL 结尾时使用（目标需带有 ``__nonstring`` 属性）。
> +- strtomem_pad()：当目标非 NUL 结尾、且还需要零填充时使用。
> +- memcpy_and_pad()：当目标大小是运行时值、且源可能未以 NUL 结尾的有界拷贝时使用。
> +
> +strlcpy()
> +---------
> +
> +strlcpy() 会先读取整个源缓冲区（因为它的返回值要与 strlen() 保持一致）。这种读取
> +可能会超出目标的大小限制。这既低效，又可能在源字符串未以 NUL 结尾时导致线性读溢出。
> +安全的替代函数是 strscpy()，不过对于原先使用了 strlcpy() 返回值的地方要格外小心，
> +因为 strscpy() 在发生截断时会返回负的 errno。
> +
> +%p 格式说明符
> +-------------
> +
> +传统上，在格式字符串里使用 "%p" 会导致在 dmesg、proc、sysfs 等地方频繁暴露地址，
> +从而形成漏洞。我们没有任由这些漏洞被利用，而是把内核里所有的 "%p" 都改成打印成
> +哈希后的值，使其无法被用于定位地址。不应再往内核里添加新的 "%p" 用法。对于文本地址，
> +使用 "%pS" 可能更合适，因为它会输出更有用的符号名而非地址。除此之外，绝大多数情况
> +干脆就不要再加 "%p"。
> +
> +转述 Linus 目前给出的 `指引
> +<https://lore.kernel.org/lkml/CA+55aFwQEd_d40g4mUCSsVRZzrFPUJt74vc6PPpb675hYNXcKw@mail.gmail.com/>`_：
> +
> +- 如果哈希后的 "%p" 值毫无意义，不妨自问这个指针本身是否重要。也许它本就该被彻底
> +  删掉？
> +- 如果你确实认为真实的指针值很重要，那为什么某些系统状态或用户特权级别会被视为
> +  “特殊”？如果你觉得自己能在注释和提交日志里给出足够充分的理由、经得起 Linus 的
> +  审视，那么或许可以使用 "%px"，同时务必确保你拥有合理的权限控制。
> +
> +如果你在调试时遇到 "%p" 哈希造成的问题，可以在启动时临时加上调试参数
> +"`no_hash_pointers
> +<https://git.kernel.org/linus/5ead723a20e0447bc7db33dc3070b420e5f80aa6>`_"。
> +
> +变长数组（VLA）
> +--------------
> +
> +在栈上使用变长数组（VLA）会比使用静态大小的栈数组产生差得多的机器码。尽管仅凭这些
> +不小的 `性能问题
> +<https://git.kernel.org/linus/02361bc77888>`_ 就足以成为消除 VLA 的理由，但它们
> +同时也是安全风险。栈数组的动态增长可能会超出栈段中剩余的内存。这可能导致崩溃、可能
> +覆盖栈末尾的敏感内容（在未开启 `CONFIG_THREAD_INFO_IN_TASK=y` 构建时），或者覆盖
> +栈相邻的内存（在未开启 `CONFIG_VMAP_STACK=y` 构建时）。
> +
> +switch case 的隐式贯穿（fall-through）
> +-------------------------------------
> +
> +C 语言允许在 switch 的某个 case 末尾缺少 "break" 语句时，自然地“贯穿”到下一个
> +case。然而，这会在代码中引入歧义，因为那个缺失的 break 究竟是有意为之还是 bug，
> +并不总是清楚。例如，单看代码并不显然 `STATE_ONE` 是否是有意设计为贯穿进入
> +`STATE_TWO`::
> +
> +	switch (value) {
> +	case STATE_ONE:
> +		do_something();
> +	case STATE_TWO:
> +		do_other();
> +		break;
> +	default:
> +		WARN("unknown state");
> +	}
> +
> +由于历史上出现过一长串因缺少 "break" 语句 `而导致的缺陷
> +<https://cwe.mitre.org/data/definitions/484.html>`_，我们不再允许隐式的贯穿
> +（fall-through）。为了标识那些有意为之的贯穿，我们采纳了一个伪关键字宏
> +"fallthrough"，它会展开为 gcc 的扩展 `__attribute__((__fallthrough__))
> +<https://gcc.gnu.org/onlinedocs/gcc/Statement-Attributes.html>`_。（当 C17/C18 的
> +``[[fallthrough]]`` 语法被 C 编译器、静态分析器和 IDE 更广泛地支持后，我们就可以
> +把宏这个伪关键字切换成那种语法了。）
> +
> +所有的 switch/case 代码块必须以以下几种之一结尾：
> +
> +* break;
> +* fallthrough;
> +* continue;
> +* goto <label>;
> +* return [expression];
> +
> +零长度数组与单元素数组
> +----------------------
> +
> +内核中经常需要一种方式，用来声明“结构体末尾带有动态大小元素集合”。这类情形，内核
> +代码应当始终使用 `"灵活数组成员"
> +<https://en.wikipedia.org/wiki/Flexible_array_member>`_。较早的“单元素数组”或
> +“零长度数组”写法不应再被使用。
> +
> +在较早的 C 代码里，动态大小的末尾元素是通过在结构体末尾声明一个单元素数组来实现的::
> +
> +        struct something {
> +                size_t count;
> +                struct foo items[1];
> +        };
> +
> +这导致借助 sizeof() 得出的大小计算十分脆弱（必须先减掉那个末尾单元素的大小，才能
> +得到“头部”的正确尺寸）。后来引入了 GNU C 扩展，允许使用零长度数组，以避免这类尺寸
> +问题::
> +
> +        struct something {
> +                size_t count;
> +                struct foo items[0];
> +        };
> +
> +但这又带来了别的问题，而且也没有解决两种写法共有的某些毛病，比如无法察觉这种数组
> +在什么时候被意外地用在了结构体“非末尾”的位置（这可能直接发生，也可能在该结构体被
> +放进联合体、结构体的结构体等情况下发生）。
> +
> +C99 引入了“灵活数组成员”，其数组声明完全不带数字尺寸::
> +
> +        struct something {
> +                size_t count;
> +                struct foo items[];
> +        };
> +
> +这正是内核期望用来声明动态大小末尾元素的方式。它让编译器能在灵活数组没有出现在
> +结构体最后时直接报错，从而有助于避免某些 `未定义行为
> +<https://git.kernel.org/linus/76497732932f15e7323dc805e8ea8dc11bb587cf>`_ 的 bug 被
> +无意中引入代码库。它还能让编译器正确分析数组尺寸（通过 sizeof()、`CONFIG_FORTIFY_SOURCE`
> +与 `CONFIG_UBSAN_BOUNDS`）。举例来说，没有任何机制会警告我们：下面这种对零长度数组
> +使用 sizeof() 运算符，结果永远为零::
> +
> +        struct something {
> +                size_t count;
> +                struct foo items[0];
> +        };
> +
> +        struct something *instance;
> +
> +        instance = kmalloc(struct_size(instance, items, count), GFP_KERNEL);
> +        instance->count = count;
> +
> +        size = sizeof(instance->items) * instance->count;
> +        memcpy(instance->items, source, size);
> +
> +在上面代码的最后一行，``size`` 的结果其实是 ``zero``（零），而人们往往以为它代表
> +刚刚为末尾数组 ``items`` 动态分配的那段内存的总字节数。这个问题有 `示例一
> +<https://git.kernel.org/linus/f2cd32a443da694ac4e28fbf4ac6f9d5cc63a539>`_、
> +`示例二
> +<https://git.kernel.org/linus/ab91c2a89f86be2898cee208d492816ec238b2cf>`_ 两个例子。
> +相反，灵活数组成员具有“不完整类型”，因此 sizeof() 运算符不能作用于它，于是任何对此
> +类运算符的误用都会在构建时被立即发现。
> +
> +关于单元素数组，必须清楚地认识到：这类数组占用的空间至少等同于该类型的一个对象，
> +因此它会增大外围结构体的尺寸。每当人们想要计算“含有此类数组作为成员的结构体”所需
> +分配的动态内存总大小时，都很容易出错::
> +
> +        struct something {
> +                size_t count;
> +                struct foo items[1];
> +        };
> +
> +        struct something *instance;
> +
> +        instance = kmalloc(struct_size(instance, items, count - 1), GFP_KERNEL);
> +        instance->count = count;
> +
> +        size = sizeof(instance->items) * instance->count;
> +        memcpy(instance->items, source, size);
> +
> +在上面的例子里，使用 struct_size() 辅助函数时必须记得计算 ``count - 1``，否则就会
> +——无意中——为多出来的一个 ``items`` 对象分配内存。最干净、最少出错的写法，是使用
> +灵活数组成员，配合 struct_size() 与 flex_array_size() 辅助函数::
> +
> +        struct something {
> +                size_t count;
> +                struct foo items[];
> +        };
> +
> +        struct something *instance;
> +
> +        instance = kmalloc(struct_size(instance, items, count), GFP_KERNEL);
> +        instance->count = count;
> +
> +        memcpy(instance->items, source, flex_array_size(instance, items, instance->count));
> +
> +有两种特殊情况在替换时需要用到 DECLARE_FLEX_ARRAY() 辅助宏。（注意，在 UAPI 头文件中
> +它名为 __DECLARE_FLEX_ARRAY()。）这两种情况是：灵活数组要么单独存在于某个结构体中，
> +要么作为联合体的一部分。这两点在 C99 规范里是被禁止的，但其实并没有什么技术上的理由
> +（从这类数组在这些地方既有的使用、以及 DECLARE_FLEX_ARRAY() 所采用的变通写法中都
> +可以看出）。例如，要把下面这样改写::
> +
> +	struct something {
> +		...
> +		union {
> +			struct type1 one[0];
> +			struct type2 two[0];
> +		};
> +	};
> +
> +就必须使用辅助宏::
> +
> +	struct something {
> +		...
> +		union {
> +			DECLARE_FLEX_ARRAY(struct type1, one);
> +			DECLARE_FLEX_ARRAY(struct type2, two);
> +		};
> +	};
> +
> +结构体对象的明文 kmalloc 赋值
> +----------------------------
> +
> +直接手写 kmalloc() 系列的内存分配赋值，会妨碍内核（以及编译器）检查被赋值变量的类型，
> +从而限制那些有助于对齐、回绕防护以及额外加固的相关内省能力。kmalloc_obj() 系列宏
> +提供了这种内省能力，可用于单对象、数组对象以及灵活对象的常见分配写法。例如，下面这
> +些手写赋值::
> +
> +	ptr = kmalloc(sizeof(*ptr), gfp);
> +	ptr = kzalloc(sizeof(*ptr), gfp);
> +	ptr = kmalloc_array(count, sizeof(*ptr), gfp);
> +	ptr = kcalloc(count, sizeof(*ptr), gfp);
> +	ptr = kmalloc(struct_size(ptr, flex_member, count), gfp);
> +	ptr = kmalloc(sizeof(struct foo), gfp);
> +
> +分别改写为::
> +
> +	ptr = kmalloc_obj(*ptr [, gfp] );
> +	ptr = kzalloc_obj(*ptr [, gfp] );
> +	ptr = kmalloc_objs(*ptr, count [, gfp] );
> +	ptr = kzalloc_objs(*ptr, count [, gfp] );
> +	ptr = kmalloc_flex(*ptr, flex_member, count [, gfp] );
> +	__auto_type ptr = kmalloc_obj(struct foo [, gfp] );
> +
> +参数 gfp 是可选的，默认值为 GFP_KERNEL。如果 ``ptr->flex_member`` 标注了
> +``__counted_by()``，那么当 ``count`` 大于与 ``flex_member`` 关联的计数成员所能表示的
> +最大值时，该分配会自动失败。
> diff --git a/Documentation/translations/zh_CN/process/index.rst b/Documentation/translations/zh_CN/process/index.rst
> index 4fbc2c4eb605..cd02cce21bf0 100644
> --- a/Documentation/translations/zh_CN/process/index.rst
> +++ b/Documentation/translations/zh_CN/process/index.rst
> @@ -67,12 +67,12 @@ TODOLIST:
>      submit-checklist
>      researcher-guidelines
>      contribution-maturity-model

This translation is done by your another patch.

In such situation, I cannot git apply it in my docs-next tree. Next 
time, please make them as a patchset other than two separate patches.

In other words, these two translation patches has dependency.

Dongliang Mu

> +   deprecated
>   
>   TODOLIST:
>   
>   * changes
>   * kernel-docs
> -* deprecated
>   * maintainers
>   
>   

