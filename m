Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E882EC43334
	for <linux-doc@archiver.kernel.org>; Wed,  8 Jun 2022 09:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234313AbiFHJLB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 8 Jun 2022 05:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234323AbiFHJKU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 8 Jun 2022 05:10:20 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E37E7FD3C
        for <linux-doc@vger.kernel.org>; Wed,  8 Jun 2022 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=NwHrZdkmP5LGZ1L/B+zi5f0BL6QjjLnkpdGfd
        nPJUsk=; b=i/A6fjxYG60A3Hu/Y7Vqc6N12wxcAat/ldY8hluEjL/QcNCIYC7Y1
        Z5JypxhKKL9a2G9HNRJS/POfjYmyOO/52NVCn2OToY/tdHKTVVgfEOhFaZRLZzPs
        J/OC7WcIRIsvZRKJXFlqj5EYJHA3Kp0zJuZtX4WkXRXbpBHoVA6h+Q=
Received: from bobwxc.mipc (unknown [120.242.68.162])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgB3oSM+XqBiMiQOAA--.42362S2;
        Wed, 08 Jun 2022 16:30:55 +0800 (CST)
Date:   Wed, 8 Jun 2022 16:30:54 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/3] docs/zh_CN: riscv: Update the translation of pmu.rst
 to 5.19-rc1
Message-ID: <YqBePpwX3BHZaMP5@bobwxc.mipc>
References: <cover.1654652729.git.zhoubinbin@loongson.cn>
 <1789c7e38c5d2dfc35a0a0cedf71891a65bd776f.1654652729.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1789c7e38c5d2dfc35a0a0cedf71891a65bd776f.1654652729.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: LCKnCgB3oSM+XqBiMiQOAA--.42362S2
X-Coremail-Antispam: 1UD129KBjvdXoWruryxJw1UCF1UGryDKFyfZwb_yoW3GrX_ZF
        Z2qF4kCF1UXrW8Ja18Xr1UJr1xZF4IgrW8ZF1Dtan8Jr9rK34DZ34qq398ZFW5ZFZ8Zryf
        GrWxZ3sYyF1xCjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYxYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1U
        Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIecxEwVAFwVW8ZwCF04k20x
        vY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4U
        MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
        AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
        cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
        80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
        43ZEXa7IUUJ73PUUUUU==
X-Originating-IP: [120.242.68.162]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Binbin,

Maybe "docs/zh_CN: Drop zh_CN/riscv/pmu.rst" is a clearer subject.
It isn't an actual update...

Thanks,
	Wu

On Wed, Jun 08, 2022 at 11:04:14AM +0800, Binbin Zhou wrote:
> Synchronous translation from the following:
> 
> [1]: commit 23b1f18326ec("Documentation: riscv:
>      Remove the old documentation")
> 
> [2]: commit 8933e7f2e375 ("Documentation: riscv: remove
>      non-existent directory from table of contents")
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
> ---
>  .../translations/zh_CN/riscv/index.rst        |   1 -
>  .../translations/zh_CN/riscv/pmu.rst          | 235 ------------------
>  2 files changed, 236 deletions(-)
>  delete mode 100644 Documentation/translations/zh_CN/riscv/pmu.rst
[...]

