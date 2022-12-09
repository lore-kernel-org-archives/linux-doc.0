Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A201BC4332F
	for <linux-doc@archiver.kernel.org>; Fri,  9 Dec 2022 07:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiLIHLF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Dec 2022 02:11:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbiLIHLD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Dec 2022 02:11:03 -0500
Received: from out2.migadu.com (out2.migadu.com [188.165.223.204])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336A830F67
        for <linux-doc@vger.kernel.org>; Thu,  8 Dec 2022 23:11:02 -0800 (PST)
Date:   Fri, 9 Dec 2022 15:10:54 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670569860;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RLnMyolSAvgL+S/fmTi8eEyAZR7fE36ljZ7H4a4mJb8=;
        b=tMwLItIIY7quR6v0y2lmWrsIi4MTLrI9+R2ph/U2wT8OwHy8zBh48eaOmP0EtrtavED7om
        BV6oIByrQKEZJ4QEd+PoLNHBkoQysXsJq8B5ac43+dIjrT5K5BfY93GBWd9aNrqQWVmabv
        2S+nFPxmGVVhr4a732R7b+k0BzJTxEc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v1 12/13] docs/zh_CN: Update the translation of msi-howto
 to 6.1-rc8
Message-ID: <Y5Lffg4mOdLCRLkg@bobwxc.mipc>
References: <cover.1670502763.git.siyanteng@loongson.cn>
 <a7190e60bf716f5dbe70827b858c6b339d3a4e86.1670502763.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a7190e60bf716f5dbe70827b858c6b339d3a4e86.1670502763.git.siyanteng@loongson.cn>
X-Generator: review-reply, a very cute ai bot
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Update to commit 88614075a952 ("Documentation: PCI: Add reference
> to PCI/MSI device driver APIs")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Only found in next tree.

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  Documentation/translations/zh_CN/PCI/msi-howto.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/translations/zh_CN/PCI/msi-howto.rst b/Documentation/translations/zh_CN/PCI/msi-howto.rst
> index 7ea4d50cdad2..1b9b5ea790d8 100644
> --- a/Documentation/translations/zh_CN/PCI/msi-howto.rst
> +++ b/Documentation/translations/zh_CN/PCI/msi-howto.rst
> @@ -231,3 +231,14 @@ ACPI FADT表中指明了它。在这种情况下，Linux会自动禁用MSI。有
>  
>  也需要检查设备驱动程序，看它是否支持MSI。例如，它可能包含对带有PCI_IRQ_MSI或
>  PCI_IRQ_MSIX标志的pci_alloc_irq_vectors（）的调用。
> +
> +
> +MSI(-X) APIs设备驱动程序列表
> +============================
> +
> +PCI/MSI子系统有一个专门的C文件，用于其导出的设备驱动程序APIs - `drivers/pci/msi/api.c` 。
> +以下是导出的函数:
> +
> +该API在以下内核代码中:
> +
> +drivers/pci/msi/api.c
> -- 
> 2.31.1
> 
