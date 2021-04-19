Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5595BC433B4
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 06:05:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31C2461151
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 06:05:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhDSGF3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 02:05:29 -0400
Received: from [43.250.32.171] ([43.250.32.171]:28736 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229652AbhDSGF3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Apr 2021 02:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=awqMbE///ap/xd4YmFT9QlZDGQrwSi67BIyQE
        nCopVk=; b=GSh4jY2/7/hq85lk0hv+ZcjDlQAENIQdFCt430s+rwHO0N3b3RU5u
        WqFh73OGHyCJqIFfKhTf0hwQSE8rzhiG42KLvRhJGdxhOhtFEszXPv1EXUprWUin
        hm8p3Pg6KUE5uEgpZ66YQXKT8lnRT+UDWBI3o8MpR/fX01rnBNPU84=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgA3qtCAHX1gzbNkAA--.32705S2;
        Mon, 19 Apr 2021 14:04:50 +0800 (CST)
Date:   Mon, 19 Apr 2021 14:04:48 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     teng sterling <sterlingteng@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Yanteng Si <siyanteng@loongson.cn>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] docs/zh_CN: Add translation
 zh_CN/kernel-hacking/locking.rst
Message-ID: <20210419060448.GA3967@bobwxc.top>
References: <26979ff9c52fe352f117204b3c5b939e4fe0c58d.1618761749.git.bobwxc@email.cn>
 <CAMU9jJoe3-DJa8FwwsbciYn9bnfBr+BX+4_3Y5=8VA_OnysW_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMU9jJoe3-DJa8FwwsbciYn9bnfBr+BX+4_3Y5=8VA_OnysW_w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgA3qtCAHX1gzbNkAA--.32705S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AFW5XrWxZr47Aw17tryrJFb_yoWxKFyDpr
        nxJF97JF4UJryUXr1Utr1UJr1UJ3W8Jw1UJr18tr10qrs0yr4UJr1UJr18XryUGry8AryU
        JF1UJr1UAr1UArDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqmb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMx
        AIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
        67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMI
        IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
        14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
        W8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUUVyI
        UUUUU
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 19, 2021 at 11:32:15AM +0800, teng sterling wrote:
> Wu XiangCheng <bobwxc@email.cn> 于2021年4月19日周一 上午12:11写道：
> >
> > Add a new translation
> >   Documentation/translations/zh_CN/kernel-hacking/locking.rst
> > and link it to zh_CN/kernel-hacking/index.rst
> >
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> >  .../zh_CN/kernel-hacking/index.rst            |    5 +-
> >  .../zh_CN/kernel-hacking/locking.rst          | 1249 +++++++++++++++++
> >  2 files changed, 1250 insertions(+), 4 deletions(-)
> >  create mode 100644 Documentation/translations/zh_CN/kernel-hacking/locking.rst
> >
> > diff --git a/Documentation/translations/zh_CN/kernel-hacking/index.rst b/Documentation/translations/zh_CN/kernel-hacking/index.rst
> > index df530de2278d..230439ae21de 100644
> > --- a/Documentation/translations/zh_CN/kernel-hacking/index.rst
> > +++ b/Documentation/translations/zh_CN/kernel-hacking/index.rst
> > @@ -16,7 +16,4 @@
> >     :maxdepth: 2
> >
> >     hacking
> > -
> > -TODO
> > -
> > -- locking
> > +   locking
> > diff --git a/Documentation/translations/zh_CN/kernel-hacking/locking.rst b/Documentation/translations/zh_CN/kernel-hacking/locking.rst
> > new file mode 100644
> > index 000000000000..66f144e48d0c
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/kernel-hacking/locking.rst
> > @@ -0,0 +1,1249 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/kernel-hacking/locking.rst
> > +
> > +:译者:
> > +
> > + 吴想成 Wu XiangCheng <bobwxc@email.cn>
> > +
> > +.. _kernel_hacking_lock_zh:
> > +
> > +==========
> > +锁操作指北
> > +==========

> 指北 -> 指南？
> I think kernel documents are publications, and the words used here are
> not formal, especially the title.
> ”指北“和”指南“在词义上有等同的地方，”指南“较为正式、严肃且使用范围广泛，”指北“较为轻松随意。
> 我们应该在不同的场合使用不同的词。详情请参阅：
> [1]李德龙.“指北”与“指南”[J].语文建设,2003(05):40.
> [2]牛津高阶双语词典
> [1]张鹏.指南针为什么不叫指北针[J].数学大世界(小学三四年级适用),2011(03):20.

Interesting, it's not a grammar problem, but a semantic problem.

The original title is "Unreliable Guide To Locking".
It it really "unreliable"? No, it is humble and funny.
“指北” also catch this meaning.

FYI, see <https://gitee.com/gitee-community/opensource-guide>

> > +
> > +:Author: Rusty Russell
> > +
> > +前言
> > +====
> > +
> > +欢迎来到Rusty的不靠谱内核锁操作问题指南。本文档描述了Linux内核2.6版本的锁系统。
> > +
> > +随着Linux内核中超线程和抢占的广泛可用，进行内核编程的每个人都需要了解SMP
> > +（Symmetrical Multi-Processing，对称多处理）的并发与锁的基本原理。
> > +
> > +并发问题
> > +========
> > +
> > +*（如果您知道什么是竞态[Race Condition]，请跳过。）*

> delete *

OK

> > +
> > +在普通程序中，可以按如下方式递增计数器：
> > +
> > +::
> > +
> > +          very_important_count++;
> > +
> > +
> > +以下是他们预期会发生的：
> > +
> > +.. table:: 预期结果
> > +
> > +  +------------------------------------+------------------------------------+
> > +  | 实例 1                             | 实例 2                             |
> > +  +====================================+====================================+
> > +  | 读取 very_important_count (5)      |                                    |
> > +  +------------------------------------+------------------------------------+
> > +  | 加 1 (6)                           |                                    |
> > +  +------------------------------------+------------------------------------+
> > +  | 写回 very_important_count (6)      |                                    |
> > +  +------------------------------------+------------------------------------+
> > +  |                                    | 读取 very_important_count (6)      |
> > +  +------------------------------------+------------------------------------+
> > +  |                                    | 加 1 (7)                           |
> > +  +------------------------------------+------------------------------------+
> > +  |                                    | 写回 very_important_count (7)      |
> > +  +------------------------------------+------------------------------------+

> very_important_count Is not a file or storage hardware, it is just a
> variable in a program segment, so it should be translated as：
> read -> 读
> write -> 写

OK.

> > +
> > +以下是可能会发生的：
> > +
> > +.. table:: 可能的结果
> > +
> > +  +------------------------------------+------------------------------------+
> > +  | 实例 1                             | 实例 2                             |
> > +  +====================================+====================================+
> > +  | 读取 very_important_count (5)      |                                    |
> > +  +------------------------------------+------------------------------------+
> > +  |                                    | 读取 very_important_count (5)      |
> > +  +------------------------------------+------------------------------------+
> > +  | 加 1 (6)                           |                                    |
> > +  +------------------------------------+------------------------------------+
> > +  |                                    | 加 1 (6)                           |
> > +  +------------------------------------+------------------------------------+
> > +  | 写回 very_important_count (6)      |                                    |
> > +  +------------------------------------+------------------------------------+
> > +  |                                    | 写回 very_important_count (6)      |
> > +  +------------------------------------+------------------------------------+

> ”读“ and "写”

OK.

> > +
> > +
> > +竞争态势与临界区域

> 竞态？ 竞争态势？

竞争态势，略作 竞态
标题中使用全称，下方说明括注简称与原词

> Please be consistent

> > +------------------
> > +
> > +这种重叠会导致结果取决于多个任务的相对时间，称为竞争态势（Race Condition，
> Appeared for the third time
> delete ()
> > +竞态）。包含并发问题的代码段称为临界区域（Critical Region）。特别是从Linux
> > +开始在SMP机器上运行以来，它们成为内核设计和实现中的主要问题之一。
> > +
> > +抢占（Preemption）可以产生相同的效果，即使只有一个CPU：通过在关键区域抢占一个

> 关键区域？临界区域（Critical Region）？
> Please be consistent

use 临界区域
will correct

> > +任务，就会出现一样的竞争条件。在这种情况下，抢占的线程可能会运行关键区域本身。
> > +
> > +解决方案是识别这些同步访问何时发生，并使用锁来确保任意时刻只有一个实例可以进
> > +入关键区域。Linux内核中有许多友好的原语可以帮助您做到这一点。也有一些不好使的
> > +原语，不过我会假装他们不存在。
> > +

> There's a thread called Hungry, which preemptions me.  ~>_<~
> The afternoon continues。

Nice humor! I like it.

Thanks,
Wu

