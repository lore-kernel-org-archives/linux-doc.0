Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F288C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 03:04:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F8B564EEC
	for <linux-doc@archiver.kernel.org>; Wed, 17 Mar 2021 03:04:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbhCQDDu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Mar 2021 23:03:50 -0400
Received: from m32-153.88.com ([43.250.32.153]:32505 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229673AbhCQDD1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 16 Mar 2021 23:03:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=CRKrZ77DRC8sw4CRca0wYuIrnenYRUcyibU0Z
        G8Zhps=; b=cfxeQ/0c4n75h10v0x4XJCZIGowJ7CbMuHIFh3RdQ1JBEN3NY4NN2
        1xcDvYBt9ednfJav9LDf4U8rcrgIScUaDgd0v6zVNuO+ikTQrAPlDl3wAvgOAiGp
        yQsnmeIJLrv1XjkASrOhEIcTHsXvcPRjzOcB1CfEliGeFTumsL73jQ=
Received: from mipc (unknown [120.238.248.129])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBn8iJ7cVFgkawxAA--.56842S2;
        Wed, 17 Mar 2021 11:03:25 +0800 (CST)
Date:   Wed, 17 Mar 2021 11:03:23 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Alex Shi <alex.shi@linux.alibaba.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] docs/zh_CN: Add zh_CN/admin-guide/bug-hunting.rst
Message-ID: <20210317030323.GA20733@mipc>
References: <b032e8ab75e91b37ae88f2c80102ab6dde1bfa45.1615909052.git.bobwxc@email.cn>
 <fb00391d6c189ae5de19b410be5cb3b48b60dc4c.1615909052.git.bobwxc@email.cn>
 <da130f09-8ad2-99f8-5bc8-192d6b5deb59@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <da130f09-8ad2-99f8-5bc8-192d6b5deb59@linux.alibaba.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBn8iJ7cVFgkawxAA--.56842S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur1xCr48Gw1DWw1xJF17Awb_yoW3JrgEvw
        s0qF4vkr1UG397Zw1xGF4rAa9rZan0kayvvry5Aan8W3ZIkanrWryDWasYqa95Wrs09rZr
        C343ZrWxGr1DWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYkYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
        kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWx
        Jr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc2xSY4AK67AK6r48MxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
        0xZFpf9x07U7nYwUUUUU=
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 17, 2021 at 10:57:30AM +0800, Alex Shi wrote:
> 
> 
> 在 2021/3/16 下午11:41, Wu XiangCheng 写道:
> > Add translation zh_CN/admin-guide/bug-hunting.rst, and link it to
> > zh_CN/admin-guide/index.rst while clean its todo entry.
> > 
> > Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> > ---
[...]
> > +(2) 从串口终端启动（参见
> > +    :ref:`Documentation/admin-guide/serial-console.rst <serial_console>` ），
> > +    在另一台机器上运行空调制解调器然后用你喜爱的通信程序捕获输出。
> 
> "空调制解调器" is easy to be misunderstood, maybe just skip the 'null' word?
>
OK, will pick in next version.
Thanks!
> 
> All others LGTM.
> 
> Thanks!

