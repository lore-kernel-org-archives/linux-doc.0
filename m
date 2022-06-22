Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48C5DC433EF
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jun 2022 12:19:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234348AbiFVMTW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jun 2022 08:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234717AbiFVMTT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 08:19:19 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48EBC1A3AF
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 05:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=+ORtab8Ci8lhyDXRCW7fUmpJHZbdhx32B1k/a
        wez7Xo=; b=D8WNdCuvJ5tr4qbcukwiqX3uqX33jFlVUmX6B6C2dDHmT1QGsQFix
        XnqEkkMjkHd8/lx2I1TYDC2dJ+PYwWvT0zIKrZtk8ph2svHOAvVWnb9xnV259fDJ
        y4u1SE+zMuqtzufSt4y+14knAhK6UmvThdbC/89ud6Ry33kIaiLmh8=
Received: from bobwxc.mipc (unknown [120.242.68.233])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAn2GS6CLNiHroAAA--.2289S2;
        Wed, 22 Jun 2022 20:19:07 +0800 (CST)
Date:   Wed, 22 Jun 2022 20:19:04 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/9] docs/zh_CN: core-api: Update the translation of
 cachetlb.rst to 5.19-rc3
Message-ID: <YrMIuE3jmYE9aDLI@bobwxc.mipc>
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <d1fe8dfa3cfc3fe38c7caf8b5cf3b3482b5bddf8.1655863769.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d1fe8dfa3cfc3fe38c7caf8b5cf3b3482b5bddf8.1655863769.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: LCKnCgAn2GS6CLNiHroAAA--.2289S2
X-Coremail-Antispam: 1UD129KBjvdXoWruryxJw1DAFWfCry3ury5CFg_yoW3Jrc_Za
        n7tFW0ya17Xr1xta1rGr18JF4UZF4F9w1Fgr1Dt3y5Aa4qgw4DWa4DXr95ZFW5JFs8uFZx
        CFZrZr4S9rnrWjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb0AYjsxI4VW7JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw28IcxkI7VAKI48JMxAIw2
        8IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
        xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrx
        kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
        6r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0pRiZ2fUUUUU
        =
X-Originating-IP: [120.242.68.233]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 22, 2022 at 06:18:47PM +0800, Binbin Zhou wrote:
> Synchronous translation from upstream commit 08b0b0059bf1
> ("mm: Add flush_dcache_folio()")
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  Documentation/translations/zh_CN/core-api/cachetlb.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/translations/zh_CN/core-api/cachetlb.rst b/Documentation/translations/zh_CN/core-api/cachetlb.rst
> index 6fee45fe5e80..b4a76ec75daa 100644
> --- a/Documentation/translations/zh_CN/core-api/cachetlb.rst
> +++ b/Documentation/translations/zh_CN/core-api/cachetlb.rst

