Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81168C433B4
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 10:30:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DFDD60240
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 10:30:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233089AbhDIKa4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 06:30:56 -0400
Received: from [43.250.32.171] ([43.250.32.171]:62307 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S231402AbhDIKaz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Apr 2021 06:30:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=+vx4tuvUsSBRiPs6XCuti59kIf4vn8btTl1Xy
        3Im+gY=; b=hwGdXa2gC9m6QLn0EnK971jR+usXwM0GR3nzGmYRRTbCtEGZZJSJX
        isrH98o150cIVKuOx+3kC1PJ2nG9KNrC8feNuAKgef2IIdO0k6tBkSsyHYR0o1No
        GcTUbzl5YCpE1QnGUtmI2Qtdsu3zAju3MSq1/i/EWAupKnvDZzuLQU=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDHOdDILHBgDfZTAA--.58525S2;
        Fri, 09 Apr 2021 18:30:33 +0800 (CST)
Date:   Fri, 9 Apr 2021 18:30:31 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v2 09/11] docs/zh_CN: add openrisc/todo.rst translation
Message-ID: <20210409103031.GD22786@bobwxc.top>
References: <20210409091013.2493988-1-siyanteng@loongson.cn>
 <20210409091013.2493988-10-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210409091013.2493988-10-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDHOdDILHBgDfZTAA--.58525S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy5Aw4fXw45WrW7KFyUZFb_yoW8WFy7pF
        Wvka4fGa1xJasFy3WSgry7Xr1fCFWxXay7Ga92qwnxKF9xtw4rtr15t343Jw4xAr1IvFWU
        ZFs0kFyj9r17C3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyGb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0x
        vYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_
        Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2
        IY04v7MxkIecxEwVAFwVW8twCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4U
        Jr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
        xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
        jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
        0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
        67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUUaFAPUUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 09, 2021 at 05:10:11PM +0800, Yanteng Si wrote:
> This patch translates Documentation/openrisc/todo.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/openrisc/todo.rst      | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/openrisc/todo.rst
> 
> diff --git a/Documentation/translations/zh_CN/openrisc/todo.rst b/Documentation/translations/zh_CN/openrisc/todo.rst
> new file mode 100644
> index 000000000000..0e5d1c9122f8
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/openrisc/todo.rst
> @@ -0,0 +1,20 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../openrisc/todo`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_openrisc_todo.rst:
> +
> +===========
> +待办事项
> +===========
> +
> +OpenRISC Linux的移植已经完全投入使用，并且从 2.6.35 开始就一直在上游同步。
> +然而，还有一些剩余的项目需要在未来几个月内完成。 下面是一个即将进行调查的已知
> +不尽完美的项目列表，即我们的待办事项列表。
> +
> +-   实现其余的DMA API……dma_map_sg等。
> +
> +-   完成重命名清理工作……代码中提到了or32，这是架构的一个老名字。 我们
> +    已经确定的名字是or1k，这个改变正在以缓慢积累的方式进行。 目前，or32相当
> +    于or1k。
> -- 
> 2.27.0

