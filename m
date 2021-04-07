Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D14BC433ED
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 09:18:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 226A661394
	for <linux-doc@archiver.kernel.org>; Wed,  7 Apr 2021 09:18:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350023AbhDGJSW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Apr 2021 05:18:22 -0400
Received: from m32-153.88.com ([43.250.32.153]:41091 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231878AbhDGJSV (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Apr 2021 05:18:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=3YVfXhhXzWVo6xU/mp5rQWzYXy41ngGg3I/hh
        EQFPNE=; b=gSV3aKTAqr/DvToCafK43sgSGPtLk4Z7smnVpyWVQ88zydkBf87nB
        e4/s9m5ut8LON0emyhq5T4krNreVTyFVsH1WAxfJFawebkTIJWVMXPPcVwSfhGmM
        HL/Zpy0zOVD7IoFpk56CD7vBkTGzUp1Etki+qnGiuck7nvcRzgA0Xc=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgCnMiPNeG1g12BhAA--.30556S2;
        Wed, 07 Apr 2021 17:18:07 +0800 (CST)
Date:   Wed, 7 Apr 2021 17:18:05 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     teng sterling <sterlingteng@gmail.com>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <seakeel@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 6/8] docs/zh_CN: Add translation
 zh_CN/doc-guide/maintainer-profile.rst
Message-ID: <20210407091805.GA2492@bobwxc.top>
References: <cover.1617699755.git.bobwxc@email.cn>
 <c2c2d12ac6b85a357ef76889bcb3797efbad1fd4.1617699755.git.bobwxc@email.cn>
 <CAMU9jJrhExJZyGKZFtSCdfTcT_E4LMznn5NMdSNHYe+na5e=Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMU9jJrhExJZyGKZFtSCdfTcT_E4LMznn5NMdSNHYe+na5e=Lg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgCnMiPNeG1g12BhAA--.30556S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWF4fGrW7tw1kWFW7KFyrXrb_yoWrWF17pF
        sxWFWfKFs2yr1UCr4xKry7AF1YyayxGr48urn2gr93tr90kr1kZr4DK34rWrZ7WryxAFW5
        ZFsrurZ8Cw47ZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgSb7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r4fMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kfnx
        nUUI43ZEXa7IUUpVbPUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 07, 2021 at 04:28:25PM +0800, teng sterling wrote:
> Wu XiangCheng <bobwxc@email.cn> 于2021年4月7日周三 下午3:51写道：
> >
> > Add new translation
> >   Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
> >
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
> >  .../zh_CN/doc-guide/maintainer-profile.rst    | 43 +++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
> >
> > diff --git a/Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst b/Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
> > new file mode 100644
> > index 000000000000..e3e10287aef0
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/doc-guide/maintainer-profile.rst
> > @@ -0,0 +1,43 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/doc-guide/maintainer-profile.rst
> > +
> > +:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> > +
> > +文档子系统维护人员条目概述
> > +===========================
> > +
> > +文档“子系统”是内核文档和相关基础设施的中心协调点。它涵盖了 Documentation/ 下
> > +的文件层级（Documentation/devicetree 除外）、scripts/ 下的各种实用程序，并且
> > +在某些情况下的也包括 LICENSES/ 。
> > +
> > +不过值得注意的是，这个子系统的边界比通常更加模糊。许多其他子系统维护人员需要
> > +保持对 Documentation/ 某些部分的控制，以便于可以更自由地做更改。除此之外，
> > +许多内核文档都以kernel-doc注释的形式出现在源代码中；这些注释通常（但不总是）
> > +由相关的子系统维护人员维护。
> > +
> > +文档子系统的邮件列表是<linux-doc@vger.kernel.org>。
> > +补丁应尽量针对docs-next树。
> > +
> > +提交检查单补遗
> > +---------------
> > +
> > +在进行文档更改时，您应当构建文档以测试，并确保没有引入新的错误或警告。生成
> > +HTML文档并查看结果将有助于避免对文档渲染结果的不必要争执。
> > +
> > +开发周期的关键节点
> > +-------------------
> > +
> > +补丁可以随时发送，但在合并窗口期间，响应将比通常慢。文档树往往在合并窗口打开
> > +之前关闭得比较晚，因为文档补丁导致回归的风险很小。
> 回归 -> 回滚 or 回退指针？

This is a term of a kind of kernel bug.
I have discussed this word with Alex Shi in 
<https://lore.kernel.org/linux-doc/20210220093007.GA17987@mipc/>

FYI:
> > > 28.
> > > Regressions
> > > -回归
> > > +回退
> > >     "Regression" as a software term can be translated to "回归", but "回归"
> > >     often refers to the mathematical name or belonging state, and we also
> > >     use "回归测试" as "regression test".
> > >     Besides, there is also "rollback" but rollback is obviously different
> > >     from regression, so we can't use "回滚".
> > >     So, which word should we use to translate the proper term for kernel
> > >     error, "回退" or just use "回归" ?
> >
> > 'regression' here has same meaningful with 'regression test'. better no change.
> Ok.


> > +
> > +审阅节奏
> > +---------
> > +
> > +我（译注：指Jonathan Corbet <corbet@lwn.net>）是文档子系统的唯一维护者，我在
> > +自己的时间里完成这项工作，所以对补丁的响应有时会很慢。当补丁被合并时（或当我
> > +决定拒绝合并补丁时），我都会发送通知。如果您在发送补丁后一周内没有收到回复，
> > +请不要犹豫，发送提醒就好。
> > +
> > --
> > 2.20.1
> >
> 
> Thanks
> 
> Yanteng

