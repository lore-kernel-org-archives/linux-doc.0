Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303C1C43334
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jun 2022 16:11:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358051AbiFVQLe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jun 2022 12:11:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376364AbiFVQLa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 12:11:30 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FE7E3F324
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 09:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=2M5oOUwCwe6dDsq0d5TsDjA+j5Kmg2UJXuBAy
        Mr5yS4=; b=RPLjHyq0iSIpl8ieN6FRwJBF1XMxfj2AnldZujOw7gFJ0hDLaTLIB
        STY1o92UB3jT/lnWKvg6l2+GMpJvKqpDGFWAqpzkaOTVvDBAT9eIEs5diuilt3JA
        o+xCGT62vS5VjisxfzqUeKIhYynTjPjw0Forlqpn7D9tjPjICrOfnk=
Received: from bobwxc.mipc (unknown [120.242.68.233])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDnl2QkP7NicQsBAA--.3233S2;
        Thu, 23 Jun 2022 00:11:17 +0800 (CST)
Date:   Thu, 23 Jun 2022 00:11:16 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH 5/9] docs/zh_CN: core-api: Update the translation of
 mm-api.rst to 5.19-rc3
Message-ID: <YrM/JBPRwcRBlxTh@bobwxc.mipc>
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <0bd7b03a5d38dd1599715343360bef4289b7c0fb.1655863769.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0bd7b03a5d38dd1599715343360bef4289b7c0fb.1655863769.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: LCKnCgDnl2QkP7NicQsBAA--.3233S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4rXFW3Xw4DZF4kWF1xKrg_yoWDAFb_ZF
        4ktFW8C3WUXFyxJayrJw48Ary8ua1Fgw1Y9Fn8t345Ca4Duws7W34DZF95ZF17Jws8ur43
        CFWkZrnavrnrXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb0AYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0zR_Oz3UUUUU
        =
X-Originating-IP: [120.242.68.233]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 22, 2022 at 06:18:51PM +0800, Binbin Zhou wrote:
> Synchronous translation from the following commits(Latest in front):
> 
> [1]: commit 84dacdbd5352("mm: document and polish read-ahead code")
> 
> [2]: commit 2f52578f9c64("mm/util: Add folio_mapping() and
>      folio_file_mapping()")
> 
> [3]: commit 889a3747b3b7("mm/lru: Add folio LRU functions")
> 
> [4]: commit c24016ac3a62("mm: Add folio reference count functions")
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

>  .../translations/zh_CN/core-api/mm-api.rst    | 23 ++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/core-api/mm-api.rst b/Documentation/translations/zh_CN/core-api/mm-api.rst
> index 0ea43dc67953..a732b0eebf16 100644
> --- a/Documentation/translations/zh_CN/core-api/mm-api.rst
> +++ b/Documentation/translations/zh_CN/core-api/mm-api.rst

