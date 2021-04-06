Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F245EC433B4
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 16:56:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9AB6613AD
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 16:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbhDFQ4g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 12:56:36 -0400
Received: from m32-153.88.com ([43.250.32.153]:14364 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S244303AbhDFQ4f (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Apr 2021 12:56:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=HQJgLaxwxCnfUF3fhRami2fX+4VTs43PJMzwY
        L+aD/0=; b=CbWUT6BjoExeRkLNBUnLP/VQ4nHZKfbEFqFuJlgf2ekNxsBLIjqnT
        x9rBigC4XRePXEuf4HgzcRhmO+ssCMSsmQjzWznQpdBga9b/4CudHKju+NSiIm7K
        lSW6phpYIpba+DxYSjgJF01stxuLdweTEJbNcmYufKL9Mhlsv/hlWA=
Received: from bobwxc.top (unknown [112.96.109.30])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBX4iKzkmxg2xlgAA--.27062S2;
        Wed, 07 Apr 2021 00:56:22 +0800 (CST)
Date:   Wed, 7 Apr 2021 00:56:19 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH 10/11] docs/zh_CN: add openrisc/index.rst translation
Message-ID: <20210406165617.GA18875@bobwxc.top>
References: <20210406130210.2725075-1-siyanteng@loongson.cn>
 <20210406130210.2725075-11-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210406130210.2725075-11-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBX4iKzkmxg2xlgAA--.27062S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tryrKFy8CFyxKryxCFWrGrg_yoW8Jw1fpF
        ykG34fGF4xJ3sFk3WfKF1Igr1kCw4xJwsrJa97X3sYgr1Dtr1Utr15t3y5KrW8GrsYva4U
        Xan7KFy8Kryjk3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

On Tue, Apr 06, 2021 at 09:02:09PM +0800, Yanteng Si wrote:
> This patch translates Documentation/openrisc/index.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../translations/zh_CN/openrisc/index.rst     | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/openrisc/index.rst
> 
> diff --git a/Documentation/translations/zh_CN/openrisc/index.rst b/Documentation/translations/zh_CN/openrisc/index.rst
> new file mode 100644
> index 000000000000..89432b9cf8e1
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/openrisc/index.rst
> @@ -0,0 +1,27 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: :doc:`../../../openrisc/index`
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_openrisc_index:
> +
> +
> +=====================
> +OpenRISC 体系架构
> +=====================
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +   openrisc_port
> +   todo
> +

It seems missed the TodoList of "features", please add it if you have
time.
And a reviewed-by

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> +
> +.. only::  subproject and html
> +
> +   Indices
> +   =======
> +
> +   * :ref:`genindex`
> -- 
> 2.27.0

