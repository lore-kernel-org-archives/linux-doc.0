Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918F0C00140
	for <linux-doc@archiver.kernel.org>; Tue, 26 Jul 2022 16:20:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiGZQUW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jul 2022 12:20:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239222AbiGZQUU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 12:20:20 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 983DE271C
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 09:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=kLjI5/AxDNrCF1b2N8KQOA+ZYYY8uMEmsklNZ
        rNmdb8=; b=JC3sGGYPdv6wQXvUvO+ewrX8X/AP87QKj4CsbUuVK7gTDJT3GN88j
        PuHePdHR1G8hXjkCKtklvRwvizhAS/iTcl4toFQevGafd72r5Xe2/VgWPW9Xj6T/
        scOFBZ1k7qBb3OMM5BBVAz3jMgTa129s+2SZeGhFpZnRteIyoYEPHc=
Received: from bobwxc.mipc (unknown [120.242.71.147])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDnl2QlFOBi2AtCAA--.25934S2;
        Wed, 27 Jul 2022 00:19:51 +0800 (CST)
Date:   Wed, 27 Jul 2022 00:19:47 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
Subject: Re: [PATCH 7/8] Docs/zh_CN: Update the translation of pci to 5.19-rc8
Message-ID: <YuAFKsr6Gimu5LDg@bobwxc.mipc>
References: <cover.1658740151.git.siyanteng@loongson.cn>
 <d6b56714f443f13fed9ed6618fb0788fe7d3caaa.1658740151.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d6b56714f443f13fed9ed6618fb0788fe7d3caaa.1658740151.git.siyanteng@loongson.cn>
X-CM-TRANSID: LCKnCgDnl2QlFOBi2AtCAA--.25934S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kr17JFWDWry5WryUZr13urg_yoW8KF1fpr
        Z7Wa4xGa12v3WIgwnY9rW8Xr1xWa9I9F1UCr4Ut3ZxJw1vq3ykAw1YyF12gFyxXryIvFWI
        qan2kryYvryxZr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyvb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26F4U
        Jr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2
        xKxwCY02Avz4vE14v_JwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1U
        MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
        AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
        0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4
        v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
        xVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUbHGQDUUUUU==
X-Originating-IP: [120.242.71.147]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 25, 2022 at 05:24:35PM +0800, Yanteng Si wrote:
> Update to commit f21949c14968 ("PCI/doc:Update
> obsolete pci_set_dma_mask() references")
> 
> 05b0ebd06ae6 ("PCI/doc: cleanup references to
> the legacy PCI DMA API")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,
	Wu

> ---
>  Documentation/translations/zh_CN/PCI/pci.rst | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/translations/zh_CN/PCI/pci.rst b/Documentation/translations/zh_CN/PCI/pci.rst
> index 520707787256..83c2a41d38d3 100644
> --- a/Documentation/translations/zh_CN/PCI/pci.rst
> +++ b/Documentation/translations/zh_CN/PCI/pci.rst
> @@ -255,13 +255,13 @@ pci_set_master()将通过设置PCI_COMMAND寄存器中的总线主控位来启
>  
>  虽然所有的驱动程序都应该明确指出PCI总线主控的DMA功能（如32位或64位），但对于流式
>  数据来说，具有超过32位总线主站功能的设备需要驱动程序通过调用带有适当参数的
> -``pci_set_dma_mask()`` 来“注册”这种功能。一般来说，在系统RAM高于4G物理地址的情
> +``dma_set_mask()`` 来“注册”这种功能。一般来说，在系统RAM高于4G物理地址的情
>  况下，这允许更有效的DMA。
>  
> -所有PCI-X和PCIe兼容设备的驱动程序必须调用 ``pci_set_dma_mask()`` ，因为它们
> +所有PCI-X和PCIe兼容设备的驱动程序必须调用 ``dma_set_mask()`` ，因为它们
>  是64位DMA设备。
>  
> -同样，如果设备可以通过调用 ``pci_set_consistent_dma_mask()`` 直接寻址到
> +同样，如果设备可以通过调用 ``dma_set_coherent_mask()`` 直接寻址到
>  4G物理地址以上的系统RAM中的“一致性内存”，那么驱动程序也必须“注册”这种功能。同
>  样，这包括所有PCI-X和PCIe兼容设备的驱动程序。许多64位“PCI”设备（在PCI-X之前）
>  和一些PCI-X设备对有效载荷（“流式”）数据具有64位DMA功能，但对控制（“一致性”）数
> -- 
> 2.31.1

