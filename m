Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED448C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 23 Jun 2022 16:10:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231656AbiFWQKq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Jun 2022 12:10:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbiFWQKq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Jun 2022 12:10:46 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA7BC4504F
        for <linux-doc@vger.kernel.org>; Thu, 23 Jun 2022 09:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=eLVqM+jFX2CEGTAYnumZHVmVchHWBU7qJR2oe
        X0cuBM=; b=OsZpXzt4QYIiesalJAM2lIWcTjne2V67lLw87XUl4m/m80/4zLsE6
        lsrKbMT4utEDtJ4C5wTfjMl0Np+ygxAHn0wsDFDRCWtzBeHGYxreIBxc+o2JbFNT
        7IBJDdSLAby3iRxcnZ7ZlmtF1vr5YzkcRC8HgShOR8wDGgR9AX13vA=
Received: from bobwxc.mipc (unknown [120.242.71.141])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgD3pmN3kLRiS0ADAA--.7266S2;
        Fri, 24 Jun 2022 00:10:32 +0800 (CST)
Date:   Fri, 24 Jun 2022 00:10:31 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH 9/9] docs/zh_CN: core-api: Update the translation of
 xarray.rst to 5.19-rc3
Message-ID: <YrSQd6mnAxb1e+i+@bobwxc.mipc>
References: <cover.1655863769.git.zhoubinbin@loongson.cn>
 <b7d5f3ca914667ec14ba35a7c0db3ec3506e670d.1655863769.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b7d5f3ca914667ec14ba35a7c0db3ec3506e670d.1655863769.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: LCKnCgD3pmN3kLRiS0ADAA--.7266S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XFWrXFyfCry7WFW3uF4xXrb_yoW3WFc_Za
        1kJF4Iya1UJr1xta1rXF18Jr1UuFZYkw1F9wn8t3y3Aas0g397GryDXa9xXayDXFsxuF43
        CFZrZr4S9rnxXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbY8YjsxI4VW7JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
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
        yTuYvjTRQqXlUUUUU
X-Originating-IP: [120.242.71.141]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 22, 2022 at 06:19:49PM +0800, Binbin Zhou wrote:
> Synchronous translation from upstream commit ac23d1a96460
> ("XArray: Document the locking requirement for the xa_state")
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks!
	Wu

> ---
>  Documentation/translations/zh_CN/core-api/xarray.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/core-api/xarray.rst b/Documentation/translations/zh_CN/core-api/xarray.rst
> index ff2d9bcb7c34..fb19324966ce 100644
> --- a/Documentation/translations/zh_CN/core-api/xarray.rst
> +++ b/Documentation/translations/zh_CN/core-api/xarray.rst

