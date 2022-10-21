Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5F33C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 07:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229514AbiJUHg2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 03:36:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbiJUHg2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 03:36:28 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 22F1217F9BE
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 00:36:24 -0700 (PDT)
Received: from loongson.cn (unknown [112.20.109.239])
        by gateway (Coremail) with SMTP id _____8BxHdn3S1JjQ1sBAA--.6140S3;
        Fri, 21 Oct 2022 15:36:23 +0800 (CST)
Received: from [192.168.100.127] (unknown [112.20.109.239])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxn+D2S1JjSZICAA--.10550S3;
        Fri, 21 Oct 2022 15:36:23 +0800 (CST)
Message-ID: <80245b02-74fa-e334-60dd-4ad11e926641@loongson.cn>
Date:   Fri, 21 Oct 2022 15:36:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH RESEND V2 3/3] docs/zh_CN: core-api: Add errseq Chinese
 translation
Content-Language: en-US
To:     Binbin Zhou <zhoubinbin@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>
Cc:     Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org
References: <cover.1666171735.git.zhoubinbin@loongson.cn>
 <bd81bd620eb6c64effd2d0d52831f39911fc1659.1666171735.git.zhoubinbin@loongson.cn>
From:   Yanteng Si <siyanteng@loongson.cn>
In-Reply-To: <bd81bd620eb6c64effd2d0d52831f39911fc1659.1666171735.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxn+D2S1JjSZICAA--.10550S3
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKFy7Ar48Jw47KFyDGFyDKFg_yoWfJw1kpr
        yakryfGF48XryDXFsrGr1Dtr1kJF18WF4DGa4xJFyftF1kArZxtr4Yy3WkJ3yfWrySya42
        vr4FgryFyry2krJanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
        0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
        AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1l
        Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
        GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI4
        8JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4U
        MIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I
        8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcsjjDUUUU
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 10/21/22 09:58, Binbin Zhou wrote:
> Translate core-api/errseq.rst into Chinese.
>
> Last English version used:
>
> commit 14ebc28e07e6 ("errseq: Add to documentation tree").
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Reviewed-by: Yanteng Si <siyanteng@loongson.cn>


Thanks,

Yanteng

> ---
>   .../translations/zh_CN/core-api/errseq.rst    | 145 ++++++++++++++++++
>   .../translations/zh_CN/core-api/index.rst     |   5 -
>   2 files changed, 145 insertions(+), 5 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/core-api/errseq.rst
>
> diff --git a/Documentation/translations/zh_CN/core-api/errseq.rst b/Documentation/translations/zh_CN/core-api/errseq.rst
> new file mode 100644
> index 000000000000..815fb303ea2f
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/errseq.rst
> @@ -0,0 +1,145 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/errseq.rst
> +
> +:翻译:
> +
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
> +
> +:校译:
> +
> + 吴想成 Wu Xiangcheng <bobwxc@email.cn>
> +
> +================
> +errseq_t数据类型
> +================
> +
> +``errseq_t`` 是一种在一个地方记录错误的方法，并允许任意数量的 ``订阅者`` 判断自上
> +次采样点以来是否发生了变化。
> +
> +最初的用例是跟踪文件同步系统调用（ ``fsync``, ``fdatasync``, ``msync`` 和
> +``sync_file_range`` ）的错误，但它也可以用于其他情况。
> +
> +它被实现为一个无符号的32位值。低位被指定保存错误代码（在1和MAX_ERRNO之间）。高位
> +用作计数器。这里是用原子操作而不是锁来完成的，因此可以从任何上下文中调用这些函数。
> +
> +请注意，如果频繁记录新错误，则存在冲突风险，因为我们用作计数器的位很少。
> +
> +为了缓解这种情况，错误值和计数器之间的位被用作一个标志，以判断自记录新值以来是否
> +对该值进行了采样。这使我们能够避免在上次记录错误后没有人取样的情况下碰撞计数器。
> +
> +因此，我们得到了一个类似这样的值：
> +
> ++--------------------------------------+------+------------------------+
> +| 31..13                               |  12  | 11..0                  |
> ++--------------------------------------+------+------------------------+
> +| 计数器                               | 标志 | 错误值                 |
> ++--------------------------------------+------+------------------------+
> +
> +总体思路是让 ``观察者`` 对errseq_t值进行采样，并将其保留为运行游标。该值稍后可用
> +于判断自采样完成后是否发生了任何新错误，并原子地记录检查时的状态。这使得我们能在
> +一个地方记录错误，然后有许多 ``观察者`` 可以判断自上次检查以来该值是否发生了变化。
> +
> +新的errseq_t应始终清零。全零的errseq_t值是从未出现错误的特殊（但常见）情况。因此，
> +如果您希望知道自首次初始化以来是否曾经有过错误集，则全零值被用作 ``纪元`` 。
> +
> +API的使用方法
> +=============
> +
> +让我给你们讲一个关于员工drone的故事。现在，他总体上是个好员工，但公司有点...管理
> +繁重。他今天必须向77名主管汇报，明天 ``大老板`` 要从外地赶来，他肯定也会考验这个
> +可怜的家伙。
> +
> +他们都把工作交给他去做---多到他都记不住谁交给他什么了，但这并不是什么大问题。主管
> +们只想知道他什么时候完成他们迄今为止交给他的所有工作，以及自从他们上次询问以来他
> +是否犯了任何错误。
> +
> +他可能在他们实际上并没有交给他的工作上犯了错误，但他无法在那么详细的层面上记录事
> +情，他所能记得的只是他最近犯的错误。
> +
> +下面是我们 ``worker_drone`` 的表达式::
> +
> +        struct worker_drone {
> +                errseq_t        wd_err; /* 用来记录错误 */
> +        };
> +
> +每天， ``worker_drone`` 都是以一张白纸开始的::
> +
> +        struct worker_drone wd;
> +
> +        wd.wd_err = (errseq_t)0;
> +
> +主管们进来后对当天的工作进行初步了解。他们并不关心在他们观察开始之前发生的任何事
> +情::
> +
> +        struct supervisor {
> +                errseq_t        s_wd_err; /* wd_err的私有“游标” */
> +                spinlock_t      s_wd_err_lock; /* 保护s_wd_err */
> +        }
> +
> +        struct supervisor       su;
> +
> +        su.s_wd_err = errseq_sample(&wd.wd_err);
> +        spin_lock_init(&su.s_wd_err_lock);
> +
> +现在他们开始给他布置任务。每隔几分钟，他们就要求他完成迄今为止交给他的所有工作。
> +然后问他是否有犯任何错误::
> +
> +        spin_lock(&su.su_wd_err_lock);
> +        err = errseq_check_and_advance(&wd.wd_err, &su.s_wd_err);
> +        spin_unlock(&su.su_wd_err_lock);
> +
> +到目前为止，它只是不断返回0。
> +
> +现在，这家公司的老板非常吝啬，给了他不合格的设备来完成他的工作。偶尔设备会出现故
> +障，导致他犯错。他重重地叹了一口气，并把它记录下来::
> +
> +        errseq_set(&wd.wd_err, -EIO);
> +
> +...然后继续工作。主管们最终会再次检查，他们在下次检查时都会发现这个错误。后续的调
> +用将返回0，直到记录下另一个错误，此时将向每个调用报告一次。
> +
> +请注意，主管们无法知道他们犯了多少错误，只能知道自上次检查以来是否犯了一个错误，
> +以及记录的最新值。
> +
> +偶尔，大老板会来抽查，要求员工为他做一次性的工作。他并不像主管们那样全职观察员工，
> +但他确实需要知道在他的工作处理过程中是否发生了错误。
> +
> +他只需对员工当前的errseq_t进行采样，然后用它来判断后来是否发生了错误::
> +
> +        errseq_t since = errseq_sample(&wd.wd_err);
> +        /* 提交一些工作，等待完成 */
> +        err = errseq_check(&wd.wd_err, since);
> +
> +由于他只是要在那个点之后丢弃 ``since`` ，所以他不需要在这里推进它。同时他也不需要
> +任何锁，因为它不能被其他人使用。
> +
> +序列化更新errseq_t游标
> +======================
> +
> +请注意，errseq_t API在check_and_advance_operation期间不保护errseq_t游标。只有典型
> +的错误代码是被原子化处理的。在多任务同时使用同一个errseq_t游标的情况下，对该游标
> +的更新进行序列化是很重要的。
> +
> +如果不这样做，那么游标就有可能向后移动。在这种情况下，同一个错误可能被报告多次。
> +
> +因此，通常先执行errseq_check检查是否有任何变化，然后在获取锁后才执行
> +errseq_check_and_advance。例如::
> +
> +        if (errseq_check(&wd.wd_err, READ_ONCE(su.s_wd_err)) {
> +                /* su.s_wd_err被s_wd_err_lock保护 */
> +                spin_lock(&su.s_wd_err_lock);
> +                err = errseq_check_and_advance(&wd.wd_err, &su.s_wd_err);
> +                spin_unlock(&su.s_wd_err_lock);
> +        }
> +
> +这就避免了自上次检查以来没有任何变化的常见情况下的自旋锁。
> +
> +函数
> +====
> +
> +该API在以下内核代码中:
> +
> +lib/errseq.c
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Documentation/translations/zh_CN/core-api/index.rst
> index d08091036066..8b19c6ae9704 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -50,11 +50,6 @@
>      packing
>      this_cpu_ops
>      timekeeping
> -
> -Todolist:
> -
> -
> -
>      errseq
>   
>   并发原语

