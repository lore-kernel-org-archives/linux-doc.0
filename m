Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06780C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jun 2022 16:10:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbiFWQKs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jun 2022 12:10:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230329AbiFWQKr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jun 2022 12:10:47 -0400
Received: from email.cn (m218-153.88.com [110.43.218.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D337F4504F
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 09:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=RlTH8oer/+sx89CfdO0lvOjEBSKlBKCfw0S40
        wTfopw=; b=imcW7SFdQ2YcwJjbI8WOvDrZY9+TXyxR3HakQ57QpdIQduPI1JVYr
        lv385wnzpqx5JSx1I8ZTWYFepxTvE/kn959x0VfE3Q14C+vO7F8wki+rUxzZk/LG
        RmPwvqLFyfnDVeou3TtMQyouFz7wmc2OdXKQrBFW6HheerepvXhCj8=
Received: from bobwxc.mipc (unknown [120.242.71.141])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBH7hJ+kLRi1vYZAA--.8687S2;
        Fri, 24 Jun 2022 00:10:39 +0800 (CST)
Date:   Fri, 24 Jun 2022 00:10:38 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/9] docs/zh_CN: core-api: Update the translation of
 kernel-api.rst to 5.19-rc3
Message-ID: <YrMI3pg0yhU50RHx@bobwxc.mipc>
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <9173878562404f4518fecc7c55032fe815f87fd9.1655863769.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9173878562404f4518fecc7c55032fe815f87fd9.1655863769.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: GiKnCgBH7hJ+kLRi1vYZAA--.8687S2
X-Coremail-Antispam: 1UD129KBjvdXoWruryxJw1DAF1DurWktFWDArb_yoW3GFc_ZF
        4kXF40ya18Zr1xtw1rJ3W8Jr109F4SkwnYgwn8t398A3s8Gw4kGryDZas5ZF4DXrs8ursx
        CFWDur9a9rnrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbY8YjsxI4VW5JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVWUMxAIw28Icx
        kI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l
        x2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14
        v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IY
        x2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87
        Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIF
        yTuYvjTRmXd1UUUUU
X-Originating-IP: [120.242.71.141]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 22, 2022 at 06:18:50PM +0800, Binbin Zhou wrote:
> Synchronous translation from upstream commit 640d1930bef4
> ("block: Add bio_for_each_folio_all()")
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  Documentation/translations/zh_CN/core-api/kernel-api.rst | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/translations/zh_CN/core-api/kernel-api.rst b/Documentation/translations/zh_CN/core-api/kernel-api.rst
> index e45fe80d1cd8..120c051f6fcb 100644
> --- a/Documentation/translations/zh_CN/core-api/kernel-api.rst
> +++ b/Documentation/translations/zh_CN/core-api/kernel-api.rst

