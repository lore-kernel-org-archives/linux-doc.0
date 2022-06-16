Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE76C43334
	for <linux-doc@archiver.kernel.org>; Thu, 16 Jun 2022 23:37:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378647AbiFPXh5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Jun 2022 19:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiFPXh4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Jun 2022 19:37:56 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DABD513F4F
        for <linux-doc@vger.kernel.org>; Thu, 16 Jun 2022 16:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=YQ/X9Z9+pp4ruNvFyDQzfG7/HZ61id7I5gtB7
        doN3nE=; b=fHIu6dPSXF71qWbCqeJr/M6Fos23IjFz/UuvWkN6jU+Co+xmqQgnK
        jCPyh7TFZRgYtx6D93V/pfel/Nms7KRJFDph4MBo1onsPvH8nvruX5H8YLnbb1Ju
        vqMDix899pM9IfB8PHtXy5jnhQBryjFlePnfgx4jPfwiNn338sbpJw=
Received: from bobwxc.mipc (unknown [120.242.121.113])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgCXhZbMvqtiXF8JAA--.27546S2;
        Fri, 17 Jun 2022 07:37:50 +0800 (CST)
Date:   Fri, 17 Jun 2022 07:37:43 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH 7/9] docs/zh_CN: core-api: Update the translation of
 printk-format.rst to 5.19-rc2
Message-ID: <Yqu+x95ngy68Vu0p@bobwxc.mipc>
References: <cover.1655258291.git.zhoubinbin@loongson.cn>
 <ebfda3a43afbfb5dd0186a6e68e080dd933a4883.1655258291.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ebfda3a43afbfb5dd0186a6e68e080dd933a4883.1655258291.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: LCKnCgCXhZbMvqtiXF8JAA--.27546S2
X-Coremail-Antispam: 1UD129KBjvJXoW7trWxCr4UKr48XFW5Ary5Arb_yoW8CF1xpF
        yIk3s7Wa1kGF1UurZ3JryUKr15GFZ7Cayqgay7Xw1vvFnIkrWxtrnrtrsxWrWxGFyIvFW2
        vanIkFyDu3W5CrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUqab7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zR_Oz3UUUUU
        =
X-Originating-IP: [120.242.121.113]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 15, 2022 at 05:24:30PM +0800, Binbin Zhou wrote:
> Synchronous translation from the following commits(Latest in front):
> 
> [1]: commit 2fbf5241a561("vsprintf: add new `%pA` format specifier")

^ this commit is from rust-next and not appeared in master or
jc/docs-next yet, so please drop it.

Thanks,
	Wu

> 
> [2]: commit 6a7ca80f4033("vsprintf: Update %pGp documentation
>      about that it prints hex value")
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../translations/zh_CN/core-api/printk-formats.rst  | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/core-api/printk-formats.rst b/Documentation/translations/zh_CN/core-api/printk-formats.rst
> index ce39c788cf5a..78561c35e528 100644
> --- a/Documentation/translations/zh_CN/core-api/printk-formats.rst
> +++ b/Documentation/translations/zh_CN/core-api/printk-formats.rst
> @@ -5,6 +5,7 @@
>  :翻译:
>  
>   司延腾 Yanteng Si <siyanteng@loongson.cn>
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
>  
>  .. _cn_printk-formats.rst:
>  
> @@ -548,7 +549,7 @@ nodemask_pr_args()来方便打印cpumask和nodemask。
>  
>  ::
>  
> -	%pGp	referenced|uptodate|lru|active|private|node=0|zone=2|lastcpupid=0x1fffff
> +	%pGp	0x17ffffc0002036(referenced|uptodate|lru|active|private|node=0|zone=2|lastcpupid=0x1fffff)
>  	%pGg	GFP_USER|GFP_DMA32|GFP_NOWARN
>  	%pGv	read|exec|mayread|maywrite|mayexec|denywrite
>  
> @@ -589,6 +590,16 @@ V4L2和DRM FourCC代码(像素格式)
>  	%p4cc	Y10  little-endian (0x20303159)
>  	%p4cc	NV12 big-endian (0xb231564e)
>  
> +Rust
> +----
> +
> +::
> +
> +       %pA
> +
> +仅用于Rust代码格式化``core::fmt::Arguments``。
> +不能用于C语言。
> +
>  谢谢
>  ====
>  
> -- 
> 2.20.1

