Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAE5C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jun 2022 16:11:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359492AbiFVQLf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jun 2022 12:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358156AbiFVQLc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 12:11:32 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEBCD3F89C
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=7NEnNwyVDJ9C17E09loXCyZpKeP9tiXlfFU7P
        Yh9W6Y=; b=jX9F9t5/I6GkRB06nYcmYwMytICf+vwPDHNSdJk0ccyhQNusDJD6D
        grVvBw6NQH+LqQyxxju6y12QYrQQ6COA1EYpY24p16iaCZWry8mAKS/hK9QZZ5E+
        dGl5JgZ6ck2LZmQZ52OcMdAOQkFTezBHX5+I06RQqj/uQuNl7uJzvA=
Received: from bobwxc.mipc (unknown [120.242.68.233])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgD3pmMrP7NigAsBAA--.1923S2;
        Thu, 23 Jun 2022 00:11:24 +0800 (CST)
Date:   Thu, 23 Jun 2022 00:11:23 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH 6/9] docs/zh_CN: core-api: Update the translation of
 printk-basics.rst to 5.19-rc3
Message-ID: <YrM/K6Qb6Tp3PTlR@bobwxc.mipc>
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <56c6d212d6835029b4adf19cf78eec49c7a126d6.1655863769.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <56c6d212d6835029b4adf19cf78eec49c7a126d6.1655863769.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: LCKnCgD3pmMrP7NigAsBAA--.1923S2
X-Coremail-Antispam: 1UD129KBjvdXoWruryxJw1DAF1xJFW8GrykZrb_yoW3Zrb_Za
        1kXF40va17Jr1xJw4rXF1rAr1I9F4Skr1F93Z8t3sxAas8WwsrGFyqv3s8XFW7Xan8uFZx
        Ca9rZ34a9rnxJjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbn8YjsxI4VW5JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRRsjbUUUU
        U
X-Originating-IP: [120.242.68.233]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 22, 2022 at 06:18:52PM +0800, Binbin Zhou wrote:
> Synchronous translation from upstream commit 7d9e2661f268
> ("printk: Move the printk() kerneldoc comment to its new home")
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  Documentation/translations/zh_CN/core-api/printk-basics.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/core-api/printk-basics.rst b/Documentation/translations/zh_CN/core-api/printk-basics.rst
> index d574de3167c8..59c6efb3fc41 100644
> --- a/Documentation/translations/zh_CN/core-api/printk-basics.rst
> +++ b/Documentation/translations/zh_CN/core-api/printk-basics.rst

