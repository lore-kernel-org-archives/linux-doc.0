Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1E7C43219
	for <linux-doc@archiver.kernel.org>; Sun, 16 Oct 2022 07:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbiJPHZi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 Oct 2022 03:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229648AbiJPHZg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 Oct 2022 03:25:36 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B0D6A3207B
        for <linux-doc@vger.kernel.org>; Sun, 16 Oct 2022 00:25:33 -0700 (PDT)
Received: from localhost.localdomain (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8DxPGvpsUtjHfMvAA--.43218S3;
        Sun, 16 Oct 2022 15:25:31 +0800 (CST)
From:   Binbin Zhou <zhoubinbin@loongson.cn>
To:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org,
        Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH 1/3] docs/zh_CN: core-api: Add this_cpu_ops Chinese translation
Date:   Sun, 16 Oct 2022 15:23:56 +0800
Message-Id: <1e90a5727b8d36508ad9db092b7d6ebefec07fcc.1665130536.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1665130536.git.zhoubinbin@loongson.cn>
References: <cover.1665130536.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8DxPGvpsUtjHfMvAA--.43218S3
X-Coremail-Antispam: 1UD129KBjvAXoWfGr48Cry5Kr1UKryktF1rXrb_yoW8JFWDuo
        W5ur1a9w1vkF45tFn8Ka1UXr17Zr1rCFyxGrs7Kr42g3W7WF15Z3W0k3W3GFyfuFWYkF1r
        J3WSgFy3u3W7Aa4Un29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
        AaLaJ3UjIYCTnIWjp_UUUYt7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20EY4v20xva
        j40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r18M28IrcIa0x
        kI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84AC
        jcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM2
        8EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8CwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
        IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUhiSLUUUUU=
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Translate core-api/this_cpu_ops.rst into Chinese.

Last English version used:

commit c9b54d6f362c ("docs: move other kAPI documents to core-api").

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
---
 .../translations/zh_CN/core-api/index.rst     |   2 +-
 .../zh_CN/core-api/this_cpu_ops.rst           | 281 ++++++++++++++++++
 2 files changed, 282 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/core-api/this_cpu_ops.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
index 37756d240b5e..21d0b25bc580 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -48,12 +48,12 @@
    circular-buffers
    generic-radix-tree
    packing
+   this_cpu_ops
 
 Todolist:
 
 
 
-   this_cpu_ops
    timekeeping
    errseq
 
diff --git a/Documentation/translations/zh_CN/core-api/this_cpu_ops.rst b/Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
new file mode 100644
index 000000000000..45e2bcb844cb
--- /dev/null
+++ b/Documentation/translations/zh_CN/core-api/this_cpu_ops.rst
@@ -0,0 +1,281 @@
+.. SPDX-License-Identifier: GPL-2.0+
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/core-api/this_cpu_ops.rst
+
+:翻译:
+
+ 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
+
+============
+this_cpu操作
+============
+
+:作者: Christoph Lameter, 2014年8月4日
+:作者: Pranith Kumar, 2014年8月2日
+
+this_cpu操作是一种优化访问与当前执行处理器相关的per cpu变量的方法。这是通过使用段
+寄存器（或专用寄存器，cpu在其中永久存储特定处理器的per cpu区域的起始）来完成的。
+
+this_cpu操作将per cpu变量的偏移量添加到处理器特定的per cpu基址上，并将该操作编码
+到对per cpu变量进行操作的指令中。
+
+这意味着在偏移量的计算和对数据的操作之间不存在原子性问题。因此，没有必要禁用抢占
+或中断来确保处理器在计算地址和数据操作之间不被改变。
+
+读取-修改-写入操作特别值得关注。通常处理器具有特殊的低延迟指令，可以在没有典型同
+步开销的情况下运行，但仍提供某种宽松的原子性保证。例如，x86可以执行RMW（读取，
+修改，写入）指令，如inc/dec/cmpxchg，而无需锁前缀和相关的延迟损失。
+
+对没有锁前缀的变量的访问是不同步的，也不需要同步，因为我们处理的是当前执行的处理
+器所特有的per cpu数据。只有当前的处理器可以访问该变量，因此系统中的其他处理器不存
+在并发性问题。
+
+请注意，远程处理器对per cpu区域的访问是特殊情况，可能会影响通过this_cpu_*的本地
+RMW操作的性能和正确性（远程写操作）。
+
+this_cpu操作的主要用途是优化计数器操作。
+
+定义了以下具有隐含抢占保护的this_cpu()操作。可以使用这些操作而不用担心抢占和中断::
+
+	this_cpu_read(pcp)
+	this_cpu_write(pcp, val)
+	this_cpu_add(pcp, val)
+	this_cpu_and(pcp, val)
+	this_cpu_or(pcp, val)
+	this_cpu_add_return(pcp, val)
+	this_cpu_xchg(pcp, nval)
+	this_cpu_cmpxchg(pcp, oval, nval)
+	this_cpu_cmpxchg_double(pcp1, pcp2, oval1, oval2, nval1, nval2)
+	this_cpu_sub(pcp, val)
+	this_cpu_inc(pcp)
+	this_cpu_dec(pcp)
+	this_cpu_sub_return(pcp, val)
+	this_cpu_inc_return(pcp)
+	this_cpu_dec_return(pcp)
+
+
+this_cpu操作的内部工作
+----------------------
+
+在x86上，fs:或gs:段寄存器包含per cpu区域的基址。这样就可以简单地使用段覆盖，
+将per cpu相对地址重定位到处理器适当的per cpu区域。所以对per cpu基址的重定位是通过
+段寄存器前缀在指令中编码完成的。
+
+例如::
+
+	DEFINE_PER_CPU(int, x);
+	int z;
+
+	z = this_cpu_read(x);
+
+单指令的结果::
+
+	mov ax, gs:[x]
+
+而不是像per cpu操作那样，先是一系列的地址计算，然后从该地址获取。在this_cpu_ops
+之前，这样的序列还需要先禁用/启用抢占功能，以防止内核在计算过程中将线程移动到不同
+的处理器上。
+
+请思考下面this_cpu操作::
+
+	this_cpu_inc(x)
+
+上面的结果是下面的单条指令（无锁前缀！）::
+
+	inc gs:[x]
+
+而不是在没有段寄存器的情况下所需要的以下操作::
+
+	int *y;
+	int cpu;
+
+	cpu = get_cpu();
+	y = per_cpu_ptr(&x, cpu);
+	(*y)++;
+	put_cpu();
+
+请注意，这些操作只能用于为特定处理器保留的per cpu数据。如果不在上下文代码中禁用抢
+占，this_cpu_inc()将仅保证per cpu的某一个计数器被正确地递增，但不能保证操作系统不
+会在this_cpu指令执行的前后直接移动该进程。一般来说，这意味着每个处理器的单个计数
+器的值是没有意义的。所有per cpu计数器的总和才是唯一有意义的值。
+
+per cpu变量的使用是出于性能的考虑。如果多个处理器同时处理相同的代码路径，可以避免
+缓存行跳转。由于每个处理器都有自己的per cpu变量，因此不会发生并发缓存行更新。为这
+种优化必须付出的代价是，当需要计数器的值时要将per cpu计数器相加。
+
+
+特殊的操作
+----------
+
+::
+
+	y = this_cpu_ptr(&x)
+
+使用per cpu变量的偏移量(&x!)，并返回属于当前执行处理器的per cpu变量的地址。
+this_cpu_ptr避免了通用get_cpu/put_cpu序列所需的多个步骤。没有可用的处理器编号。相
+反，本地per cpu区域的偏移量只是简单地添加到per cpu偏移量上。
+
+请注意，当抢占被禁用时，这个操作通常是在代码段中使用。然后该指针用来访问临界区中
+的本地per cpu数据。当重新启用抢占时，此指针通常不再有用，因为它可能不再指向当前处
+理器的per cpu数据。
+
+Per cpu变量和偏移量
+-------------------
+
+per cpu变量相对于per cpu区域的起始点是有偏移的。尽管它们在代码中看起来像那样，
+但它们没有地址。 不能直接取消引用偏移量。为了构成有效地址，必须将偏移量添加到处理
+器的per cpu区域的基指针。
+
+因此，在per cpu操作的上下文之外使用x或&x是无效的，这种行为通常会被当作一个空指针
+的解引用来处理。
+
+::
+
+	DEFINE_PER_CPU(int, x);
+
+在per cpu操作的上下文中，上面表达式说明x是一个per cpu变量。大多数this_cpu操作都需
+要一个cpu变量。
+
+::
+
+	int __percpu *p = &x;
+
+&x和p是per cpu变量的偏移量。this_cpu_ptr()使用per cpu变量的偏移量，这让它看起来有
+点奇怪。
+
+
+per cpu结构体字段的操作
+-----------------------
+
+假设我们有一个percpu结构::
+
+	struct s {
+		int n,m;
+	};
+
+	DEFINE_PER_CPU(struct s, p);
+
+
+这些字段的操作非常简单::
+
+	this_cpu_inc(p.m)
+
+	z = this_cpu_cmpxchg(p.m, 0, 1);
+
+
+如果我们有一个相对于结构体s的偏移量::
+
+	struct s __percpu *ps = &p;
+
+	this_cpu_dec(ps->m);
+
+	z = this_cpu_inc_return(ps->n);
+
+
+如果我们后面不使用this_cpu ops来操作字段，则指针的计算可能需要使用this_cpu_ptr()::
+
+	struct s *pp;
+
+	pp = this_cpu_ptr(&p);
+
+	pp->m--;
+
+	z = pp->n++;
+
+
+this_cpu ops的变体
+------------------
+
+this_cpu的操作是中断安全的。一些架构不支持这些per cpu的本地操作。在这种情况下，该
+操作必须被禁用中断的代码所取代，然后做那些保证是原子的操作，再重新启用中断。当然
+这样做是很昂贵的。如果有其他原因导致调度器不能改变我们正在执行的处理器，那么就没
+有理由禁用中断了。为此，我们提供了以下__this_cpu操作。
+
+这些操作不能保证并发中断或抢占。如果在中断上下文中不使用per cpu变量并且调度程序无
+法抢占，那么它们是安全的。如果在操作进行时仍有中断发生，并且中断也修改了变量，则
+无法保证RMW操作是安全的::
+
+	__this_cpu_read(pcp)
+	__this_cpu_write(pcp, val)
+	__this_cpu_add(pcp, val)
+	__this_cpu_and(pcp, val)
+	__this_cpu_or(pcp, val)
+	__this_cpu_add_return(pcp, val)
+	__this_cpu_xchg(pcp, nval)
+	__this_cpu_cmpxchg(pcp, oval, nval)
+	__this_cpu_cmpxchg_double(pcp1, pcp2, oval1, oval2, nval1, nval2)
+	__this_cpu_sub(pcp, val)
+	__this_cpu_inc(pcp)
+	__this_cpu_dec(pcp)
+	__this_cpu_sub_return(pcp, val)
+	__this_cpu_inc_return(pcp)
+	__this_cpu_dec_return(pcp)
+
+
+将增加x，并且不会回退到在无法通过地址重定位和同一指令中的读取-修改-写入操作实现原
+子性的平台上禁用中断的代码。
+
+
+&this_cpu_ptr(pp)->n 对比 this_cpu_ptr(&pp->n)
+----------------------------------------------
+
+第一个操作使用偏移量并形成一个地址，然后再加上n字段的偏移量。这可能会导致编译器产
+生两条加法指令。
+
+第二个操作先加上两个偏移量，然后进行重定位。恕我直言，第二种形式看起来更干净，而
+且更容易与()结合。第二种形式也与this_cpu_read()和大家的使用方式一致。
+
+
+远程访问per cpu数据
+-------------------
+
+per cpu数据结构被设计为由一个CPU独占使用。如果您按预期使用变量，则this_cpu_ops()
+保证是“原子的”，因为没有其他CPU可以访问这些数据结构。
+
+在某些特殊情况下，您可能需要远程访问per cpu数据结构。通常情况下，进行远程读访问是
+安全的，这经常是为了统计计数器值。远程写访问可能会出现问题，因为this_cpu操作没有
+锁语义。远程写可能会干扰this_cpu RMW操作。
+
+除非绝对必要，否则强烈建议不要对percpu数据结构进行远程写访问。请考虑使用IPI来唤
+醒远程CPU，并对其per cpu区域进行更新。
+
+要远程访问per-cpu数据结构，通常使用per_cpu_ptr()函数::
+
+
+	DEFINE_PER_CPU(struct data, datap);
+
+	struct data *p = per_cpu_ptr(&datap, cpu);
+
+这清楚地表明，我们正准备远程访问percpu区域。
+
+您还可以执行以下操作以将datap偏移量转换为地址::
+
+	struct data *p = this_cpu_ptr(&datap);
+
+但是，将通过this_cpu_ptr计算的指针传递给其他cpu是不寻常的，应该避免。
+
+远程访问通常只用于读取另一个cpu的per cpu数据状态。由于this_cpu操作宽松的同步要求，
+写访问可能会导致独特的问题。
+
+下面的情况说明了写入操作的一些问题，由于两个per cpu变量共享一个缓存行，但宽松的同
+步仅应用于更新缓存行的一个进程。
+
+考虑以下示例::
+
+
+	struct test {
+		atomic_t a;
+		int b;
+	};
+
+	DEFINE_PER_CPU(struct test, onecacheline);
+
+如果一个处理器远程更新字段'a'，而本地处理器将使用this_cpu ops来更新字段b，会发生
+什么情况，这一点值得注意。应避免在同一缓存行内同时访问数据。此外，可能还需要进行
+代价高昂的同步。在这种情况下，通常建议使用IPI，而不是远程写入另一个处理器的
+per cpu区域。
+
+即使在远程写很少的情况下，请记住远程写将从最有可能访问它的处理器中逐出缓存行。如
+果处理器唤醒时发现per cpu区域缺少本地缓存行，其性能和唤醒时间将受到影响。
-- 
2.31.1

