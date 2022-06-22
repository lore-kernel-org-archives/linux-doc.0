Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A75F4C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jun 2022 12:19:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236286AbiFVMTm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jun 2022 08:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236335AbiFVMTl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 08:19:41 -0400
Received: from email.cn (m218-153.88.com [110.43.218.153])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E4333E03
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 05:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=2f3gB8ka+DdhA+jgdiLe+wOZ8dtxyI7+1Nb0K
        I0ddDk=; b=J6AmOHWu+E7wbuDv9kmH+fcHWYurVjYXeRlEgZO0VVbkBW81ORq2h
        /rF3iMXx+0P4+EjZCoy+hoSOaMxbC/mlzMfodM79Psjg6wEdtfxn13W20cSQr2sJ
        Kp44XUJAeM8Yj9a1BzqRri94AfwPOHZOL1nj+SjE/UUD63/MVhQe6A=
Received: from bobwxc.mipc (unknown [120.242.68.233])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBX_xPWCLNiNBoXAA--.2361S2;
        Wed, 22 Jun 2022 20:19:35 +0800 (CST)
Date:   Wed, 22 Jun 2022 20:19:32 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH 3/9] docs/zh_CN: core-api: Update the translation of
 irq/irq-domain.rst to 5.19-rc3
Message-ID: <YrMI1IFmTT/0s4wl@bobwxc.mipc>
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <eb82606f323c4c25e497a01a060e1e76f18be72f.1655863769.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eb82606f323c4c25e497a01a060e1e76f18be72f.1655863769.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: GiKnCgBX_xPWCLNiNBoXAA--.2361S2
X-Coremail-Antispam: 1UD129KBjvdXoWruryxJw13Zr47GF1xKF1xZrb_yoWDKFg_ZF
        n7tFWF93WUJFn5Wa1rXF15ZryUua1F93WF9a4qyFy5C3s8Kw4kGF1DXa95ZF47XwsxZrZx
        CF97ZrnayrnrXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbn8YjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj4RRbyZUUUU
        U
X-Originating-IP: [120.242.68.233]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 22, 2022 at 06:18:49PM +0800, Binbin Zhou wrote:
> Synchronous translation from the following commits(Latest in front):
> 
> [1]: commit 0953fb263714("irq: remove handle_domain_{irq,nmi}()")
> 
> [2]: commit 0ddc5e55e6f1("Documentation: Fix irq-domain.rst build warning")
> 
> [3]: commit 991007ba6cca("Documentation: Update
>      irq_domain.rst with new lookup APIs")
> 
> [4]: commit 405e94e9aed2("irqdomain: Kill irq_domain_add_legacy_isa")
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../zh_CN/core-api/irq/irq-domain.rst         | 22 +++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> index 7d077742f758..9174fce12c1b 100644
> --- a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
> +++ b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst

