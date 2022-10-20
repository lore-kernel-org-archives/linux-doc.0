Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB6C8C43219
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 09:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbiJTJNb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 05:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbiJTJN3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 05:13:29 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B16F91A2097
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 02:13:26 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8Bx3Ng1EVFjyf8AAA--.5041S3;
        Thu, 20 Oct 2022 17:13:25 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxb+IzEVFjUtYBAA--.7706S3;
        Thu, 20 Oct 2022 17:13:24 +0800 (CST)
Message-ID: <abae6953-3547-1f74-48b7-928b614121c0@loongson.cn>
Date:   Thu, 20 Oct 2022 17:13:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH V2 1/3] docs/zh_CN: core-api: Add this_cpu_ops Chinese
 translation
Content-Language: en-US
To:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org
References: <cover.1666171735.git.zhoubinbin@loongson.cn>
 <f9a8cb188bc35811d7f074f9d5f607f5a48c6503.1666171735.git.zhoubinbin@loongson.cn>
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <f9a8cb188bc35811d7f074f9d5f607f5a48c6503.1666171735.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxb+IzEVFjUtYBAA--.7706S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvAXoWfGr4UZF47Xw13uw13tF48tFb_yoW8GryxWo
        Z8ur4a9r4qkF45t3s8Jw4UJw4DtF15CryxCrZrKFsIgw17WF1F93W0yw43KayruFW5KF13
        GF1Iva4ag3WxZa45n29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
        J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
        UUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s
        0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
        ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr0_GcWl
        e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
        IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r4j6F4U
        McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
        AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
        Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwI
        xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
        JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcV
        C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8vApUUUUUU==
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 10/19/22 17:32, Binbin Zhou wrote:
> Translate core-api/this_cpu_ops.rst into Chinese.
>
> Last English version used:
>
> commit c9b54d6f362c ("docs: move other kAPI documents to core-api").
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Yanteng Si <siyanteng@loongson.cn>


Thanks,

Yanteng

> ---
>   .../translations/zh_CN/core-api/index.rst     |   2 +-
>   .../zh_CN/core-api/this_cpu_ops.rst           | 285 ++++++++++++++++++
>   2 files changed, 286 insertions(+), 1 deletion(-)
>   create mode 100644 Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
>
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index 37756d240b5e..21d0b25bc580 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -48,12 +48,12 @@
>      circular-buffers
>      generic-radix-tree
>      packing
> +   this_cpu_ops
>   
>   Todolist:
>   
>   
>   
> -   this_cpu_ops
>      timekeeping
>      errseq
>   
> diff --git a/Documentation/translations/zh_CN/core-api/this_cpu_ops.rst b/Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
> new file mode 100644
> index 000000000000..bea5ee8eb8a0
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
> @@ -0,0 +1,285 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/this_cpu_ops.rst
> +
> +:翻译:
> +
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +:校译:
> +
> + 吴想成 Wu Xiangcheng <bobwxc@email.cn>
> +
> +============
> +this_cpu操作
> +============
> +
> +:作者: Christoph Lameter, 2014年8月4日
> +:作者: Pranith Kumar, 2014年8月2日
> +
> +this_cpu操作是一种优化访问与当前执行处理器相关的每CPU变量的方法。这是通过使用段寄
> +存器（或专用寄存器，cpu在其中永久存储特定处理器的每CPU区域的起始）来完成的。
> +
> +this_cpu操作将每CPU变量的偏移量添加到处理器特定的每CPU基址上，并将该操作编码到对
> +每CPU变量进行操作的指令中。
> +
> +这意味着在偏移量的计算和对数据的操作之间不存在原子性问题。因此，没有必要禁用抢占
> +或中断来确保处理器在计算地址和数据操作之间不被改变。
> +
> +读取-修改-写入操作特别值得关注。通常处理器具有特殊的低延迟指令，可以在没有典型同
> +步开销的情况下运行，但仍提供某种宽松的原子性保证。例如，x86可以执行RMW（读取，
> +修改，写入）指令，如同inc/dec/cmpxchg，而无需锁前缀和相关的延迟损失。
> +
> +对没有锁前缀的变量的访问是不同步的，也不需要同步，因为我们处理的是当前执行的处理
> +器所特有的每CPU数据。只有当前的处理器可以访问该变量，因此系统中的其他处理器不存在
> +并发性问题。
> +
> +请注意，远程处理器对每CPU区域的访问是特殊情况，可能会影响通过 ``this_cpu_*`` 的本
> +地RMW操作的性能和正确性（远程写操作）。
> +
> +this_cpu操作的主要用途是优化计数器操作。
> +
> +定义了以下具有隐含抢占保护的this_cpu()操作。可以使用这些操作而不用担心抢占和中断::
> +
> +	this_cpu_read(pcp)
> +	this_cpu_write(pcp, val)
> +	this_cpu_add(pcp, val)
> +	this_cpu_and(pcp, val)
> +	this_cpu_or(pcp, val)
> +	this_cpu_add_return(pcp, val)
> +	this_cpu_xchg(pcp, nval)
> +	this_cpu_cmpxchg(pcp, oval, nval)
> +	this_cpu_cmpxchg_double(pcp1, pcp2, oval1, oval2, nval1, nval2)
> +	this_cpu_sub(pcp, val)
> +	this_cpu_inc(pcp)
> +	this_cpu_dec(pcp)
> +	this_cpu_sub_return(pcp, val)
> +	this_cpu_inc_return(pcp)
> +	this_cpu_dec_return(pcp)
> +
> +
> +this_cpu操作的内部工作
> +----------------------
> +
> +在x86上，fs:或gs:段寄存器包含每CPU区域的基址。这样就可以简单地使用段覆盖，将每CPU
> +相对地址重定位到处理器适当的每CPU区域。所以对每CPU基址的重定位是通过段寄存器前缀
> +在指令中编码完成的。
> +
> +例如::
> +
> +	DEFINE_PER_CPU(int, x);
> +	int z;
> +
> +	z = this_cpu_read(x);
> +
> +产生的单指令为::
> +
> +	mov ax, gs:[x]
> +
> +而不是像每CPU操作那样，先是一系列的地址计算，然后从该地址获取。在this_cpu_ops之前，
> +这样的序列还需要先禁用/启用抢占功能，以防止内核在计算过程中将线程移动到不同的处理
> +器上。
> +
> +请思考下面this_cpu操作::
> +
> +	this_cpu_inc(x)
> +
> +这将产生如下单指令（无锁前缀！）::
> +
> +	inc gs:[x]
> +
> +而不是在没有段寄存器的情况下所需要的以下操作::
> +
> +	int *y;
> +	int cpu;
> +
> +	cpu = get_cpu();
> +	y = per_cpu_ptr(&x, cpu);
> +	(*y)++;
> +	put_cpu();
> +
> +请注意，这些操作只能用于为特定处理器保留的每CPU数据。如果不在上下文代码中禁用抢占，
> +``this_cpu_inc()`` 将仅保证每CPU的某一个计数器被正确地递增，但不能保证操作系统不
> +会在this_cpu指令执行的前后直接移动该进程。一般来说，这意味着每个处理器的单个计数
> +器的值是没有意义的。所有每CPU计数器的总和才是唯一有意义的值。
> +
> +每CPU变量的使用是出于性能的考虑。如果多个处理器同时处理相同的代码路径，可以避免缓
> +存行跳转。每个处理器都有自己的每CPU变量，因此不会发生并发缓存行更新。为这种优化必
> +须付出的代价是，当需要计数器的值时要将每CPU计数器相加。
> +
> +
> +特殊的操作
> +----------
> +
> +::
> +
> +	y = this_cpu_ptr(&x)
> +
> +使用每CPU变量的偏移量(&x!)，并返回属于当前执行处理器的每CPU变量的地址。
> +``this_cpu_ptr`` 避免了通用 ``get_cpu``/``put_cpu`` 序列所需的多个步骤。没有可用
> +的处理器编号。相反，本地每CPU区域的偏移量只是简单地添加到每CPU偏移量上。
> +
> +请注意，这个操作通常是在抢占被禁用后再在代码段中使用。然后该指针用来访问临界区中
> +的本地每CPU数据。当重新启用抢占时，此指针通常不再有用，因为它可能不再指向当前处理
> +器的每CPU数据。
> +
> +每CPU变量和偏移量
> +-----------------
> +
> +每CPU变量相对于每CPU区域的起始点是有偏移的。它们没有地址，尽管代码里看起来像有一
> +样。不能直接对偏移量解引用，必须用处理器每CPU区域基指针加上偏移量，以构成有效地址。
> +
> +因此，在每CPU操作的上下文之外使用x或&x是无效的，这种行为通常会被当作一个空指针的
> +解引用来处理。
> +
> +::
> +
> +	DEFINE_PER_CPU(int, x);
> +
> +在每CPU操作的上下文中，上面表达式说明x是一个每CPU变量。大多数this_cpu操作都需要一
> +个cpu变量。
> +
> +::
> +
> +	int __percpu *p = &x;
> +
> +&x和p是每CPU变量的偏移量。 ``this_cpu_ptr()`` 使用每CPU变量的偏移量，这让它看起来
> +有点奇怪。
> +
> +
> +每CPU结构体字段的操作
> +---------------------
> +
> +假设我们有一个每CPU结构::
> +
> +	struct s {
> +		int n,m;
> +	};
> +
> +	DEFINE_PER_CPU(struct s, p);
> +
> +
> +这些字段的操作非常简单::
> +
> +	this_cpu_inc(p.m)
> +
> +	z = this_cpu_cmpxchg(p.m, 0, 1);
> +
> +
> +如果我们有一个相对于结构体s的偏移量::
> +
> +	struct s __percpu *ps = &p;
> +
> +	this_cpu_dec(ps->m);
> +
> +	z = this_cpu_inc_return(ps->n);
> +
> +
> +如果我们后面不使用 ``this_cpu ops`` 来操作字段，则指针的计算可能需要使用
> +``this_cpu_ptr()``::
> +
> +	struct s *pp;
> +
> +	pp = this_cpu_ptr(&p);
> +
> +	pp->m--;
> +
> +	z = pp->n++;
> +
> +
> +this_cpu ops的变体
> +------------------
> +
> +this_cpu的操作是中断安全的。一些架构不支持这些每CPU的本地操作。在这种情况下，该操
> +作必须被禁用中断的代码所取代，然后做那些保证是原子的操作，再重新启用中断。当然这
> +样做是很昂贵的。如果有其他原因导致调度器不能改变我们正在执行的处理器，那么就没有
> +理由禁用中断了。为此，我们提供了以下__this_cpu操作。
> +
> +这些操作不能保证并发中断或抢占。如果在中断上下文中不使用每CPU变量并且调度程序无法
> +抢占，那么它们是安全的。如果在操作进行时仍有中断发生，并且中断也修改了变量，则无
> +法保证RMW操作是安全的::
> +
> +	__this_cpu_read(pcp)
> +	__this_cpu_write(pcp, val)
> +	__this_cpu_add(pcp, val)
> +	__this_cpu_and(pcp, val)
> +	__this_cpu_or(pcp, val)
> +	__this_cpu_add_return(pcp, val)
> +	__this_cpu_xchg(pcp, nval)
> +	__this_cpu_cmpxchg(pcp, oval, nval)
> +	__this_cpu_cmpxchg_double(pcp1, pcp2, oval1, oval2, nval1, nval2)
> +	__this_cpu_sub(pcp, val)
> +	__this_cpu_inc(pcp)
> +	__this_cpu_dec(pcp)
> +	__this_cpu_sub_return(pcp, val)
> +	__this_cpu_inc_return(pcp)
> +	__this_cpu_dec_return(pcp)
> +
> +
> +将增加x，并且不会回退到在无法通过地址重定位和同一指令中的读取-修改-写入操作实现原
> +子性的平台上禁用中断的代码。
> +
> +
> +&this_cpu_ptr(pp)->n 对比 this_cpu_ptr(&pp->n)
> +----------------------------------------------
> +
> +第一个操作使用偏移量并形成一个地址，然后再加上n字段的偏移量。这可能会导致编译器产
> +生两条加法指令。
> +
> +第二个操作先加上两个偏移量，然后进行重定位。恕我直言，第二种形式看起来更干净，而
> +且更容易与 ``()`` 结合。第二种形式也与 ``this_cpu_read()`` 和大家的使用方式一致。
> +
> +
> +远程访问每CPU数据
> +-----------------
> +
> +每CPU数据结构被设计为由一个CPU独占使用。如果您按预期使用变量，则 ``this_cpu_ops()``
> +保证是 ``原子的`` ，因为没有其他CPU可以访问这些数据结构。
> +
> +在某些特殊情况下，您可能需要远程访问每CPU数据结构。通常情况下，进行远程读访问是安
> +全的，这经常是为了统计计数器值。远程写访问可能会出现问题，因为this_cpu操作没有锁
> +语义。远程写可能会干扰this_cpu RMW操作。
> +
> +除非绝对必要，否则强烈建议不要对每CPU数据结构进行远程写访问。请考虑使用IPI来唤醒
> +远程CPU，并对其每CPU区域进行更新。
> +
> +要远程访问每CPU数据结构，通常使用 ``per_cpu_ptr()`` 函数::
> +
> +
> +	DEFINE_PER_CPU(struct data, datap);
> +
> +	struct data *p = per_cpu_ptr(&datap, cpu);
> +
> +这清楚地表明，我们正准备远程访问每CPU区域。
> +
> +您还可以执行以下操作以将datap偏移量转换为地址::
> +
> +	struct data *p = this_cpu_ptr(&datap);
> +
> +但是，将通过this_cpu_ptr计算的指针传递给其他cpu是不寻常的，应该避免。
> +
> +远程访问通常只用于读取另一个cpu的每CPU数据状态。由于this_cpu操作宽松的同步要求，
> +写访问可能会导致奇特的问题。
> +
> +下面的情况说明了写入操作的一些问题，由于两个每CPU变量共享一个缓存行，但宽松的同步
> +仅应用于更新缓存行的一个进程。
> +
> +考虑以下示例::
> +
> +
> +	struct test {
> +		atomic_t a;
> +		int b;
> +	};
> +
> +	DEFINE_PER_CPU(struct test, onecacheline);
> +
> +如果一个处理器远程更新字段 ``a`` ，而本地处理器将使用this_cpu ops来更新字段 ``b`` ，
> +会发生什么情况，这一点值得注意。应避免在同一缓存行内同时访问数据。此外，可能还需
> +要进行代价高昂的同步。在这种情况下，通常建议使用IPI，而不是远程写入另一个处理器的
> +每CPU区域。
> +
> +即使在远程写很少的情况下，请记住远程写将从最有可能访问它的处理器中逐出缓存行。如
> +果处理器唤醒时发现每CPU区域缺少本地缓存行，其性能和唤醒时间将受到影响。

