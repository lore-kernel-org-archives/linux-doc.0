Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A250C43460
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 16:50:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4A40613D0
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 16:50:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239963AbhDFQuu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 12:50:50 -0400
Received: from m32-153.88.com ([43.250.32.153]:13906 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S239936AbhDFQut (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 12:50:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=YRrkQG5gX+xiJwB4gemZwAc+CBZ035JwOlofR
        3z6QIc=; b=A8zH4PiIB9GAIamjMu6LMWCJqpAm6ccaq2JcL6EFeGNBVEH0e6iXJ
        V8nMvt4EPEs5DMYj0OauIV7O/QPaOJpTXSSeXJN+uxrVLl408ZQR5C3ljt0KxZG/
        OzEFceIkLf1xg7WUMYuuijHEhyuhJxloByVCiv2OGoHEuT5ySwpluk=
Received: from bobwxc.top (unknown [112.96.109.30])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBX4iJPkWxgExhgAA--.27042S2;
        Wed, 07 Apr 2021 00:50:25 +0800 (CST)
Date:   Wed, 7 Apr 2021 00:50:23 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH 09/11] docs/zh_CN: add openrisc/todo.rst translation
Message-ID: <20210406165023.GC17278@bobwxc.top>
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-10-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210406130210.2725075-10-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBX4iJPkWxgExhgAA--.27042S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFy5Aw4fXw45WrW7KFyUZFb_yoW8ArW8pF
        WqkFyfGa1xAasFyw1Sgw17Xr1fCFWxWay7Ga92qwn3KF98tw18tr13t3sxKw4fCr1IvFyq
        vFs8KFyj9ryUCaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgGb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04
        v7MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Y
        z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
        AF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
        IxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCw
        CI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnI
        WIevJa73UjIFyTuYvjxUUVyIUUUUU
X-Originating-IP: [112.96.109.30]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 06, 2021 at 09:02:08PM +0800, Yanteng Si wrote:
> This patch translates Documentation/openrisc/todo.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
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
> +代办事项

？？
待办

> +===========
> +
> +OpenRISC Linux的移植已经完全投入使用，并且从 2.6.35 开始就一直在上游同步。
> +然而，还有一些剩余的项目需要在未来几个月内完成。 下面是一个已知的不如意的

不如意 -> 不尽完美 ? decide it by yourself

> +项目列表，即我们的待办事项列表。

missing "that are due for investigation shortly"

> +
> +-   实现其余的DMA API......dma_map_sg等。

Chinses ellipsis U+2026
……

> +
> +-   完成重命名清理工作......代码中提到了or32，这是架构的一个老名字。 我们

……

> +    已经确定的名字是or1k，这个改变正在以缓慢积累的方式进行。 目前，or32相当
> +    于or1k。
> -- 
> 2.27.0

