Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A378C43334
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jun 2022 13:11:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231339AbiFWNLs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jun 2022 09:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231641AbiFWNLq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jun 2022 09:11:46 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D220230554
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 06:11:45 -0700 (PDT)
Received: from [192.168.100.8] (unknown [112.20.108.207])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxH9qPZrRiQKlWAA--.396S3;
        Thu, 23 Jun 2022 21:11:44 +0800 (CST)
Message-ID: <c84bc8b4-4b84-9dc8-3288-e704602a5e8c@loongson.cn>
Date:   Thu, 23 Jun 2022 21:11:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 3/9] docs/zh_CN: core-api: Update the translation of
 irq/irq-domain.rst to 5.19-rc3
To:     Binbin Zhou <zhoubinbin@loongson.cn>, alexs@kernel.org
Cc:     corbet@lwn.net, chenhuacai@loongson.cn, bobwxc@email.cn,
        linux-doc@vger.kernel.org
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <eb82606f323c4c25e497a01a060e1e76f18be72f.1655863769.git.zhoubinbin@loongson.cn>
From:   YanTeng Si <siyanteng@loongson.cn>
In-Reply-To: <eb82606f323c4c25e497a01a060e1e76f18be72f.1655863769.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxH9qPZrRiQKlWAA--.396S3
X-Coremail-Antispam: 1UD129KBjvJXoWxWry5Gr1ruw4DAr43KF1kuFg_yoWrCF4rpF
        42g3y3Gw43Jr1jqrWkWr1UXw1ftryxGanFkan8JF9rXF95A392kr4DtFy5GrW7Ar9aqFW2
        vF1SgrW8uF1Yka7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCYjI0SjxkI62AI1cAE67vI
        Y487MxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
        C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
        wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
        v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r4j6FyUMIIF0xvEx4A2
        jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
        ZFpf9x0JUSJP_UUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2022/6/22 18:18, Binbin Zhou 写道:
> Synchronous translation from the following commits(Latest in front):
>
> [1]: commit 0953fb263714("irq: remove handle_domain_{irq,nmi}()")
>
> [2]: commit 0ddc5e55e6f1("Documentation: Fix irq-domain.rst build warning")
>
> [3]: commit 991007ba6cca("Documentation: Update
>       irq_domain.rst with new lookup APIs")
>
> [4]: commit 405e94e9aed2("irqdomain: Kill irq_domain_add_legacy_isa")
>
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Yanteng Si<siyanteng@loongson.cn>

Thanks,
Yantneg

> ---
>   .../zh_CN/core-api/irq/irq-domain.rst         | 22 +++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> index 7d077742f758..9174fce12c1b 100644
> --- a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> +++ b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> @@ -5,6 +5,7 @@
>   :翻译:
>   
>    司延腾 Yanteng Si <siyanteng@loongson.cn>
> + 周彬彬 Binbin Zhou <zhoubinbin@loongson.cn>
>   
>   .. _cn_irq-domain.rst:
>   
> @@ -52,8 +53,18 @@ irq_domain和一个hwirq号作为参数。 如果hwirq的映射还不存在，
>   一个新的Linux irq_desc，将其与hwirq关联起来，并调用.map()回调，这样驱动
>   程序就可以执行任何必要的硬件设置。
>   
> -当接收到一个中断时，应该使用irq_find_mapping()函数从hwirq号中找到
> -Linux IRQ号。
> +一旦建立了映射，可以通过多种方法检索或使用它：
> +
> +- irq_resolve_mapping()返回一个指向给定域和hwirq号的irq_desc结构指针，
> +  如果没有映射则返回NULL。
> +
> +- irq_find_mapping()返回给定域和hwirq的Linux IRQ号，如果没有映射则返回0。
> +
> +- irq_linear_revmap()现与irq_find_mapping()相同，已被废弃。
> +
> +- generic_handle_domain_irq()处理一个由域和hwirq号描述的中断。
> +
> +请注意，irq域的查找必须发生在与RCU读临界区兼容的上下文中。
>   
>   在调用irq_find_mapping()之前，至少要调用一次irq_create_mapping()函数，
>   以免描述符不能被分配。
> @@ -119,7 +130,8 @@ irq_domain_add_tree()和irq_domain_create_tree()在功能上是等价的，除
>   Linux IRQ号编入硬件本身，这样就不需要映射了。 调用irq_create_direct_mapping()
>   会分配一个Linux IRQ号，并调用.map()回调，这样驱动就可以将Linux IRQ号编入硬件中。
>   
> -大多数驱动程序不能使用这个映射。
> +大多数驱动程序无法使用此映射，现在它由CONFIG_IRQ_DOMAIN_NOMAP选项控制。
> +请不要引入此API的新用户。
>   
>   传统映射类型
>   ------------
> @@ -128,7 +140,6 @@ Linux IRQ号编入硬件本身，这样就不需要映射了。 调用irq_create
>   
>   	irq_domain_add_simple()
>   	irq_domain_add_legacy()
> -	irq_domain_add_legacy_isa()
>   	irq_domain_create_simple()
>   	irq_domain_create_legacy()
>   
> @@ -137,6 +148,9 @@ Linux IRQ号编入硬件本身，这样就不需要映射了。 调用irq_create
>   一组用于IRQ号的定义（#define），这些定义被传递给struct设备注册。 在这种情况下，
>   不能动态分配Linux IRQ号，应该使用传统映射。
>   
> +顾名思义，\*_legacy()系列函数已被废弃，只是为了方便对古老平台的支持而存在。
> +不应该增加新的用户。当\*_simple()系列函数的使用导致遗留行为时，他们也是如此。
> +
>   传统映射假设已经为控制器分配了一个连续的IRQ号范围，并且可以通过向hwirq号添加一
>   个固定的偏移来计算IRQ号，反之亦然。 缺点是需要中断控制器管理IRQ分配，并且需要为每
>   个hwirq分配一个irq_desc，即使它没有被使用。

