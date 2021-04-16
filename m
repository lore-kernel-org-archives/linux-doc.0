Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60359C433B4
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 11:58:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1EBA461184
	for <linux-doc@archiver.kernel.org>; Fri, 16 Apr 2021 11:58:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235329AbhDPL6l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Apr 2021 07:58:41 -0400
Received: from [43.250.32.171] ([43.250.32.171]:57900 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229706AbhDPL6k (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 16 Apr 2021 07:58:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=PgkLrwMz2I5/Hi9Oof88otyNwxB3cmV+xjbgw
        YKtoKo=; b=kpDI5Q2x2p3ovhODaic1Q31Us+xpWOrDuW328cUtXRLk97gJLju0C
        Qvy7Di3SCr0x1vySQKtxLQI2DRavj6fXKOJokDgtPh8xc1WdCQZnW18waKgdB2l6
        lyuu8GUGY+z/YoXipfLgsHI8rE0Xvn07p5XM5iQ/mI/o21IGDRfN/I=
Received: from bobwxc.top (unknown [120.238.248.129])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDHOdDMe3lg_jRgAA--.22123S2;
        Fri, 16 Apr 2021 19:58:06 +0800 (CST)
Date:   Fri, 16 Apr 2021 19:58:04 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v7 11/11] docs/zh_CN: add openrisc translation to zh_CN
 index
Message-ID: <20210416115804.GA11313@bobwxc.top>
References: <cover.1618568135.git.siyanteng@loongson.cn>
 <162fb50638028c9b0a92a0ce5c53e691be0cfec2.1618568135.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <162fb50638028c9b0a92a0ce5c53e691be0cfec2.1618568135.git.siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDHOdDMe3lg_jRgAA--.22123S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFy7Ary3AF13GrW5Kr1fCrg_yoWxKFc_Za
        97XFWvyFW3JryIqF95Zr18Jr1FkF48Kr1v9rnYy398Gw17Wr98Gw1DXFn5Z3WDWFW3ursx
        CrZ5Zr4fXrnrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYxYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8KwCF04k20x
        vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7IUUyv35UUUUU==
X-Originating-IP: [120.238.248.129]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 16, 2021 at 06:32:34PM +0800, Yanteng Si wrote:
> This patch add zh_CN/openrisc to zh_CN/index.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  Documentation/translations/zh_CN/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> index 8bb15ee2cf6d..f86fd7d31035 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -28,6 +28,7 @@
>     iio/index
>     riscv/index
>     core-api/index
> +   openrisc/index
>  
>  目录和表格
>  ----------
> -- 
> 2.27.0

